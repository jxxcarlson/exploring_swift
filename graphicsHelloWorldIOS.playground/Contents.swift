import UIKit

func drawFigure(frame: CGRect) {
    
    let bgColor = UIColor(red: 0.58, green: 0.5,
        blue: 0.5, alpha: 1.0)
    let fgColor = UIColor(red: 1.0, green: 0.0,
        blue: 0.4, alpha: 1.0)
    let r1 =  CGRect(x: 40, y: 40,
        width: 160, height: 160)
    
    bgColor.setFill()
    UIRectFill(frame)
    
    fgColor.setFill()
    UIRectFill(r1)
}

class GView: UIView {
    override func drawRect(dirtyRect: CGRect) {
        drawFigure(self.frame)
    }
}

let view = GView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
