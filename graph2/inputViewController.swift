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
    @IBOutlet weak var goalDataTextField:UITextField!
    
    //データを格納する配列
    var dataArray: [Float]=[]
    //日付を格納する配列
    var dateArray: [String]=[]
    //仮データと日付を格納する配列
    var debugArray1: [Float]=[]
    //日付を格納する配列
    var debugArray2: [String]=[]
    //ユーザーデフォルト
    let saveData=UserDefaults.standard
    //最終目標データ
    var goalData:Float = 0.0
    
    
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
        goalData=saveData.float(forKey: "goal")
        goalDataTextField.text = String(goalData)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func done(_ sender: Any) {
        
        //データが入力された時にデータを保存する
        let dataKariArray:String=weightTextField.text!
        let dateKariArray:String=dateDisplay.text!
        //dataをString->Float
        let data:Float=(dataKariArray as NSString).floatValue
        //(a as NSString).floatValue
        //配列に追加
        dataArray.append(data)
        dateArray.append(dateKariArray)
        //最終目標をstringで取得
        let goalString:String=goalDataTextField.text!
        //stringをintに変換
        goalData=Float(goalString)!
        
        //データ保存
        saveData.set(dataArray,forKey: "data")
        saveData.set(dateArray,forKey: "date")
        saveData.set(goalData,forKey: "goal")
        saveData.synchronize()
        print("dataArray :\(dataArray)")
        print("dateArray :\(dateArray)")
        print("goal :\(goalData)")
    }
    
    
    

}
