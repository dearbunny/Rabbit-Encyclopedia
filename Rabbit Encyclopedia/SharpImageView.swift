//
//  SharpImageView.swift
//  Rabbit Encyclopedia
//
//  Created by Rose on 2021/4/9.
//

import UIKit

class SharpImageView: UIImageView {
    // //layoutSubviews() 是 UIView 的 function，當它執行時，它會依據 auto layout 的 constraint 排版 subviews。當我們在 function layoutSubviews 的 super.layoutSubviews() 後寫程式時，此時元件自己和它的 subviews 都已依 auto layout 的 constraint 得到位置大小，因此我們可從 bounds.height & bounds.width 取得圖片的寬高。

    
    //斜邊程式碼
    override func layoutSubviews() {
       //呼叫父類別func
        super.layoutSubviews()
       //UIBezierPath 繪製路徑
       let path = UIBezierPath()
        //第一個座標點，使用CGPoint.zero(x=0,y=0)
       path.move(to: CGPoint.zero)
        //使用bouns取得圖片寬度，使第一個座標點連到圖像右上點(x為圖片寬度,y仍為零)
       path.addLine(to: CGPoint(x: bounds.width, y: 0))
        //使用bouns取得圖片寬度及高度，使第一個座標點連到右下點(x不變，y畫到圖片高度)
       path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        //bouns取得圖片寬度，畫到圖像左下邊界(x到圖片左邊，y為200)
       path.addLine(to: CGPoint(x: 0, y: bounds.height * 0.8))
        //回到第一個點(0,0)
       path.close()
        //CAShapeLayer 可繪製特定的形狀，我們透過它的 path 設定形狀。然而 triangleLayer.path 的型別是 CGPath，所以我們無法指定剛剛生成的 UIBezierPath ，而須利用 path.cgPath 讀取 CGPath 型別的三角形路徑後再存入 triangleLayer.path。
       let shapeLayer = CAShapeLayer()
       shapeLayer.path = path.cgPath
        //// 最後將我們圖片的 layer.mask 設置為我們剛剛所創建的 mask
       layer.mask = shapeLayer
    }


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
