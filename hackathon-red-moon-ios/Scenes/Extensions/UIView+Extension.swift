//
//  Created by S3W on 21/10/2022.
//

import Foundation
import UIKit
import SwiftUI
import YassirUI

extension UIView {
    
    /// provide parent view controller of given view return first view controller from views
    weak var parentViewController: UIViewController? {
        // Starts from next (As we know self is not a UIViewController).
        var parentResponder: UIResponder? = self.next
        while parentResponder != nil {
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
            parentResponder = parentResponder?.next
        }
        return nil
    }
}

extension Font {
    init(_ textStyle: YassirUI.TextStyle) {
        self = Font(UIFont.preferredFont(forYassirTextStyle: textStyle) as CTFont)
    }
}

extension View {
    func emptyState(_ homeViewState: HomeViewState
    ) -> some View {
        modifier(EmptyStateViewModifier(homeViewState: homeViewState))
    }
}

extension Image {
    init (imageName: ImageName) {
        self.init(uiImage: UIImage(named: imageName.rawValue, in: .yassirHomeUI, compatibleWith: nil)!)
    }
}

struct EmptyStateViewModifier: ViewModifier {
    var homeViewState: HomeViewState
    
    func body(content: Content) -> some View {
            switch homeViewState {
            case .isEmpty(let status):
                switch status {
                case .networkError:
                    EmptyStateView(imageName: ImageName.loadingError, title: Localize("LOADING_ERROR_TITLE"), message: Localize("LOADING_ERROR_MESSAGE"))
                case .noInternet:
                    EmptyStateView(imageName: ImageName.noInternet, title: Localize("NO_INTERNET_ACCESS_TITLE"), message: Localize("NO_INTERNET_ACCESS_MESSAGE"))
                case .outOfCoverageLocation:
                    EmptyStateView(imageName: ImageName.noCoverage, title: Localize("LOCATION_OUT_OF_COVERAGE_TITLE"), message: Localize("LOCATION_OUT_OF_COVERAGE_MESSAGE"))
                case .notSpecified:
                    EmptyStateView(imageName: ImageName.loadingError, title: Localize("UNKNOWN_ERROR_TITLE"), message: Localize("UNKNOWN_ERROR_MESSAGE"))
                }
            case .isLoading:
                LoadingView()
            case .data:
                content
        }
    }
}

