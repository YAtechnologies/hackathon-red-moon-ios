
import UIKit
import YassirUI

protocol LaunchSceneDelegate : AnyObject {
    func retryButtonClicked()
}

class LaunchScene: UIView {
    
    weak var delegate : LaunchSceneDelegate?
    
    let yassirLogoIV: UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = #imageLiteral(resourceName: "LaunchScreenLogo")
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let v = UIActivityIndicatorView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let retryButton: Button = {
        let v = Button()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.setImage(UIImage(named: "icn-refresh", in: .yassirUI, compatibleWith: nil), for: .normal)
        v.tintColor = .go500
        v.isHidden = true
        v.imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        setupLayout()
    }
    
    private func setup() {
        backgroundColor = .white
        addSubview(yassirLogoIV)
        addSubview(retryButton)
        addSubview(activityIndicatorView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            yassirLogoIV.centerXAnchor.constraint(equalTo: centerXAnchor),
            yassirLogoIV.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -32),
            yassirLogoIV.heightAnchor.constraint(equalTo: yassirLogoIV.widthAnchor),
            yassirLogoIV.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            
            activityIndicatorView.topAnchor.constraint(equalTo: yassirLogoIV.bottomAnchor, constant: 32),
            activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),

            retryButton.widthAnchor.constraint(equalToConstant: 40),
            retryButton.heightAnchor.constraint(equalTo: retryButton.widthAnchor),
            retryButton.centerXAnchor.constraint(equalTo: activityIndicatorView.centerXAnchor),
            retryButton.centerYAnchor.constraint(equalTo: activityIndicatorView.centerYAnchor),
        ])
    }
    
    public func startAnimating() {
        activityIndicatorView.startAnimating()
        retryButton.isHidden = true
    }
    
    public func stopAnimating() {
        activityIndicatorView.stopAnimating()
        retryButton.isHidden = false
    }
}
