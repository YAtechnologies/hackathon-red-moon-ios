//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import SwiftUI
import YassirUI

struct ShortcutView: View {
    
    var shortcut: Shortcut
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 120, height: 68)
                    .cornerRadius(16)
                    .shadow(color: Color(UIColor.gray800).opacity(0.08), radius: 4, x: 0, y: 1)
                ImageView(url: shortcut.imageURL)
                    .aspectRatio(1, contentMode: .fill)
                    .frame(width: 56, height: 56)
            }
            Text(shortcut.title ?? "")
                .foregroundColor(Color(.gray900))
                .font(Font(UIFont.preferredFont(forYassirTextStyle: TextStyle.Caption.semibold) as CTFont))
        }
    }
    
}
