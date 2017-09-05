//
//  ViewController.swift
//  graph2
//
//  Created by 坂本のぞみ on 2017/08/23.
//  Copyright © 2017年 g15938sn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var graph:Graph!
    
    //最終目標データ
    var goalData:Float = 0.0
    //ユーザデフォルト
    let saveData:UserDefaults = UserDefaults()
    
    //計測値をdictionary型配列
    var dateKariArray:[Float]=[]//["data":49],["data":48],["data":44],["data":41],["data":44],["data":42]]
    //var
    var dataArray:[Float]=[47.2,46.1,45.5,47.1,45.0]
    var dateArray:[String]=[]
    var index=0
    //var element:Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //inputViewControllerから値を持ってくる
       goalData=saveData.float(forKey: "goal")
        dataArray=saveData.array(forKey: "data") as! [Float]
        dateArray=saveData.array(forKey: "date") as! [String]
        
        
       
        print("goal : \(goalData)")
        print("data : \(dataArray)")
        print("date : \(dateArray)")
        //[Dictionary<String, String>]->[Dictionary<String, Float>]
        
        dataArray=[47.2,46.1,45.5,47.1,45.0]
        
        graph.setData(points: dataArray,goal: goalData)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
