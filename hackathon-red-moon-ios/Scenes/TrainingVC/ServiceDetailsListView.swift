//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import UIKit
import YassirUI
import Stevia

class ServiceDetailsListView: UIView {
    
    //TODO: This need to be changed, it is copied for reference...
    var filterArray :[String] = ["Software development","Graphic design","Soft Skills","Finance and accounting","Entrepreneurship and business management"] {
        didSet{
            self.filterCollectionView.reloadData()
        }
    }
    
    @objc
    func touchAction(){
        let ratingCommentViewController = DetailsViewVC()
        let controller = YassirUI.SheetViewController(contentViewController: ratingCommentViewController)
        self.parentViewController?.present(controller, animated: true, completion: nil)
    }
    
    let backButton: UIButton = {
        let v = UIButton(type: .system)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.setImage(UIImage(named: "back.png"), for: .normal)
        v.tintColor = .white
        return v
    }()
    
    public let Tot: UILabel = {
        let v = UILabel()
        v.textColor = .black
        v.font = .preferredFont(forYassirTextStyle: TextStyle.Title.title1)
        v.numberOfLines = 0
        v.textAlignment = .center
        v.text = "Training"
        return v
    }()
    
    public let filterView: UIView = {
        let v = UIView()
        v.backgroundColor = .gray50
        return v
    }()
    
    private let revenueTitleView : UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    public let revenueTitleLabel: UILabel = {
        let v = UILabel()
        v.textColor = .black
        v.font = .preferredFont(forYassirTextStyle: TextStyle.Body.regular)
        v.numberOfLines = 0
        v.textAlignment = .left
        v.text = "by : Thomas Brown"
        return v
    }()
    
    open var gainRevenueAmountText: String? {
        set { gainRevenueAmountLabel.text = newValue }
        get { gainRevenueAmountLabel.text }
    }
    
    public let gainRevenueAmountLabel: UILabel = {
        let v = UILabel()
        v.textColor = .black
        v.font = .preferredFont(forYassirTextStyle: TextStyle.Caption.regular)
        v.numberOfLines = 0
        v.textAlignment = .left
        return v
    }()
    
    public let revenueGrossLabel: UILabel = {
        let v = UILabel()
        v.textColor = .black
        v.font = .preferredFont(forYassirTextStyle: TextStyle.Body.regular)
        v.numberOfLines = 2
        v.text = "Take your project management skills to the next level. Concept to launch in record time."
        v.textAlignment = .left
        return v
    }()
    
    open var revenueGrossAmountText: String? {
        set { revenueGrossAmountLabel.text = newValue }
        get { revenueGrossAmountLabel.text }
    }
    
    public let revenueGrossAmountLabel: UILabel = {
        let v = UILabel()
        v.textColor = .black
        v.font = .preferredFont(forYassirTextStyle: TextStyle.Body.semibold)
        v.numberOfLines = 0
        v.textAlignment = .left
        v.text = ""
        return v
    }()
    
    open var revenueAmountText: String? {
        set { revenueAmountLabel.text = newValue }
        get { revenueAmountLabel.text }
    }
    
    public let revenueAmountLabel: UILabel = {
        let v = UILabel()
        v.textColor = .black
        v.font = .preferredFont(forYassirTextStyle: TextStyle.Title.title3)
        v.numberOfLines = 0
        v.text = "Agile certification"
        v.textAlignment = .left
        return v
    }()
    
    open var isTrendPositive:Bool?{
        didSet{
            guard let isTrendPositive = isTrendPositive else {
                return
            }
            if isTrendPositive{
               trendIconImage = UIImage(yassirImageName: .trendUp)
               trendImageView.backgroundColor = .positive500
            }else{
                trendIconImage = UIImage(yassirImageName: .trendDown)
                trendImageView.backgroundColor = .negative500
            }
         }
    }
    
    private var trendIconImage: UIImage?{
        didSet{
            guard let iconImage = trendIconImage else {
                return
            }
            //trendImageView.image = iconImage.addImagePadding(x: 22, y: 22)?.withRenderingMode(.alwaysTemplate)
        }
    }
    
    private let trendImageView: UIImageView = {
        let v = UIImageView()
        //v.image = UIImage(yassirImageName: .trendUp).addImagePadding(x: 22, y: 22)?.withRenderingMode(.alwaysTemplate)
        v.contentMode = .scaleAspectFit
        v.tintColor = .white
        v.backgroundColor = .positive500
        v.clipsToBounds = true
        return v
    }()
    
    private let chartImageView: UIImageView = {
        let v = UIImageView()
        //v.image = UIImage(yassirImageName: .noRevenueDataFound).withRenderingMode(.alwaysTemplate)
        v.contentMode = .scaleAspectFit
        v.clipsToBounds = true
        return v
    }()
    
    private let chartView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    /*private let dashedLineView: DashedLineView = {
        let v = DashedLineView()
        v.dashColor = .gray50
        v.alpha = 0.2
        v.height(1)
        return v
    }()*/
    
    private let dashedLineBackgroundView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    private let yassirCommissionBackgroundView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    private let yassirCommissionView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor.gray100.cgColor
        return v
    }()
    
    private let yassirCommissionStackView: UIStackView = {
        let v = UIStackView()
        v.axis = .vertical
        v.distribution = .fillEqually
        v.spacing = 4
        return v
    }()
    
    public let yassirCommissionTopView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    public let yassirCommissionDetailsView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    open var yassirCommissionText: String? {
        set { yassirCommissionLabel.text = newValue }
        get { yassirCommissionLabel.text }
    }
    
    public let yassirCommissionLabel: UILabel = {
        let v = UILabel()
        v.textColor = .black
        v.font = .preferredFont(forYassirTextStyle: TextStyle.Body.semibold)
        v.numberOfLines = 0
        v.text = "Fees : "
        v.textAlignment = .left
        return v
    }()
    
    open var paymentDetailText: String? {
        set { paymentDetailLabel.text = newValue }
        get { paymentDetailLabel.text }
    }
    
    public let paymentDetailLabel: UILabel = {
        let v = UILabel()
        v.textColor = .black
        v.font = .preferredFont(forYassirTextStyle: TextStyle.Caption.regular)
        v.numberOfLines = 0
        v.textAlignment = .left
        return v
    }()
    
    open var paymentAmountText : String? {
        set { paymentAmountLabel.text = newValue }
        get { paymentAmountLabel.text }
    }
    
    public let paymentAmountLabel: UILabel = {
        let v = UILabel()
        v.textColor = .negative500
        v.font = .preferredFont(forYassirTextStyle: TextStyle.Body.semibold)
        v.numberOfLines = 0
        v.text = "5000 DA"
        v.textAlignment = .right
        return v
    }()
    
    private let timesArrowImageView: UIImageView = {
        let v = UIImageView()
        v.image = UIImage(yassirImageName: .chevronRight).withRenderingMode(.alwaysTemplate)
        v.contentMode = .scaleAspectFit
        v.tintColor = .gray700
        v.clipsToBounds = true
        return v
    }()
    
    private let moreDetailsTitleBackgroundView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    
    
    public let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.showsVerticalScrollIndicator = false
        v.showsHorizontalScrollIndicator = false
        return v
    }()
    
    private let backgroundView: UIView = {
        let v = UIView()
        v.backgroundColor = .gray50
        return v
    }()
    
    private let mainView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOffset = CGSize(width: 0, height: 1)
        v.layer.shadowRadius = 4
        v.layer.shadowOpacity = 0.16
        v.layer.masksToBounds = false
        return v
    }()
    
    private let mainListView: UIStackView = {
        let v = UIStackView()
        v.distribution = .fillProportionally
        v.axis = .vertical
        v.spacing = 16
        return v
    }()
    
    private let filterCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .horizontal
        
        let v = UICollectionView(frame: .zero, collectionViewLayout: layout)
        v.backgroundColor = .clear
        v.showsHorizontalScrollIndicator = false
        v.showsVerticalScrollIndicator = false
        v.register(HistoryTabCollectionViewCell.self, forCellWithReuseIdentifier: "HistoryTabCollectionViewCell")
        return v
    }()
    
    public let noDataLabel: UILabel = {
        let v = UILabel()
        v.textColor = .black
        v.font = .preferredFont(forYassirTextStyle: TextStyle.Subtitle.bold)
        v.textAlignment = .center
        v.adjustsFontSizeToFitWidth = true
        v.text = "NODATA"
        v.isHidden = true
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    var selectedIndex = Int()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        layout()
    }
    
    private func setup() {
        
        let gesture =  UITapGestureRecognizer(target: self, action:  #selector(touchAction))
            self.addGestureRecognizer(gesture)
        
        backgroundColor = .gray50
        filterCollectionView.dataSource = self
        filterCollectionView.delegate = self
        filterView.subviews(filterCollectionView)
        subviews(filterView,
                 scrollView,
                 noDataLabel,
                 Tot,
                 backButton)
        scrollView.subviews(backgroundView)
        backgroundView.subviews(mainView)
        
        mainView.subviews(mainListView)
        
        mainListView.addArrangedSubview(revenueTitleView)
        mainListView.addArrangedSubview(dashedLineBackgroundView)
        //TODO: i remove chart view as it's not in first phase
        //mainListView.addArrangedSubview(chartView)
        mainListView.addArrangedSubview(yassirCommissionBackgroundView)
        mainListView.addArrangedSubview(moreDetailsTitleBackgroundView)
        
        revenueTitleView.subviews(revenueTitleLabel,
                                  trendImageView,
                                  gainRevenueAmountLabel,
                                  revenueAmountLabel,
                                  revenueGrossAmountLabel,
                                  revenueGrossLabel)
        //dashedLineBackgroundView.subviews(dashedLineView)
        chartView.subviews(chartImageView)
        yassirCommissionBackgroundView.subviews(yassirCommissionView)
        
        yassirCommissionView.subviews(yassirCommissionStackView)
        yassirCommissionView.subviews(timesArrowImageView)
        yassirCommissionStackView.addArrangedSubview(yassirCommissionTopView)
        yassirCommissionStackView.addArrangedSubview(yassirCommissionDetailsView)
        
        yassirCommissionTopView.subviews(yassirCommissionLabel, paymentAmountLabel)
        yassirCommissionDetailsView.subviews(paymentDetailLabel)
    }
    
    private func layout() {
        Tot.leading(0).trailing(0).height(30).Bottom == filterCollectionView.Top - 10
        backButton.width(8).height(8).leading(10).Top == Tot.Top
        filterView.leading(0).trailing(0).top(0)
        filterCollectionView.leading(0).trailing(0).top(50).bottom(4).height(28)
        scrollView.bottom(0).leading(0).trailing(0).Top == filterView.Bottom
        backgroundView.top(0).bottom(0).leading(0).trailing(0)
        backgroundView.centerHorizontally()
        
        noDataLabel.centerHorizontally().centerVertically()
        
        mainView.bottom(16).leading(16).trailing(16).top(4)
        mainListView.top(0).bottom(0).leading(0).trailing(0)
        
        revenueTitleLabel.top(16).leading(16)
        trendImageView.height(16).width(16).Leading == revenueTitleLabel.Trailing + 8
        alignHorizontally(trendImageView, with: revenueTitleLabel)
        alignHorizontally(gainRevenueAmountLabel, with: revenueTitleLabel)
        gainRevenueAmountLabel.trailing(>=16).Leading == trendImageView.Trailing + 4
        revenueAmountLabel.leading(16).trailing(16).Top == revenueTitleLabel.Bottom + 8
        revenueGrossAmountLabel.leading(16).bottom(0).Top == revenueAmountLabel.Bottom + 8
        alignVertically(revenueGrossLabel, with: revenueGrossAmountLabel)
        revenueGrossLabel.trailing(16).leading(16).Top == revenueGrossAmountLabel.Bottom
        
        //dashedLineView.top(0).bottom(0).leading(16).trailing(16)
        chartImageView.top(0).bottom(0).leading(16).trailing(16).height(200)
        
        yassirCommissionView.top(5).bottom(0).leading(16).trailing(16).height(72)
        yassirCommissionStackView.top(15).bottom(12).leading(12).trailing(12)
        
        paymentAmountLabel.top(0).bottom(0).Leading == yassirCommissionLabel.Trailing + 10
        yassirCommissionLabel.leading(0).Trailing == paymentAmountLabel.Leading + 4
        alignHorizontally(yassirCommissionLabel, with: paymentAmountLabel)
        paymentDetailLabel.leading(0).bottom(0).top(0).trailing(0)
        
        timesArrowImageView.trailing(16).height(16).width(16)
        alignHorizontally(timesArrowImageView, with: yassirCommissionStackView)
        
        //evaluationLabel.top(12).leading(16)
        //evaluationArrowImageView.trailing(16).height(16).width(16)
        //alignHorizontally(evaluationArrowImageView, with: evaluationLabel)
        //evaluationValueLabel.leading(16).bottom(16).Top == evaluationLabel.Bottom + 8
        //evaluationValueImageView.height(16).width(16).Leading == evaluationValueLabel.Trailing + 8
        //alignHorizontally(evaluationValueImageView, with: evaluationValueLabel)
        //evaluationNewValueLabel.Leading == evaluationValueImageView.Trailing + 4
        //alignHorizontally(evaluationNewValueLabel, with: evaluationValueImageView)
        //evaluationStarImageView.trailing(>=16).height(16).width(16).Leading == evaluationNewValueLabel.Trailing + 2
        //alignHorizontally(evaluationStarImageView, with: evaluationNewValueLabel)
        
        filterView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        //scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainView.layer.cornerRadius = 16
        yassirCommissionView.layer.cornerRadius = 8
        //moreDetailsEvaluationView.layer.cornerRadius = 8
        trendImageView.layer.cornerRadius = trendImageView.frame.height / 2
    }
    
    @objc
    private func moreDetailsCoursesButtonTap() {
        //performancesViewDelegate?.moreDetailsCoursesButtonDidTap(self)
    }
    
    @objc
    private func moreDetailsTimeButtonTap() {
        //performancesViewDelegate?.moreDetailsTimeButtonDidTap(self)
    }
    
    @objc
    private func moreDetailsEvaluationButtonTap() {
        //performancesViewDelegate?.moreDetailsEvaluationsButtonDidTap(self)
    }
}

extension ServiceDetailsListView :  UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int{
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return filterArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        guard let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HistoryTabCollectionViewCell", for: indexPath) as? HistoryTabCollectionViewCell  else { fatalError("Bad cell type.") }
        
        collectionViewCell.titleLabel.text = filterArray[indexPath.row]
        if selectedIndex == indexPath.row {
            collectionViewCell.setSelected()
        }else{
            collectionViewCell.setUnSelected()
        }
        return collectionViewCell
    }
}

extension ServiceDetailsListView : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        selectedIndex = indexPath.row
        collectionView.reloadData()
        //performancesViewDelegate?.performancesViewDidChangeFilter(self)
    }
}


class HistoryTabCollectionViewCell: UICollectionViewCell {
    
    public let titleLabel: UILabel = {
        let v = UILabel()
        v.textColor = .black
        v.font = .preferredFont(forYassirTextStyle: TextStyle.Caption.regular)
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
        self.layer.borderWidth = 2
        backgroundColor = .white
        self.layer.borderColor = UIColor.clear.cgColor
        subviews(titleLabel)
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = frame.height/2
        super.layoutSubviews()
    }
    
    
    private func layout() {
        titleLabel.leading(12).trailing(12).top(0).bottom(0).height(28)
    }
    
    public func setSelected(){
        titleLabel.textColor = .white
        self.backgroundColor = .go500
        self.layer.borderColor = UIColor.clear.cgColor
    }
    
    public func setUnSelected(){
        self.layer.borderColor = UIColor.gray200.cgColor
        titleLabel.textColor = .black
        self.backgroundColor = .clear
    }
    
    
}
