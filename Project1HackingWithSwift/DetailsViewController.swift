//
//  DetailsViewController.swift
//  Project1HackingWithSwift
//
//  Created by mac on 05/01/2025.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let imageToLOad = selectedImage{
            
            imageView.image = UIImage(named: imageToLOad)
        }
    }
    


}
