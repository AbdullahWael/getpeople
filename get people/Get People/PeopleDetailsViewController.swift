
import UIKit

class PeopleDetailsViewController: UIViewController {
    
    // vars
    var height = ""
    var gender = ""
    var birthYear = ""
    var mass = ""

    @IBOutlet weak var heightlbl: UILabel!
    @IBOutlet weak var genderlbl: UILabel!
    @IBOutlet weak var birthYearlbl: UILabel!
    @IBOutlet weak var masslbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightlbl.text = height
        genderlbl.text = gender
        birthYearlbl.text = birthYear
        masslbl.text = mass

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
