//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import SwiftUI
import YassirUI

struct EmptyStateView: View {
    var imageName: ImageName?
    var title: String?
    var message: String?
    
    var body: some View {
        VStack {
            if let imageName = imageName {
                Image(imageName: imageName)
                    .resizable()
                    .frame(width: 160, height: 160)
            }
            
            Text(title ?? "")
                .multilineTextAlignment(.center)
                .font(Font(TextStyle.Title.title3 as! CTFont))
                .padding(.bottom, 4)
            
            Text(message ?? "")
                .multilineTextAlignment(.center)
                .font(Font(TextStyle.Subtitle.regular))
                .padding(.horizontal, 16)
        }
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Content")
            .emptyState(.isLoading)
    }
}

enum ImageName: String {
    case noInternet = "No Internet"
    case noCoverage = "No Coverage"
    case loadingError = "Loading Error"
    case loading = "Loading"
}

