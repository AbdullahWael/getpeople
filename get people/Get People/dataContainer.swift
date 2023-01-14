

import Foundation

struct PeopleList : Codable { // if there is another properites of api , we aill use codable , but beacuse the detailspeople struct is already codeable we wont use it here 
    let results : [detailsPeople]
} // a struct that contains an array of other struct type , which has the elemant of the api data



struct detailsPeople : Codable {
    var name : String
    var height : String
    var mass : String
    var birth_year : String
    var gender : String
    var vehicles : [String] // it contains an array of strings 
    
}
