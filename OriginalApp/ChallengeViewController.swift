//
//  ChallengeViewController.swift
//  OriginalApp
//
//  Created by 岸本迪之進 on 2023/07/12.
//

import UIKit

class ChallengeViewController: UIViewController {
    
    //ミッションの配列
    let missionarray = ["隣の席の子に話しかけよう","メンターにマイブームを聞こう","隣の子に今日の出来事を話そう","メンターに生活の愚痴を話そう","３人に名前を聞こう","5人に名前を聞こう"]//元の配列
    lazy var missiondecidearray = missionarray.shuffled()
    //ミッション（ラベル関連）
    @IBOutlet var mission0label : UILabel! //配列0番地
    @IBOutlet var mission1label : UILabel! //配列1番地
    @IBOutlet var mission2label : UILabel! //配列2番地
    
    @IBOutlet var button0: UIButton!//これこの後一旦保留
    
    //これから作る、ボタンの代わりにImageViewにタップ判定をつける
    @IBOutlet weak var button00 : UIImageView!
    @IBOutlet weak var button01 : UIImageView!
    @IBOutlet weak var button02 : UIImageView!
    
    //タップした時の関数
    //@objc func imageViewTapped(_ sender: UITapGestureRecognizer) {
    //    print("タップ")
    //}
    
    
    
    //ボタンが奇数回目に押された/偶数回めに押された
    var isDone: [Bool] = [false, false, false]
    //ボタン押下時のボタンの画像
    var image = UIImage(named: "checkmark")
    
    let unfinishedimage = UIImage(named: "unfinishedcheckmark")
    
    //missionarray.append("何か")//配列への追加
    //タイマー関連
    var timer : Timer!
    var timercount : Int = 0// 残り秒数
    @IBOutlet var timerlabel :UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //タップ判定の取得
        button00.isUserInteractionEnabled = true
        button00.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:))))
        
        //timer関係
        timercount = 8999
        timerlabel.text = "\(timercount / 3600)時間\((timercount / 60) % 60)分\(timercount % 60)秒"
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
            if self.timercount > 0 {
                self.timercount -= 1
                self.timerlabel.text = "\(self.timercount / 3600)時間\((self.timercount / 60) % 60)分\(self.timercount % 60)秒"
            } else {
                self.navigationController?.popViewController(animated: true)
            }
            
        })
        
        //ミッション（ボタンの下のやつ関連）
        mission0label.text = String(missiondecidearray[0])
        mission1label.text = String(missiondecidearray[1])
        mission2label.text = String(missiondecidearray[2])
    }
    //チェックボックス（ボタン関連）
    @objc func imageViewTapped(_ sender: UITapGestureRecognizer) {
        isDone[0] = !isDone[0]
        if isDone[0] {
            //button0.setImage(image, for: .normal)
            // let rect:CGRect = CGRect(x:30, y:460, width:90, height:90)
            //button0.frame = rect;
            
        } else {
            //button0.setImage(unfinishedimage, for: .normal)
            //button0.setImage(nil, for: .normal)
            //print(button0.currentImage)
            //ボタンの見た目をチェックなしに
        }
        print(isDone)
    }//一番左のチェックボックス
    @IBAction func check1(){
        isDone[1] = !isDone[1]
        if isDone[1] == true{
            //ボタンの見た目をチェック付きに
        } else {
            //ボタンの見た目をチェックなしに
        }
        print(isDone)
    }//真ん中のチェックボックス
    @IBAction func check2(){
        isDone[2] = !isDone[2]
        if isDone[2] == true{
            //ボタンの見た目をチェック付きに
        } else {
            //ボタンの見た目をチェックなしに
        }
        print(isDone)
    }//一番右のチェックボックス
    //つぎへのところ、つぎへ→next
    @IBAction func next(){
        let messageViewController = self.storyboard?.instantiateViewController(withIdentifier: "message") as! MessageViewController
        messageViewController.isDone = isDone
        messageViewController.timercount = timercount
        self.navigationController?.pushViewController(messageViewController, animated: true)
    }
}
