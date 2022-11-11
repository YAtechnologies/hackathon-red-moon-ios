//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import SwiftUI
import YassirUI

struct LoadingView: View {
    var body: some View {
        GeometryReader { proxy in
            let titleWidth = proxy.size.width - (proxy.size.width * 0.35)
            let circleWidth = (proxy.size.width - 80) / 4
            VStack (alignment: .leading, spacing: 0){
                ShimmerView()
                    .frame(height: 100)
                    .padding(.bottom, 32)
                
                ShimmerView()
                    .frame(width: titleWidth, height: 16)
                    .padding(.bottom, 14)
                
                ShimmerView()
                    .frame(height: 16)
                    .padding(.bottom, 24)
                VStack(spacing: 16) {
                    HStack(spacing: 16) {
                        ForEach(0..<4){ _ in
                            ServicePlaceHolderView(circleWidth: circleWidth)
                        }
                    }
                    HStack(spacing: 16) {
                        ForEach(0..<4){ _ in
                            ServicePlaceHolderView(circleWidth: circleWidth)
                        }
                    }
                }
                .padding(.bottom, 48)
                ShimmerView()
                    .frame(height: 74)
                    .padding(.bottom, 24)
                
                ShimmerView()
                    .frame(width: titleWidth, height: 16)
                    .padding(.bottom, 12)
                
                ShimmerView()
                    .frame(height: 16)
                    .padding(.bottom, 24)
                ShimmerView()
                    .frame(height: 100)
                    .padding(.bottom, 24)
                
            }
            .padding()
        }
    }
}

struct ServicePlaceHolderView: View {
    var circleWidth: CGFloat
    var body: some View {
        VStack(spacing: 16) {
            ShimmerView(cornerRadius: circleWidth/2)
                .frame(width: circleWidth, height: circleWidth)
            ShimmerView(cornerRadius: 2)
                .frame(width: circleWidth, height: 12)
        }
    }
}

struct LoadinView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

