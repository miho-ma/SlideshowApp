//
//  ViewController.swift
//  SlideshowApp
//
//  Created by user on 2023/03/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var nextBottun: UIButton!
    
    @IBOutlet weak var prevBottun: UIButton!
    
    @IBOutlet weak var slideImg: UIImageView!
    
    var timer: Timer!
    
    let imageName = ["slide_1", "slide_2", "slide_3", "slide_4"]
    var changeImgNo = 0

    @IBAction func btn(_ sender: Any) {
        if changeImgNo == 0{
            changeImgNo = 1
        }else if changeImgNo == 1{
            changeImgNo = 2
        }else if changeImgNo == 2{
            changeImgNo = 3
        }else{
            changeImgNo = 0
        }
        let name = imageName[changeImgNo]
        slideImg.image = UIImage(named: name)
    }

    @IBAction func prev_btn(_ sender: Any) {
        if changeImgNo == 3{
            changeImgNo = 2
        }else if changeImgNo == 2{
            changeImgNo = 1
        }else if changeImgNo == 1{
            changeImgNo = 0
        }else{
            changeImgNo = 3
        }
        let name = imageName[changeImgNo]
        slideImg.image = UIImage(named: name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startButton(_ sender: Any) {

        if (timer == nil){
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            startButton.setTitle("停止", for: .normal)
            nextBottun.isEnabled = false
            prevBottun.isEnabled = false

        } else {
            timer.invalidate()
            timer = nil
            startButton.setTitle("再生", for: .normal)
            nextBottun.isEnabled = true
            prevBottun.isEnabled = true
        }
    }
    
    @objc func changeImage(){
        changeImgNo += 1
        if (changeImgNo == imageName.count){
            changeImgNo = 0
        }
        let name = imageName[changeImgNo]
        slideImg.image = UIImage(named: name)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController: ResultViewController = segue.destination as! ResultViewController
        resultViewController.changeImgNo2 = changeImgNo
        
        if self.timer != nil{
            print("image tapped")
            timer.invalidate()
            timer = nil
            startButton.setTitle("再生", for: .normal)
            nextBottun.isEnabled = true
            prevBottun.isEnabled = true
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
}
