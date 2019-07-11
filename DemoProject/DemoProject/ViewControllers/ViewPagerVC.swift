//
//  ViewPagerVC.swift
//  DemoProject
//
//  Created by Aquib on 08/07/19.
//  Copyright © 2019 Aquib. All rights reserved.
//

import UIKit
class ViewPagerVC: UIViewController {
    
    var tabs:Array<Tab> = [
        Tab(title:"TODOS",isSelected: true),
        Tab(title:"LISTOS"),
        Tab(title:"RESTAURANTES"),
        Tab(title:"ENTRADAS"),
        Tab(title:"CARIDAD"),
        Tab(title:"TODOS1",isSelected: true),
        Tab(title:"LISTOS1"),
        Tab(title:"RESTAURANTES1"),
        Tab(title:"ENTRADAS1"),
        Tab(title:"CARIDAD1")
    ]
    
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let layout = bottomCollectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.462745098, green: 0.8274509804, blue: 0.3176470588, alpha: 1)
        navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
}

extension ViewPagerVC:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case topCollectionView:
            let text = tabs[indexPath.row].title
            let width = text.width(font:UIFont.systemFont(ofSize: 14), height:collectionView.frame.height) + 48
            return CGSize(width: width, height: collectionView.frame.height)
        default:
            return bottomCollectionView.frame.size
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case topCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCell", for: indexPath) as! TabCell
            cell.tab = tabs[indexPath.row]
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabDetailCell", for: indexPath) as! TabDetailCell
            cell.vc = self
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case topCollectionView:
            bottomCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        default:
            break
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == bottomCollectionView{
            let width = bottomCollectionView.frame.width
            let xOffset = scrollView.contentOffset.x
            let position = xOffset/width
            print("Position",position)
            if xOffset.truncatingRemainder(dividingBy: width) == 0{
                print(position)
                scrollTopCollectionView(position: Int(position))
            }
        }
    }
    
    func scrollTopCollectionView(position:Int){
        let indexPath = IndexPath(row: position, section: 0)
        for (index,tab) in tabs.enumerated(){
            tab.isSelected = index == position
        }
        topCollectionView.reloadData()
        topCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
}


