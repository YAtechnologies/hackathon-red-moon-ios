
import UIKit

open class PairedViewController<PairedView: UIView>: UIViewController {
    public var pairedView: PairedView {
        guard let view = view as? PairedView else { fatalError("Bad view type. expecting: \(type(of: PairedView.self)), found: \(type(of: self.view.self)).") }
        return view
    }

    open override func loadView() {
        view = PairedView()
    }
}
