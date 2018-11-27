import UIKit

class TartListViewController: UIViewController {

    private let tarts = [(name: "Lemon Meringue Tart", level: 3, image: Constants.Images.lemonTart),
                         (name: "Mascarpone Berry Tart", level: 2, image: Constants.Images.berryTart),
                         (name: "Caramel & Chocolate Tart", level: 1, image: Constants.Images.chocolateTart)]

    private let overlay = UIView()

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!

    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
    }

    @IBAction func zoomTart(_ sender: UIButton) {
        overlay.frame = view.frame

        let shade = UIView(frame: view.frame)
        shade.backgroundColor = .black
        shade.alpha = 0.7

        let infoLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        infoLabel.textColor = .white
        infoLabel.text = "Some useful quick preview"
        infoLabel.textAlignment = .center
        infoLabel.center = view.center

        overlay.addSubview(shade)
        overlay.addSubview(infoLabel)
        overlay.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                            action: #selector(closeTartPreview)))
        view.addSubview(overlay)
    }

    @objc private func closeTartPreview(recognizer: UITapGestureRecognizer) {
        overlay.subviews.forEach{ subview in
            subview.removeFromSuperview()
        }
        overlay.removeFromSuperview()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination.isKind(of: TartDetailsViewController.self),
            let index = tableView.indexPathForSelectedRow?.row {
            let detailsVC = segue.destination as! TartDetailsViewController

            detailsVC.tartName = tarts[index].name
            detailsVC.tartIcon = tarts[index].image
            detailsVC.difficultyLevel = tarts[index].level
        }
    }

    @IBAction func done(_ segue: UIStoryboardSegue) {}
}

extension TartListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowDetails", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TartListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TartCell") as? TartCell else {
                return UITableViewCell()
        }

        cell.configure(withName: tarts[indexPath.row].name,
                       level: tarts[indexPath.row].level,
                       image: tarts[indexPath.row].image,
                       tag: indexPath.row)

        return cell
    }
}
