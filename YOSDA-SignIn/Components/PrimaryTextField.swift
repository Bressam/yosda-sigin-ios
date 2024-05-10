//
//  PrimaryTextField.swift
//  YOSDA-SignIn
//
//  Created by Giovanne Bressam on 09/05/24.
//

import SwiftUI

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

#Preview(traits: .sizeThatFitsLayout) {
    PrimaryTextField(fieldTitle: "Field title", inputText: "")
        .padding(24)
}
