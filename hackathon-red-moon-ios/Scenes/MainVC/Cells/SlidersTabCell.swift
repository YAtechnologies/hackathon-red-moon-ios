//
//  Created by Thabet
//  Copyright (c) 2021 Yassir S.P.A. All rights reserved.

import UIKit
import YassirUI
import SDWebImage

class SlidersTabCell: UITableViewCell {
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.register(SliderCell.self, forCellWithReuseIdentifier: "SliderCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setupViews()
        autoLayout()
        setColors()
    }
    
    private func setColors() {
        self.backgroundColor = .gray50
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

extension SlidersTabCell: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = 200
        let cellHeight = 200
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

extension SlidersTabCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            //
        }else {
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as! SliderCell
        
        //
        
        return cell
    }
}
