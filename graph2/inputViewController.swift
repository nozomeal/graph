//
//  inputViewController.swift
//  graph2
//
//  Created by 坂本のぞみ on 2017/08/24.
//  Copyright © 2017年 g15938sn. All rights reserved.
//

import UIKit

class inputViewController: UIViewController,UIPickerViewDelegate {
    
    
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var dateDisplay: UITextField!
    
    //データと日付を格納する配列
    var dataArray: [Dictionary<String,String>]=[]
    
    //ユーザーデフォルト
    let saveData=UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 現在日時
        let date = Date()
        let calendar = Calendar.current
        //フォーマット作成
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy/MM/dd hh:mm"
        //現時刻まで表示
        let selectedDate: NSString=fmt.string(from: date) as NSString
        dateDisplay.text = selectedDate as String
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func done(_ sender: Any) {
        
        //データが入力された時にデータを保存する
        let dataDictionary = ["data": weightTextField.text! , "date":dateDisplay.text!]
        
        //配列に追加
        dataArray.append(dataDictionary)
        saveData.set(dataArray, forKey: "data")
        
        print(dataArray)
        
        
    }
    
    
    

}
