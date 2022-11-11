//
//  Created by Thabet
//  Copyright (c) 2021 Yassir S.P.A. All rights reserved.

import UIKit
import YassirUI

class SliderCell: UICollectionViewCell {
    
    let bannerImageView: UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleToFill
        v.tintColor = .black
        return v
    }()
    
    let titleLabel: UILabel = {
        let v = UILabel()
        v.text = "title"
        v.font = UIFont.preferredFont(forYassirTextStyle: TextStyle.Body.semibold)
        v.adjustsFontForContentSizeCategory = true
        v.textColor = .black
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let descriptionLabel: UILabel = {
        let v = UILabel()
        v.text = "description"
        v.font = UIFont.preferredFont(forYassirTextStyle: TextStyle.Body.regular)
        v.adjustsFontForContentSizeCategory = true
        v.textColor = .black
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    // MARK: - Scene functions
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        autoLayout()
        setColors()
    }
    
    private func setColors() {
        self.backgroundColor = .gray50
    }
    
    private func setupViews() {
        addSubview(bannerImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    }
    
    private func autoLayout() {
        NSLayoutConstraint.activate([
            bannerImageView.widthAnchor.constraint(equalToConstant:  300),
            bannerImageView.heightAnchor.constraint(equalToConstant:  100),
            bannerImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            bannerImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: bannerImageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: bannerImageView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: bannerImageView.bottomAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            descriptionLabel.leadingAnchor.constraint(equalTo: bannerImageView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: bannerImageView.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func updateCell(imageUrl: String){
        bannerImageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: nil, options: .highPriority, completed: {
            (image, error, cacheType, url) in
            if (error == nil) {
            }
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
