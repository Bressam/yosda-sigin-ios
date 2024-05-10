//
//  ContentView.swift
//  YOSDA-SignIn
//
//  Created by Giovanne Bressam on 09/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State private var showingAlert = false

    var body: some View {
        ZStack {
            // Background image
            Color.blue
            ZStack {
                BottomSheet(title: "Crie sua conta" ) {
                    VStack(alignment: .leading, spacing: 22) {
                        PrimaryTextField(fieldTitle: "E-mail",
                                         inputText: email)
                        PrimaryTextField(fieldTitle: "Senha",
                                         inputText: password,
                                         buttonTitle: "Recuperar senha") {
                            showingAlert = true
                        }
                        Spacer()
                    }
                }
            }.padding(.top, 300)
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Oups!"),
                      message: Text("Not implemented yet :("),
                      dismissButton: .cancel())
            }
        }.ignoresSafeArea()
    }
}

struct PrimaryTextField: View {
    @State var fieldTitle: String
    @State var inputText: String
    @State var buttonTitle: String? = nil
    var buttonAction: (() -> Void)? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(fieldTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                if let buttonTitle,
                   let buttonAction {
                    Spacer()
                    Button(action: buttonAction, label: {
                        Text(buttonTitle)
                    })
                }
            }
            
            TextField("", text: $inputText)
                .overlay {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(.highlight, lineWidth: 2)
                        .frame(height: 38)
                }
        }
    }
}

struct BottomSheet<Content> : View where Content : View {
    @State var title: String
    var content: (() -> Content)

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
            VStack(alignment: .leading, spacing: 24) {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                content()
            }
            .padding(.top, 32)
            .padding([.leading, .trailing], 16)
        }
    }
}

#Preview {
    ContentView()
}
