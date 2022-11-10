
import UIKit
import YassirAuth
import YassirAuthUI

protocol SignVCDelegate : AnyObject {
    func signInFinishedSuccessfully()
}
class SignVC: PairedViewController<SignScene> {

    weak var delegate : SignVCDelegate?
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        pairedView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func onboardingViewControllerDidTapStart() {
        do {
            let authClient = try AuthClient()
            if (authClient.currentAccount == nil){
                UINavigationBar.appearance().tintColor = #colorLiteral(red: 1, green: 0.4901960784, blue: 0, alpha: 1)
                let controller = AuthViewController(authClient: authClient)
                controller.delegate = self
                controller.appName = "YASSIR"
                controller.termsAndConditionsURL = URL(string: "https://yassir.com/global-legal/conditions-utilisation-chauffeur/")
                controller.modalPresentationStyle = .fullScreen
                if #available(iOS 13.0, *) {
                    controller.isModalInPresentation = true
                }
                present(controller, animated: true)
            }else{
                print("already exist")
            }
            
        } catch {
            let alert = UIAlertController(title: "Unable to present `AuthViewController`",
                                          message: error.localizedDescription,
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK",
                                          style: .cancel))
            present(alert, animated: true)
        }
    }

}

extension SignVC : SignSceneDelegate {
    func signButtonClicked(){
        onboardingViewControllerDidTapStart()
    }
}

// MARK: AuthViewController Delegate
extension SignVC: AuthViewControllerDelegate {
    
    func authViewController(_ controller: AuthViewController, didCompleteWith account: Account, phoneNumber: PhoneNumber?) {
        delegate?.signInFinishedSuccessfully()
        /*
        if UserDefaultsManager.storeUserData(data: phoneNumber ?? "Thabet"){
            delegate?.signInFinishedSuccessfully()
        }*/
    }
    
    func authViewControllerDidCancel(_ controller: AuthViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

//logout:
//try AuthHelper.shared.deletePersistedAccount()
