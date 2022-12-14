//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import SwiftUI
import UIKit

struct ImageView: View {
    
    @ObservedObject var imageLoader: ImageLoader

    init(url: URL) {
        imageLoader = ImageLoader(url: url)
    }

    var body: some View {
        Image(uiImage: imageLoader.image)
                .resizable()
    }
    
}
