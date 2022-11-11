

//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import SwiftUI
import YassirUI

typealias OnBannerEmit = ((Banner) -> Void)?

struct SliderView: View {
    
    @ObservedObject var viewModel: SliderViewModel
    
    var action: OnBannerEmit = nil
    
    var body: some View {
        VStack (alignment: .leading, spacing: 16){
            VStack (alignment: .leading, spacing: 4){
                
                if viewModel.slider.displayTitle {
                    viewModel.slider.title.map { title in
                        Text(title)
                            .lineLimit(1)
                            .foregroundColor(Color(.gray900))
                            .font(Font(UIFont.preferredFont(forYassirTextStyle: TextStyle.Title.title3) as CTFont))
                    }
                }
                if viewModel.slider.displayDescription {
                    viewModel.slider.description.map { description in
                        Text(description)
                            .foregroundColor(Color(.gray900))
                            .font(Font(UIFont.preferredFont(forYassirTextStyle: TextStyle.Subtitle.regular) as CTFont))
                            .lineLimit(2)
                            .padding(.top, 6)
                    }
                }
            }
            .padding(.horizontal, 16)
            if viewModel.slider.banners.count == 1, let banner = viewModel.slider.banners[0]{
                VStack {
                    BannerView(banner: banner, bannerImageWidth: UIScreen.main.bounds.width - 32, bannerImageHeight: (UIScreen.main.bounds.width - 32) / 2.19)
                        .onTapGesture {
                            action?(banner)
                        }
                }
                .padding(.horizontal, 16)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(viewModel.slider.banners) { banner in
                            VStack {
                                BannerView(banner: banner, bannerImageWidth: UIScreen.main.bounds.width - 56, bannerImageHeight: (UIScreen.main.bounds.width - 56) / 2.03)
                                    .onTapGesture {
                                        action?(banner)
                                    }
                            }
                            .padding(.leading, banner.id == viewModel.slider.banners.first?.id ? 16: 12)
                            .padding(.trailing, banner.id == viewModel.slider.banners.last?.id ? 16: 12)
                        }
                    }
                }
            }
        }
        .padding(.vertical, 16)
    }
    
    func onEmit(perform action: OnBannerEmit) -> Self {
        var copy = self
        copy.action = action
        return copy
    }
}

