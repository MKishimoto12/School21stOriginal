//
//  MessageViewController.swift
//  OriginalApp
//
//  Created by 岸本迪之進 on 2023/07/12.
//

import UIKit

class MessageViewController: UIViewController {
//テキスト（大）
    @IBOutlet var bigmessagelabel : UILabel!
//テキスト（小）
    @IBOutlet var smallmessagelabel : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //popさせて最初の画面に戻したい
    @IBAction func back(){
        // PopしたいViewControllerのインスタンスを取得する
        if let homeViewController = navigationController?.viewControllers.first(where: { $0 is ViewController }) {
            // Popを実行する
            navigationController?.popToViewController(homeViewController, animated: true)
        }
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
