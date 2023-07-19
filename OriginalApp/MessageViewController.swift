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
    
    var isDone : [Bool]!
    var timercount : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if isDone[0] == true && isDone[1] == true && isDone[2] == true {
            bigmessagelabel.text = "おめでとう！！"
            smallmessagelabel.text = "君は本当のコミュ強！！"
        } else if timercount != 0 {
            bigmessagelabel.text = "あきらめないで！！"
            smallmessagelabel.text = "まだいける！！"
        } else {
            bigmessagelabel.text = "ざんねん！！"
            smallmessagelabel.text = "次は頑張って！！"
        }
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

    
}
