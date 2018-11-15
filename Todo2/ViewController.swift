//
//  ViewController.swift
//  Todo2
//
//  Created by 藤澤洋佑 on 2018/09/05.
//  Copyright © 2018年 Fujisawa-Yousuke. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Userdefaultsにデータを渡すための配列
    var array = [String]()
    
    @IBOutlet weak var tableVIEW: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //セルを返す
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = array[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        //もし消去のスワイプが実行された場合
        if editingStyle == .delete {
            
            //削除する
            array.remove(at: indexPath.row)
            
            //Userdefaultsを更新
            UserDefaults.standard.set(array, forKey: "user")
            
            //tableviewを更新
            tableView.reloadData()
            
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        //デリゲートとデータソースを宣言
        tableVIEW.delegate = self
        tableVIEW.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Userdefaultsに保存されているセルを取り出す
        if UserDefaults.standard.object(forKey: "user") != nil {
            array = UserDefaults.standard.object(forKey: "user") as! [String]
        }
        
        //セル、セクション、セル内容を読み込む
        tableVIEW.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

