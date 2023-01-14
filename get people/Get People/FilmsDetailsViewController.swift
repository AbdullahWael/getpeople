

import UIKit

class FilmsDetailsViewController: UIViewController {
    
    //vars
    var releaseDate = ""
    var dirctor = ""
    var openingCrawl = ""

    //outlets
    @IBOutlet weak var releaseDatelbl: UILabel!
    @IBOutlet weak var directornamelbl: UILabel!
    @IBOutlet weak var openingCrawllbl: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        releaseDatelbl.text = releaseDate
        directornamelbl.text = dirctor
        openingCrawllbl.text = openingCrawl
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
