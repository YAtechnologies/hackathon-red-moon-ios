
import UIKit

class GridLayout: UICollectionViewLayout {

    var itemSpacing: CGFloat = 5
    var rowSpacing: CGFloat = 5

    private var itemSize: CGSize!
    private var numberOfRows: Int!
    private var numberOfColumns: Int!

    override func prepare() {
        super.prepare()

        let count = collectionView!.numberOfItems(inSection: 0)

        numberOfColumns = Int(ceil(sqrt(Double(count))))
        numberOfRows = Int(ceil(Double(count) / Double(numberOfColumns)))

        let width = (collectionView!.bounds.width - (itemSpacing * CGFloat(numberOfColumns - 1))) / CGFloat(numberOfColumns)
        let height = (collectionView!.bounds.height - (rowSpacing * CGFloat(numberOfRows - 1))) / CGFloat(numberOfRows)
        itemSize = CGSize(width: width, height: height)
    }

    override var collectionViewContentSize: CGSize {
        return collectionView!.bounds.size
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)

        attributes.center = centerForItem(at: indexPath)
        attributes.size = itemSize

        return attributes
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return (0 ..< collectionView!.numberOfItems(inSection: 0)).map { IndexPath(item: $0, section: 0) }
            .flatMap { layoutAttributesForItem(at: $0) }
    }

    private func centerForItem(at indexPath: IndexPath) -> CGPoint {

        let row = indexPath.item / numberOfColumns
        let col = indexPath.item - row * numberOfColumns

        return CGPoint(x: CGFloat(col) * (itemSize.width + itemSpacing) + itemSize.width / 2,
                       y: CGFloat(row) * (itemSize.height + rowSpacing) + itemSize.height / 2)
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
