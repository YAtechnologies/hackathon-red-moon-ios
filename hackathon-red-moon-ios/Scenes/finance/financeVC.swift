



import UIKit
import YassirUI
import Stevia

class financeVC: PairedViewController<finance> {

    weak var delegate : SignVCDelegate?
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
