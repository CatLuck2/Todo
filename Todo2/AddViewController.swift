//
//  AddViewController.swift
//  Todo2
//
//  Created by 藤澤洋佑 on 2018/09/05.
//  Copyright © 2018年 Fujisawa-Yousuke. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    //Userdefaultsを保存する配列
    var array = [String]()
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addButton(_ sender: Any) {
        
        //セルの現在状況を読み込む
        if UserDefaults.standard.object(forKey: "user") != nil {
            array = UserDefaults.standard.object(forKey: "user") as! [String]
        }
        
        //配列にテキストラベルの値を追加
        array.append(textField.text!)
        
        //テキストラベルの値をUserdefaultsに追加する
        UserDefaults.standard.set(array, forKey: "user")
        
        //前画面に戻る
        self.navigationController?.popViewController(animated: true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func sprepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
