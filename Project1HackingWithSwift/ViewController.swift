//
//  ViewController.swift
//  Project1HackingWithSwift
//
//  Created by mac on 05/01/2025.
//

import UIKit

class ViewController: UIViewController {
    
    
    
   
    @IBOutlet weak var picturesTabelView: UITableView!
    
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picturesTabelView.dataSource = self
        picturesTabelView.delegate = self
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            
            if item.hasPrefix("nssl"){
                
                pictures.append(item)
            }
           
        }
        print(pictures)
    }
    
}


extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = picturesTabelView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Details") as? DetailsViewController
        
        vc?.selectedImage = pictures[indexPath.row]
        
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}

