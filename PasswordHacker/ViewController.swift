//
//  ViewController.swift
//  PasswordHacker
//
//  Created by Mac on 2021/02/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resultLabel1: UILabel!
    @IBOutlet var resultLabel2: UILabel!
    @IBOutlet var resultLabel3: UILabel!
    @IBOutlet var resultLabel4: UILabel!
    
    @IBOutlet var countLabel: UILabel!
    
    //パスワード
    var password:Int = 1234
    var key: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func start()
    {
        key = 0
        for i in 0...9999
        {
            if key == 1
            {
                break;
            }
            countLabel.text = String(i)
            
            //次の処理に行く前に0.0005秒待機させる
            RunLoop.main.run(until: Date(timeIntervalSinceNow: 0.0005))
            
            if i == password
            {
                var digits = [Int]() //int型の配列
                for _ in 0...3
                {
                    digits.append(password % 10)
                    password = password / 10
                }
                
                resultLabel1.text = String(digits[0])
                resultLabel2.text = String(digits[1])
                resultLabel3.text = String(digits[2])
                resultLabel4.text = String(digits[3])
                
                print("正解は\(i)です！")
            }
        }
    }
    
    @IBAction func reset()
    {
        password = 1234 //passwordを再設定
        key = 1 //flag
        
        //countLabelの表示を元に戻す
        countLabel.text = "「START」ボタンを押して解析開始"
        
        //ラベルの表示を０に戻す
        resultLabel1.text = "0"
        resultLabel2.text = "0"
        resultLabel3.text = "0"
        resultLabel4.text = "0"
    }


}

