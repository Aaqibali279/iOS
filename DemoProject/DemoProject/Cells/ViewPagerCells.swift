//
//  ViewPagerCells.swift
//  DemoProject
//
//  Created by Aquib on 08/07/19.
//  Copyright © 2019 Aquib. All rights reserved.
//

import UIKit
class TableCell: UITableViewCell {
    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var bgView:UIView!
    @IBOutlet weak var pointsView:UIView!
}



class TabDetailCell:UICollectionViewCell{
    @IBOutlet weak var tableView: UITableView!
    
    var vc:UIViewController?
    
    override func awakeFromNib() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}
extension TabDetailCell:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableCell
        cell.bgView.layer.masksToBounds = false
        cell.bgView.layer.cornerRadius = 10
        cell.bgView.layer.shadowOpacity = 0.4
        cell.layoutIfNeeded()
        setBgPath(cell: cell)
        setProgressPath(cell: cell)
        setImageMask(cell:cell)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.width * 0.9
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    
    private func setBgPath(cell:TableCell){
        let path = UIBezierPath(roundedRect: .init(x: cell.pointsView.bounds.minX, y: cell.pointsView.bounds.minY, width: cell.pointsView.bounds.width, height: 6), byRoundingCorners: [.allCorners], cornerRadii: .init(width: 3, height: 3))
        path.lineCapStyle = .round
        let bgPathLayer = CAShapeLayer()
        bgPathLayer.path = path.cgPath
        bgPathLayer.cornerRadius = 3
        bgPathLayer.masksToBounds = false
        bgPathLayer.fillColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        cell.pointsView.layer.addSublayer(bgPathLayer)
    }
    
    private func setProgressPath(cell:TableCell){
        let pointsPath = UIBezierPath(roundedRect: .init(x: cell.pointsView.bounds.minX, y: cell.pointsView.bounds.minY, width: cell.pointsView.bounds.width/2, height: 6), byRoundingCorners: [.allCorners], cornerRadii: .init(width: 3, height: 3))
        pointsPath.lineCapStyle = .butt
        let pointsLayer = CAShapeLayer()
        pointsLayer.path = pointsPath.cgPath
        pointsLayer.cornerRadius = 3
        pointsLayer.lineCap = .round
        pointsLayer.fillColor = UIColor.darkGray.cgColor
        cell.pointsView.layer.addSublayer(pointsLayer)
    }
    private func setImageMask(cell:TableCell){
        let maskPath = UIBezierPath(roundedRect: cell.iv.bounds, byRoundingCorners:[.topLeft,.topRight], cornerRadii: .init(width:10,height:10))
        let mask = CAShapeLayer()
        mask.path = maskPath.cgPath
        cell.iv.layer.mask = mask
    }
}

class Tab {
    var title:String
    var isSelected:Bool
    
    init(title:String,isSelected:Bool = false) {
        self.title = title
        self.isSelected = isSelected
    }
    
}

class TabCell: UICollectionViewCell {
    @IBOutlet weak var selector: UIView!
    @IBOutlet weak var label: UILabel!
    
    var tab:Tab?{
        didSet{
            guard let tab = tab else {return}
            selector.isHidden = !tab.isSelected
            label.text = tab.title
        }
    }
}


