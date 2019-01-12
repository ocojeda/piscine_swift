//
//  ViewController.swift
//  d04
//
//  Created by Octavio orlando OJEDA ARONIZ on 1/11/19.
//  Copyright © 2019 Octavio orlando OJEDA ARONIZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, APITwitterDelegate {
    
    
    
    func errorTweets(error: NSError) {
        print(error)
    }
     
    var tweets: [Tweet] = []
    var token: String = ""
    let query:String = "&src=typd&lang=fr&count=100&result_type=recent"
    
    @IBOutlet var tableView: UITableView!
    
    func receiveTweets(tweets: [Tweet]) {
        self.tweets = tweets
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.tableView.register(UINib.init(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        self.tableView.dataSource = self
        let key = "ThqxB70AfUXG1uS3tF431heWe"
        let secret = "HEiawGN8CM5UvZ461joMXkEGBqOSrbCfYRx3pkBHJeFwDFl0Ro"
        let BEARER = ((key + ":" + secret).data(using: String.Encoding.utf8))!.base64EncodedString()
        let url = NSURL(string: "https://api.twitter.com/oauth2/token")
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = "POST"
        request.setValue("Basic " + BEARER, forHTTPHeaderField: "Authorization")
        request.setValue("application/x-www-form-urlencoded;CHARSET=UTF-8", forHTTPHeaderField: "Content-type")
        request.httpBody = "grant_type=client_credentials".data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            let d = data
            do {
                if let dic : NSDictionary = try JSONSerialization.jsonObject(with: d!) as? NSDictionary {
                    for (key, value) in dic {
                        if key as! String == "access_token" {
                            print(value as! String)
                            self.token = value as! String
                        }
                    }
                    let controller = APIController(delegate: self as? APITwitterDelegate, token: self.token)
                    controller.get_tweet(search: "q=" + "ecole 42".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! + self.query)
                    
                }
            } catch (let err){
                print(err)
                return
            }
        }
        task.resume()
        }
    
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    
    @IBAction func ss(_ sender: UITextField) {
        
        let controller = APIController(delegate: self as? APITwitterDelegate, token: self.token)
        controller.get_tweet(search: "q=" + sender.text!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! + self.query)
        
        
        tableView.reloadData()
        self.label_search.text = sender.text
        
        sender.text = ""
        sender.endEditing(true)
    }
    
    @IBAction func text_end(_ sender: UITextField) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tweets.count
    }
    
    @IBOutlet weak var label_search: UILabel!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.sizeToFit()
        cell.layoutIfNeeded()
        cell.Label.text = self.tweets[indexPath.row].name
        cell.content.text = self.tweets[indexPath.row].date
        cell.subject.text = self.tweets[indexPath.row].text
        return cell
    }

}

