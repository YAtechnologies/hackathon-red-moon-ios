//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import SwiftUI
import YassirUI

struct ShimmerView: View {
    var duration: Double = 1.25
    var maxOpacity: Double = 1.0
    var cornerRadius: CGFloat = 4.0
    @State private var opacity: Double = 0.25
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(Color(UIColor.gray50))
            .opacity(opacity)
            .transition(.opacity)
            .onAppear {
                let baseAnimation = Animation.easeInOut(duration: duration)
                let repeated = baseAnimation.repeatForever(autoreverses: true)
                withAnimation(repeated) {
                    self.opacity = maxOpacity
                }
            }
    }
}
