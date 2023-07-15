//
//  ChallengeViewController.swift
//  OriginalApp
//
//  Created by 岸本迪之進 on 2023/07/12.
//

import UIKit

class ChallengeViewController: UIViewController {
    
    //ミッション（ラベル関連）
    @IBOutlet var mission0label : UILabel! //配列0番地
    @IBOutlet var mission1label : UILabel! //配列1番地
    @IBOutlet var mission2label : UILabel! //配列2番地
    
    let missionarray : [String] = []
    //missionarray.append("何か")//配列への追加
    //タイマー関連
    var timer : Timer!
    var timercount : Int = 0// 残り秒数
    @IBOutlet var timerlabel :UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //timer関係
        timercount = 9000
        timerlabel.text = String(timercount)
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
            if self.timercount > 0 {
                self.timercount -= 1
                self.timerlabel.text = String(self.timercount)}
            else {
                self.navigationController?.popViewController(animated: true)
            }
                
            })
        // Do any additional setup after loading the view.
    }
    //チェックボックス（ボタン関連）
    @IBAction func check0(){}//一番左のチェックボックス
    @IBAction func check1(){}//真ん中のチェックボックス
    @IBAction func check2(){}//一番右のチェックボックス
    //つぎへのところ、つぎへ→next
    @IBAction func next(){
        let messageViewController = self.storyboard?.instantiateViewController(withIdentifier: "message") as! MessageViewController
        self.navigationController?.pushViewController(messageViewController, animated: true)
    }
    
    
}
