//
//  Created by Thabet
//  Copyright (c) 2021 Yassir S.P.A. All rights reserved.

import UIKit
import YassirUI
import SDWebImage

class ServicesTabCell: UITableViewCell {
    
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
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 50
        let v = UICollectionView(frame: .zero, collectionViewLayout: layout)
        v.translatesAutoresizingMaskIntoConstraints = false
        //v.isUserInteractionEnabled = true
        v.showsHorizontalScrollIndicator = false
        v.backgroundColor = .clear
        v.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return v
    }()
    
    // MARK: - Scene functions
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.register(serviceCell.self, forCellWithReuseIdentifier: "serviceCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setupViews()
        autoLayout()
        setColors()
    }
    
    private func setColors() {
        self.backgroundColor = .black
    }
    
    private func setupViews() {
        addSubview(collectionView)
        addSubview(collectionView)
    }
    
    private func autoLayout() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            //
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ServicesTabCell: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = 100
        let cellHeight = 100
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

extension ServicesTabCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            //
        }else {
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "serviceCell", for: indexPath) as! serviceCell
        
        //
        
        return cell
    }
}
