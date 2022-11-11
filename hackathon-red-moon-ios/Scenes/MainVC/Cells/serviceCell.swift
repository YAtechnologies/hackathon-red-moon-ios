//
//  Created by Thabet
//  Copyright (c) 2021 Yassir S.P.A. All rights reserved.

import UIKit
import YassirUI

class serviceCell: UICollectionViewCell {

    let bannerImageView: UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleToFill
        v.tintColor = .black
        v.layer.cornerRadius = 5
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
    }
    
    private func autoLayout() {
        NSLayoutConstraint.activate([
            bannerImageView.widthAnchor.constraint(equalToConstant: 100),
            bannerImageView.heightAnchor.constraint(equalToConstant: 50),
            bannerImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            bannerImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: bannerImageView.bottomAnchor,constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 40)
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
