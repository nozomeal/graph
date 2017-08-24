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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        graph.setData(points: [1,7,1,7,1,20,1,7,1,7,1,7,1])
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

