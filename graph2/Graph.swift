//
//  Graph.swift
//  graph2
//
//  Created by 坂本のぞみ on 2017/08/24.
//  Copyright © 2017年 g15938sn. All rights reserved.
//

import UIKit

class Graph: UIView {

    //仮データ
    var graphPoints:[Int]=[]
    
    //グラフのプロットデータ設定のメソッド
    func setData(points: [Int]){
        graphPoints=points
        
        //drawRectを呼び出す予約をする。
        self.setNeedsDisplay()
    }
    
    
    override func draw(_ rect :CGRect){
        //縦幅・横幅
        let width = rect.width
        let height = rect.height
        
        //余白
        let margin :CGFloat = 30.0
        //X座標
        let XCoordinate = {(coordinate:Int) -> CGFloat in
        
            let interval =  (width - margin*2) / CGFloat((self.graphPoints.count-1))
            var x :CGFloat = CGFloat(coordinate) * interval
            x += interval + 2
            return x
        }
        
        
        //高さの上限下限
        let topBorder :CGFloat = CGFloat(graphPoints.max()!) + 10.0
        let bottomBorder : CGFloat = CGFloat(graphPoints.min()!) - 10.0
        let graphHeight = height - topBorder - bottomBorder
        //最大値
        let maxValue = graphPoints.max() ?? 1
        //Y座標
        let YCoordinate = {(graphPoint: Int) -> CGFloat in
            
            var y :CGFloat = CGFloat(graphPoint) / CGFloat(maxValue) * graphHeight
            y = graphHeight + topBorder - y
            return y
        
        }
        
        //折れ線グラフの描画(黒文字)
        UIColor.black.setFill()
        UIColor.black.setStroke()
        
        let graphPath = UIBezierPath()
        //始点
        graphPath.move(to: CGPoint(x:XCoordinate(0),
                                   y:YCoordinate(graphPoints[0])))
        
        for i in 1..<graphPoints.count{
            let nextPoint = CGPoint(x:XCoordinate(i),
                    y:YCoordinate(graphPoints[i]))
            graphPath.addLine(to: nextPoint)
        }
        
        graphPath.stroke()
        
        //プロットの描画
        for i in 0..<graphPoints.count{
            var point = CGPoint(x:XCoordinate(i), y:YCoordinate(graphPoints[i]))
            point.x -= 5.0/2
            point.y -= 5.0/2
        
            let circlePoint = UIBezierPath(ovalIn: CGRect(origin: point,
                                        size: CGSize(width: 5.0,height: 5.0)))
        circlePoint.fill()
        
        }
        
        //線を引く
        let linePath=UIBezierPath()
        
        //上の線の出発点・終点
        linePath.move(to: CGPoint(x:margin, y:topBorder))
        linePath.addLine(to: CGPoint(x:width-margin,y:topBorder))
        
        //中心線の出発点・終点
        linePath.move(to: CGPoint(x:margin,y:graphHeight/2+topBorder))
        linePath.addLine(to: CGPoint(x:width-margin,y:graphHeight/2+topBorder))
        
        //下の線の出発点・終点
        linePath.move(to: CGPoint(x:margin,y:graphHeight-bottomBorder))
        linePath.addLine(to: CGPoint(x:width-margin,y:graphHeight-bottomBorder))
        
        //色を作る
        let color = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
        color.setStroke()
        
        //線を描く
        linePath.lineWidth=1.0
        linePath.stroke()
        
        
        
        
    }

}
