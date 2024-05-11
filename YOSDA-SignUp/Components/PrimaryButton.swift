//
//  PrimaryButton.swift
//  YOSDA-SignUp
//
//  Created by Giovanne Bressam on 10/05/24.
//

import SwiftUI

struct PrimaryButton: View {
    @State var buttonTitle: String
    @State var buttonAction: (() -> Void)
    
    var body: some View {
        Button(action: buttonAction) {
            ZStack {
                RoundedRectangle(cornerRadius: RadiusConstants.small.constant)
                    .foregroundStyle(.primaryBlue)
                Text(buttonTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }
        }.frame(height: ButtonSizeConstants.large.constant)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PrimaryButton(buttonTitle: "Field title", buttonAction: {})
        .padding()
}
