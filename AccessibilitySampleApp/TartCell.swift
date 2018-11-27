import UIKit

class TartCell: UITableViewCell {
    var isFavorite = false

    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.font = UIFont(name: "Cochin", size: 18.0)!
        }
    }

    @IBOutlet weak var difficultyLabel: UILabel! {
        didSet {
            difficultyLabel.font = UIFont.systemFont(ofSize: 12.0)
        }
    }

    @IBOutlet weak var thumbnailButton: UIButton! {
        didSet {
            thumbnailButton.clipsToBounds = true
            thumbnailButton.layer.cornerRadius = 25
        }
    }

    @IBOutlet weak var starButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(withName name: String, level: Int, image: UIImage, tag: Int) {
        nameLabel.text = name
        difficultyLabel.text = "Difficulty level: \(level) out of 3"
        thumbnailButton.setImage(image, for: .normal)
        thumbnailButton.tag = tag
    }

    func toggleFavorite() {
        isFavorite.toggle()
        starButton.isSelected = isFavorite
    }
}
