import UIKit

class MVCViewController: UIViewController {
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var player2Label: UILabel!

    var model: MVCModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        model = MVCModel(controller: self)
        viewDidChange()
    }

    func viewDidChange() {
        player1Label.text = model?.player1score.rawValue ?? ""
        player2Label.text = model?.player2score.rawValue ?? ""
    }

    @IBAction func player1(_ sender: Any) {
        model?.player1()
    }

    @IBAction func player2(_ sender: Any) {
        model?.player2()
    }
}
