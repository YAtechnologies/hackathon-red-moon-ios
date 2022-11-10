//
//  Created by S3W on 21/10/2022.
//

import Foundation
import UIKit

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
