//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import SwiftUI
import YassirUI

struct CircledButton: View {
    var text: String
    var foregroundColor: Color
    var backgroundColor: Color
    var width: CGFloat
    var height: CGFloat
    var lineWidth: CGFloat
    
    var body: some View {
        Text(text)
            .font(Font(TextStyle.Title.title1))
            .fontWeight(.bold)
            .foregroundColor(foregroundColor)
            .frame(width: width, height: height)
            .background(Circle()
                            .fill(backgroundColor)
                            .shadow(color: Color(UIColor.gray100), radius: 4, x: 0, y: 1)
            )
            .overlay(
                Circle()
                    .stroke(.white, lineWidth: lineWidth)
            )
    }
}
