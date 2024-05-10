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
                    VStack(alignment: .leading,
                           spacing: SpacingConstants.big.constant) {
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

#Preview {
    ContentView()
}
