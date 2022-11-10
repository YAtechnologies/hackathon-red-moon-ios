
import UIKit
import YassirAuth
import YassirAuthUI

protocol LaunchVCDelegate : AnyObject {
    func LaunchDidFinishSuccessfully(isLoggedIn : Bool)
}
class LaunchVC: PairedViewController<LaunchScene> {
    
    weak var delegate : LaunchVCDelegate?
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkServerStatus()
        
    }
    
    private func checkServerStatus(){
        //TODO: check server status then check if logged in
        print("[LaunchVC] : checkServerStatus()")
        checkIfLoggedIn()
    }
    
    private func checkIfLoggedIn(){
        pairedView.startAnimating()
        delegate?.LaunchDidFinishSuccessfully(isLoggedIn: UserDefaultsManager.isLoggedIn())
    }
    
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
