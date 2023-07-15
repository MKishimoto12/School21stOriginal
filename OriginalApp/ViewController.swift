//
//  ViewController.swift
//  OriginalApp
//
//  Created by 岸本迪之進 on 2023/07/05.
//

import UIKit

class ViewController: UIViewController {

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
//「はじめる」のボタンのところ、はじめる→start
    @IBAction func start(){
        let challengeViewController = self.storyboard?.instantiateViewController(withIdentifier: "challenge") as! ChallengeViewController
        self.navigationController?.pushViewController(challengeViewController, animated: true)

    }

}

