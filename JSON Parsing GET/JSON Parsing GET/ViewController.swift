//
//  ViewController.swift
//  JSON Parsing GET
//
//  Created by apple on 10/01/19.
//  Copyright © 2019 Seraphic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    struct jsonGet: Decodable{
        var userId : Int
        var id : Int
        var title : String
        var body : String
    }
 
    
    @IBOutlet weak var useridlabel: UILabel!
    
    @IBOutlet weak var idlabel: UILabel!
    
    @IBOutlet weak var titlelabel: UILabel!
    
    @IBOutlet weak var bodytextview: UITextView!
    
    @IBAction func parse(_ sender: Any) {
         getJsonData()
    }
    @IBAction func post(_ sender: Any) {
        getJsonDataArray()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    
    
    
    func getJsonData(){
          let url = URL(string: "https://jsonplaceholder.typicode.com/posts/71")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                let parsedData = try JSONDecoder().decode(jsonGet.self, from: data!)
        
                self.useridlabel.text! = String(parsedData.userId)
                self.idlabel.text! = String(parsedData.id)
                self.titlelabel.text! = String(parsedData.title)
                self.bodytextview.text! = String(parsedData.body)
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func getJsonDataArray(){
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                let parsedDataArray = try JSONDecoder().decode([jsonGet].self, from: data!)
                let mappedid = parsedDataArray.map( { (arr : jsonGet) -> Int in
                    return arr.id
                })
                
                print("All ID's are : ",mappedid)
                
                let mappedUserid = parsedDataArray.map( { (arr : jsonGet) -> Int in
                    return arr.userId
                })
                
                print("All User ID's are : ",mappedUserid)
                
                let mappedTitle = parsedDataArray.map( { (arr : jsonGet) -> String in
                    return arr.title
                })
                
                print("All Title's are : ",mappedTitle)
                
                let mappedBody = parsedDataArray.map( { (arr : jsonGet) -> String in
                    return arr.body
                })
                
                print("All Body's are : ",mappedBody)
                
                
                
                
                
            } catch let error {
                print(error)
            }
            }.resume()
    }

    
    
    
    
    
    
    
    
    
    
//    func PostJsonData() {
//        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/71")
//
//
//    }
    
    
    
    

}

