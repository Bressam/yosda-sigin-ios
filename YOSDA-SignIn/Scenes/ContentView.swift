//
//  ContentView.swift
//  YOSDA-SignIn
//
//  Created by Giovanne Bressam on 09/05/24.
//

import SwiftUI
import AuthenticationServices

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    @State private var storePassword: Bool = true

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
                                         buttonTitle: "Recuperar senha",
                                         isSecured: true,
                                         hasSecurityToggle: true) {
                            showingAlert = true
                        }
                        storePasswordSwitch
                        buttonsStack
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
    
    private var storePasswordSwitch: some View {
        HStack {
            Toggle(isOn: $storePassword, label: {
                Text("Lembrar minha senha")
            })
        }
    }
    
    private var buttonsStack: some View {
        VStack {
            PrimaryButton(buttonTitle: "Criar conta",
                          buttonAction: {})
            .frame(height: ButtonSizeConstants.big.constant)
            
            SignInWithAppleButton(
                onRequest: { request in
                    //
                },
                onCompletion: { result in
                    //
                }
            ).frame(height: ButtonSizeConstants.big.constant)
        }
    }
}

#Preview {
    ContentView()
}
