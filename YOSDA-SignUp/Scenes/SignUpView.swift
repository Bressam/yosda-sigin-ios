//
//  ContentView.swift
//  YOSDA-SignUp
//
//  Created by Giovanne Bressam on 09/05/24.
//

import SwiftUI
import AuthenticationServices

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    @State private var storePassword: Bool = true
    
    var body: some View {
        VStack(spacing: -30) {
            HeaderView(colors: [
                .init(red: 26 / 255, green: 4 / 255, blue: 58 / 255),
                .init(red: 69 / 255, green: 23 / 255, blue: 181 / 255)
            ]).frame(height: 360)
            ZStack {
                BottomSheet(title: "Crie sua conta" ) {
                    VStack(alignment: .leading,
                           spacing: SpacingConstants.medium.constant) {
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
            }
        }.ignoresSafeArea()
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Oups!"),
                      message: Text("Not implemented yet :("),
                      dismissButton: .cancel())
            }
        
    }

    private var siginInTipView: some View {
        HStack(alignment: .center) {
            Spacer()
            Text("Já possui uma conta?")
                .foregroundStyle(.gray)
            Button("Entre", action: { showingAlert = true })
            Spacer()
        }
    }

    private var storePasswordSwitch: some View {
        HStack {
            Toggle(isOn: $storePassword, label: {
                Text("Lembrar minha senha")
                    .font(.callout)
            })
        }
    }
    
    private var buttonsStack: some View {
        VStack {
            PrimaryButton(buttonTitle: "Criar conta",
                          buttonAction: { showingAlert = true })
            .frame(height: ButtonSizeConstants.big.constant)
            
            SignInWithAppleButton(
                onRequest: { request in
                    showingAlert = true
                },
                onCompletion: { result in
                    //
                }
            ).frame(height: ButtonSizeConstants.big.constant)
            siginInTipView
        }
    }
}

#Preview {
    SignUpView()
}
