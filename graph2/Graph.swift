//
//  Graph.swift
//  graph2
//
//  Created by 坂本のぞみ on 2017/08/24.
//  Copyright © 2017年 g15938sn. All rights reserved.
//

import UIKit

class Graph: UIView {
    

    //データ
    var graphPoints:[Float]=[]
    //最終目標
    var goalData:Float=0
    //var goalDataInt:Int=0
    //グラフのプロットデータ設定のメソッド
    func setData(points: [Float],goal: Float){

        graphPoints=points
        goalData=goal
        print("goal \(goal)")
       //配列のfor
        /*for(index,elements) in graphPoints.enumerated(){
            graphPointsInt.append(0)
            //graphPointsInt[index]=Int(graphPoints[index]*10)
            print("graphPointsInt :\(graphPointsInt)")
        }*/
        
        //drawRectを呼び出す予約をする。
        self.setNeedsDisplay()
    }
    
    
    override func draw(_ rect :CGRect){
        //縦幅・横幅
        let width = rect.width
        let height = rect.height
        print("graphPoints \(graphPoints)")
        
        
        
        //最終ゴールInt
        //goalDataInt=Int(goalData*10)
        //X座標・幅
        let margin:CGFloat = 20.0
        let XCoordinate = { (coordinate:Int) -> CGFloat in
            
            let space = (width - margin*2 - 2) /
                CGFloat((self.graphPoints.count - 1))
            var x:CGFloat = CGFloat(coordinate) * space
            x += margin + 2
            return x
        }
        
        
        //Y座標(高さ)の上限下限
        let topBorder :CGFloat = CGFloat(graphPoints.max()!) + 10.0
        let bottomBorder : CGFloat = CGFloat(goalData) - 2.0
        print("bottomBorder: \(bottomBorder)")
        print("topBorder:  \(topBorder)")
        let graphHeight = height - topBorder - bottomBorder
        print("graphHeight :\( graphHeight)")
        //Y最大値
        let maxYValue = graphPoints.max() ?? 1
        //最大値を求めないとtopborderとbottomborderが引けない
        
        //Y座標
        let YCoordinate = {(coordinate: Int) -> CGFloat in
            var y :CGFloat = CGFloat(coordinate) / CGFloat(maxYValue) * graphHeight
            y = graphHeight + topBorder - y
            return y
        }
        
        
        
        //折れ線グラフの描画(黒文字)
        UIColor.black.setFill()
        UIColor.black.setStroke()
        
        
        let graphPath = UIBezierPath()
        
        
        //始点
        graphPath.move(to: CGPoint(x:XCoordinate(0),
                                   y:YCoordinate(Int(graphPoints[0]))))
        
        for i in 1..<graphPoints.count{
            let nextPoint = CGPoint(x:XCoordinate(i),
                                    y:YCoordinate(Int(graphPoints[i])))
            graphPath.addLine(to: nextPoint)
        }
        
        graphPath.stroke()
        
       
        
        
        //プロットの描画
        for i in 0..<graphPoints.count{
            var point = CGPoint(x:XCoordinate(i), y:YCoordinate(Int(graphPoints[i])))
            point.x -= 5.0/2
            point.y -= 5.0/2
        
            let circlePoint = UIBezierPath(ovalIn: CGRect(origin: point,
                                        size: CGSize(width: 5.0,height: 5.0)))
            circlePoint.fill()
        
        }
        
       //線を引く
        let linePath=UIBezierPath()
        
        //上の線の出発点・終点
        linePath.move(to: CGPoint(x:margin, y:topBorder+20))
        linePath.addLine(to: CGPoint(x:width-margin,y:topBorder+20))
        
        //中心線の出発点・終点
        /*linePath.move(to: CGPoint(x:margin,y:graphHeight/2+topBorder))
        linePath.addLine(to: CGPoint(x:width-margin,y:graphHeight/2+topBorder))*/
        
        //下の線の出発点・終点
        linePath.move(to: CGPoint(x:margin,y:bottomBorder))
        linePath.addLine(to: CGPoint(x:width-margin,y:bottomBorder))
        
        //色を作る
        let color = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
        color.setStroke()
        
        //線を描く
        linePath.lineWidth=1.0
        linePath.stroke()
        
        
        
        
    }

}
