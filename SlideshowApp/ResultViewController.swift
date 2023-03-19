//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by user on 2023/03/19.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var slideImage2: UIImageView!
    
    let imageName = ["slide_1", "slide_2", "slide_3", "slide_4"]
    var changeImgNo2: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let name = imageName[changeImgNo2]
        slideImage2.image = UIImage(named: name)

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
