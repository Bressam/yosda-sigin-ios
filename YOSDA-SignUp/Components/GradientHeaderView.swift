//
//  GradientHeaderView.swift
//  YOSDA-SignUp
//
//  Created by Giovanne Bressam on 10/05/24.
//

import SwiftUI

struct HeaderView: View {
    @State var colors: [Color]
    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
                )
            Image("yosda-logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    HeaderView(colors: [
        .init(red: 26 / 255, green: 4 / 255, blue: 58 / 255),
        .init(red: 69 / 255, green: 23 / 255, blue: 181 / 255)
    ]).frame(height: 360)
}
