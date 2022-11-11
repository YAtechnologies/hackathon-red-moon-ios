
//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import SwiftUI
import YassirUI

struct BannerView: View {
    let banner: Banner
    let bannerImageWidth: CGFloat
    let bannerImageHeight: CGFloat

    var body: some View {
        if (!banner.displayDescription && !banner.displayTitle) {
            ImageView(url: banner.imageURL)
                .scaledToFill()
                .frame(width: bannerImageWidth, height: bannerImageHeight)
                .cornerRadius(12)
                .clipped()
        } else {
            VStack(alignment: .leading, spacing: 8) {
                ImageView(url: banner.imageURL)
                    .scaledToFill()
                    .frame(width: bannerImageWidth, height: bannerImageHeight)
                    .cornerRadius(12)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 4) {
                    if banner.displayTitle {
                        Text(banner.title?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")
                            .lineLimit(2)
                            .foregroundColor(Color(.gray900))
                            .font(Font(UIFont.preferredFont(forYassirTextStyle: TextStyle.Subtitle.bold) as CTFont))
                    }
                    if banner.displayDescription {
                        Text(banner.description?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")
                            .lineLimit(1)
                            .foregroundColor(Color(.gray900))
                            .font(Font(UIFont.preferredFont(forYassirTextStyle: TextStyle.Body.regular) as CTFont))
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            }
            .frame(width: bannerImageWidth)
            .background(Color.white)
        }
    }
}
