import UIKit

class TartDetailsViewController: UIViewController {
    var tartName: String?
    var tartIcon: UIImage?
    var difficultyLevel: Int?

    @IBOutlet weak var tartDetailsContainerView: UIView!
    @IBOutlet weak var recipeContainerView: UIView!

    @IBOutlet private weak var backButton: UIButton!

    @IBOutlet private weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = tartName
            titleLabel.font = UIFont(name: "Cochin-Bold", size: 30.0)!
        }
    }

    @IBOutlet private weak var tartImage: UIImageView! {
        didSet {
            tartImage.image = tartIcon
            tartImage.clipsToBounds = true
            tartImage.layer.cornerRadius = tartImage.frame.size.width/2
        }
    }

    @IBOutlet weak var detailsHeaderLabel: UILabel!
    @IBOutlet weak var difficultyTitleLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel! {
        didSet {
            if let difficultyLevel = difficultyLevel {
                var difficulty = ""
                for _ in 0..<difficultyLevel {
                    difficulty.append("🥧")
                }
                difficultyLabel.text = difficulty
            }
        }
    }

    @IBOutlet weak var authorTitleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!

    @IBOutlet weak var recipeHeaderLabel: UILabel!
    @IBOutlet weak var recipeLabel: UILabel! {
        didSet {
            recipeLabel.font = UIFont(name: "Cochin-Italic", size: 15.0)!
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        addImportantButton()
    }

    private func addImportantButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        view.addSubview(button)
    }
}
