//
//  ViewController.swift
//  D02
//
//  Created by Octavio orlando OJEDA ARONIZ on 1/9/19.
//  Copyright © 2019 Octavio orlando OJEDA ARONIZ. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    var tab_people :[(String, String, String)] = []
    var tmp_name = ""
    var tmp_death = ""
    var tmp_date = ""
    

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  tab_people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell") as! peopleTableViewCell
        cell.people = tab_people[indexPath.row]
        
        return cell
    }


    @IBAction func unwindSegue(segue: UIStoryboardSegue)
    {
        if segue.identifier == "back_from2"
        {
            if(tmp_name != "" && tmp_date != ""){
                tab_people.append((tmp_name,tmp_death, tmp_date))
                print("tab people = ", tab_people)
                self.tableView.reloadData()
            }
            tmp_name = ""
            tmp_death = ""
            tmp_date = ""
            
            tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0)
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.estimatedRowHeight = 44
        }
    }
    
    override func viewDidLoad() {
        print("vdidload")
        tab_people = [("mrPotato", "eating potatoes", "11.01.2020"),
        ("msPotato", "eating kfc","11.01.2021"),
        ("Octavio", "jumping", "11.01.2022")]
    }
    
}

