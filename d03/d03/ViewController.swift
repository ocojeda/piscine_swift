//
//  ViewController.swift
//  d03
//
//  Created by Octavio orlando OJEDA ARONIZ on 1/11/19.
//  Copyright © 2019 Octavio orlando OJEDA ARONIZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string : "https://www.nasa.gov/sites/default/files/styles/full_width/public/thumbnails/image/e0102_lg.jpg?itok=sd9lOayI") {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                imageView.image = UIImage(data: imageData)
            }
        }
    }

    func downloadImage(with url: URL){
        
        spinner(shouldSpin: true)
        URLSession.shared.dataTask(with: url) { (data, responde, error) in
            if error != nil{
                return
            }
            DispatchQueue.main.async{
                self.imageView.image = UIImage(data: data!)
                self.spinner(shouldSpin: false)
            }
            
        }.resume()
    }
    
    func spinner(shouldSpin status : Bool){
        if status == true{
            spinner.isHidden = false
            spinner.startAnimating()
        }
        else{
            spinner.isHidden = true
            spinner.startAnimating()
        }
    }


}

