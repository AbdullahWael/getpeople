

import UIKit

class ViewController: UIViewController {
    
    // vars
    var myData :[NSDictionary] = []
    
    
    // outlets
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        //setup api call
        StarWarsModel.getAllPeople { data, response, error in
            do {
                // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] as? NSArray {
                        for person in results {
                            let personDict = person as! NSDictionary
                            self.myData.append(personDict) // we appent the whole dictiony by it dependenses
                            print(self.myData)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Something went wrong")
            }
        }
    
    }
    
    
    
}

extension ViewController : UITableViewDelegate{
    
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = myData[indexPath.row]["name"] as? String

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsPeopleVC = storyboard?.instantiateViewController(withIdentifier: "peopleDetails") as! PeopleDetailsViewController
        detailsPeopleVC.height = (myData[indexPath.row]["height"] as? String)!
        detailsPeopleVC.gender = (myData[indexPath.row]["gender"] as! String)
        detailsPeopleVC.birthYear = myData[indexPath.row]["birth_year"] as! String
        detailsPeopleVC.mass = (myData[indexPath.row]["mass"] as? String)!
        present(detailsPeopleVC, animated: true)
    }
    
    
}


/* first try for api
 
 
 // this part for api
 guard let url = URL(string: "https://swapi.dev/api/people/?page=3&format=json") else { return }
 // guard statements to make sure there is content in that url , else return ya habibi
 var request = URLRequest(url: url)
 request.httpMethod = "GET"
 // بس ابي اقوله ترى المطلوب "GET" فقط و ركز معي
 URLSession.shared.dataTask(with: request) { (data , response , error) in
     if error != nil {
         print(" error is : \(error)")
         //  if error isnt nil , that means we have an error , print the error
     } else {
         // if we dont have error , do this
         guard let data = data else { return }
         // shadow casting using guard , give two vars the same name , forget that , the idea here is to check the data is equal to data
         let decoder = JSONDecoder()
         do {
             let result = try decoder.decode([PeopleList].self , from: data)
             print (result)
         } catch {
             print(" error is :: \(error)")
         }
         
     }
     
 }.resume() // after all we have doing above , which only instructions , now call the api and implemnt these instructions on it
 
 
 
 
 
 ///////////////////// second try
 
 // this part for api call
 let url = URL(string: "https://swapi.dev/api/people/?format=json")
 
 guard url != nil else {
     return
 }
// guard statements to make sure there is content in that url , else return ya habibi
// that make us avoid
 
 let session = URLSession.shared
 
 let dataTask = session.dataTask(with: url!) { [self] data , response, error in

     let decoder = JSONDecoder()
         do {
             let result = try decoder.decode(PeopleList.self, from: data!)
             self.myData = result.results // put the result inside my array
             print(result)
         }catch {
             print(" error in json parsing is : \(error)")
         }
     
     DispatchQueue.main.async {
         self.tableView.reloadData()
     }
 }
 dataTask.resume()
 // after all we have doing above , which only instructions , now call the api and implemnt these instructions on it
 
}

 
 
 
 */
