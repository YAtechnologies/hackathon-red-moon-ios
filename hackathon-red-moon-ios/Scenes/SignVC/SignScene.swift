
import UIKit
import YassirUI

protocol SignSceneDelegate : AnyObject {
    func signButtonClicked()
}
class SignScene: UIView {
    
    weak var delegate : SignSceneDelegate?
    
    let backgroundIV: UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = #imageLiteral(resourceName: "onboarding")
        v.contentMode = .scaleAspectFill
        return v
    }()
    
    let bottomContainerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.cornerRadius = 12
        v.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return v
    }()
    
    let yassirIV: UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = #imageLiteral(resourceName: "yassir-logo")
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    let primaryLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = Localize("GET_A_RIDE_IN_A_COUPLE_OF_MINUTES")
        v.textColor = .black
        v.font = UIFont.preferredFont(forYassirTextStyle: .init(weight: .black, pointSize: 26))
        v.numberOfLines = 0
        v.setContentHuggingPriority(.required, for: .vertical)
        return v
    }()
    
    let secondaryLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = Localize("AFFORDABLE_FAST_AND_SECURE")
        v.textColor = .gray700
        v.font = .preferredFont(forYassirTextStyle: TextStyle.Subtitle.regular)
        v.numberOfLines = 0
        v.setContentHuggingPriority(.required, for: .vertical)
        return v
    }()
    
    let startButton: ColoredButton = {
        let v = ColoredButton()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = Localize("GET_STARTED")
        v.titleLabel?.font = .preferredFont(forYassirTextStyle: TextStyle.Subtitle.bold)
        v.setTitleColor(.white, for: .normal)
        v.color = .go500
        v.cornerRadius = 8
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        layout()
    }
    
    private func setup() {
        addSubview(backgroundIV)
        addSubview(bottomContainerView)
        [yassirIV, primaryLabel, secondaryLabel, startButton].forEach{ bottomContainerView.addSubview($0) }
        startButton.addTarget(self, action: #selector(signButtonClicked), for: .touchUpInside)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            backgroundIV.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundIV.topAnchor.constraint(equalTo: topAnchor),
            backgroundIV.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            bottomContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomContainerView.topAnchor.constraint(lessThanOrEqualTo: backgroundIV.bottomAnchor, constant: -16),
            
            yassirIV.topAnchor.constraint(equalTo: bottomContainerView.topAnchor, constant: 16),
            yassirIV.heightAnchor.constraint(equalToConstant: 32),
            yassirIV.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor, constant: 16),
            
            primaryLabel.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor, constant: 16),
            primaryLabel.topAnchor.constraint(equalTo: yassirIV.bottomAnchor, constant: 16),
            primaryLabel.trailingAnchor.constraint(equalTo: bottomContainerView.trailingAnchor, constant: -16),
            
            secondaryLabel.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor, constant: 16),
            secondaryLabel.topAnchor.constraint(equalTo: primaryLabel.bottomAnchor, constant: 16),
            secondaryLabel.trailingAnchor.constraint(equalTo: bottomContainerView.trailingAnchor, constant: -16),
            
            startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            startButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24),
            startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            startButton.topAnchor.constraint(equalTo: secondaryLabel.bottomAnchor, constant: 16),
            startButton.heightAnchor.constraint(equalToConstant: 56),
        ])
    }
    
    @objc func signButtonClicked(){
        delegate?.signButtonClicked()
    }
}
