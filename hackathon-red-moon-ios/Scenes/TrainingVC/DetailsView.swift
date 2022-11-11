//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import UIKit
import Stevia
import YassirUI

class DetailsView: UIView {
 
    private let popupView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    ///... Bottom Buttons
    private let buttonsStackView: UIStackView = {
        let v = UIStackView()
        v.axis = .vertical
        v.distribution = .fillEqually
        v.alignment = .fill
        v.spacing = 8
        return v
    }()
    
    private let infoErrorImageView: UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "Avatar.png")
        v.contentMode = .scaleAspectFit
        v.tintColor = .white
        return v
    }()
    
    private let deleteButton: ColoredButton = {
        let v = ColoredButton(type: .system)
        v.tintColor = .white
        v.setTitleColor(.white, for: .normal)
        v.titleLabel?.font = .preferredFont(forYassirTextStyle: TextStyle.Subtitle.regular)
        v.setTitle("Place an offer", for: .normal)
        v.color = .black
        return v
    }()
    
    private let notButton: ColoredButton = {
        let v = ColoredButton(type: .system)
        v.tintColor = .white
        v.setTitleColor(.black, for: .normal)
        v.titleLabel?.font = .preferredFont(forYassirTextStyle: TextStyle.Subtitle.regular)
        v.setTitle("starting from :    5000DA", for: .normal)
        v.color = .white
        v.isEnabled = false
        v.layer.borderColor = UIColor.black.cgColor
        v.layer.borderWidth = 2
        return v
    }()
    
    public let deleteSubTitleLabel: UILabel = {
        let v = UILabel()
        v.textColor = .gray700
        v.font = .preferredFont(forYassirTextStyle: TextStyle.Title.title3)
        v.numberOfLines = 10
        v.adjustsFontSizeToFitWidth = true
        v.text = "Thomas Brown, Certified Agile Specialist proposes his services as Agile Trainer to train you in the ways of the Agile allowing you to gain great agility and inner peace. Be certified as Agile Specialist by following this course and taking the followup exam* at the end. This course will provide you with everything you need to succeed\n*Exam not included in price of course"
        v.textAlignment = .left
        return v
    }()
    
    public let deleteTitleLabel: UILabel = {
        let v = UILabel()
        v.textColor = .black
        v.font = .preferredFont(forYassirTextStyle: TextStyle.Title.title2)
        v.numberOfLines = 1
        v.adjustsFontSizeToFitWidth = true
        v.text = "Agile certification"
        v.textAlignment = .center
        return v
    }()
    
    public let nameLabel: UILabel = {
        let v = UILabel()
        v.textColor = .black
        v.font = .preferredFont(forYassirTextStyle: TextStyle.Title.title1)
        v.numberOfLines = 1
        v.adjustsFontSizeToFitWidth = true
        v.text = "Thomas Brown"
        v.textAlignment = .left
        return v
    }()
    
    public let specLabel: UILabel = {
        let v = UILabel()
        v.textColor = .black
        v.font = .preferredFont(forYassirTextStyle: TextStyle.Title.title3)
        v.numberOfLines = 1
        v.adjustsFontSizeToFitWidth = true
        v.text = "Certified Agile Specialist"
        v.textAlignment = .center
        return v
    }()
    
    private let closeButton: Button = {
        let closeButton = Button(type: .system)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.cornerRadius = 16
        closeButton.backgroundColor = .gray100
        ///Need to change image name ones add name on `YassirUI`
        closeButton.setImage(UIImage(named: "icn-close", in: Bundle.yassirUI, compatibleWith: nil), for: .normal)
        closeButton.tintColor = .black
        closeButton.imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return closeButton
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
        backgroundColor = .white
        
        subviews(popupView)
        
        buttonsStackView.addArrangedSubview(notButton)
        buttonsStackView.addArrangedSubview(deleteButton)
        popupView.subviews(buttonsStackView,
                           deleteSubTitleLabel,
                           deleteTitleLabel,
                           //infoView,
                           closeButton,
                           infoErrorImageView,
                           nameLabel)
    }
    
    private func layout() {
        popupView.leading(8).top(8).trailing(8)
        infoErrorImageView.top(32).leading(32).width(100).height(100)
        nameLabel.top(32).width(150).height(50).Leading == infoErrorImageView.Trailing + 16
        popupView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        popupView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        popupView.height(600)
        deleteButton.cornerRadius = 8
        deleteButton.height(53)
        notButton.height(53)
        notButton.cornerRadius = 8
        
        popupView.layer.cornerRadius = 8
        buttonsStackView.leading(16).trailing(16).bottom(16)
        deleteSubTitleLabel.height(200).leading(16).trailing(16).Bottom == buttonsStackView.Top - 32
        deleteTitleLabel.leading(16).trailing(16).Bottom == deleteSubTitleLabel.Top - 4
        //infoView.height(200).width(64).centerHorizontally().Bottom == deleteTitleLabel.Top - 16
        //infoView.layer.cornerRadius = 32
        closeButton.trailing(16).height(32).width(32).top(16).Bottom == Top - 16
        //infoErrorImageView.top(16).bottom(16).leading(16).trailing(16)

    }
}
