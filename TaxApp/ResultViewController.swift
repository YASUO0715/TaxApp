
import UIKit

class ResultViewController: UIViewController {

    
    @IBOutlet weak var sumLabel: UILabel!
    
    @IBOutlet weak var shareButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        sumLabel.text = ""
        var sum = 0.0
        
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "amounts") != nil {
            let amounts = userDefaults.object(forKey: "amounts") as! [String]
            for amount in amounts {
                sum = sum + Double(amount)!
            }
            sumLabel.text = String(sum)
        }
    }
    
    @IBAction func tapshareButton(_ sender: Any) {
        showAlert(title: "Share", message: "share this consumption tax.")
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }

}
