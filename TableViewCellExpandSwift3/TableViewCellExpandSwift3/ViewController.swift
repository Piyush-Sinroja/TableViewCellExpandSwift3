//
//  ViewController.swift
//  TableViewCellExpandSwift3
//
//  Created by piyush sinroja on 06/01/17.

import UIKit

class ViewController: UIViewController {
    var cellObj : expandCell = expandCell()
    var arrayData: [[String:String]] = [[String:String]]()
    var dicData: [String : String] = [String : String]()
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.estimatedRowHeight = 44.0
        tableview.rowHeight = UITableViewAutomaticDimension
        setupArrayAndDic()
    }
    func setupArrayAndDic() {
        for _ in 1..<10{
            dicData = ["expand": "1"]
            arrayData.append(dicData)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleTap(_ sender: UITapGestureRecognizer? = nil)  {
        if let viewnew = sender?.view as! HeaderView?{
            
            var dicDataNew = arrayData[viewnew.tag]
            if  dicDataNew["expand"] == "0" {
            arrayData[viewnew.tag].updateValue("1", forKey: "expand")
            viewnew.animateImageClockwise(imageview: viewnew.imgview, value: -180.0)
            }
            else {
                arrayData[viewnew.tag].updateValue("0", forKey: "expand")
                viewnew.animateImageAntiClockwise(imageview: viewnew.imgview, value: CGFloat(M_PI))
            }
            
            self.tableview.reloadSections([viewnew.tag], with: UITableViewRowAnimation.none)
        }
    }
}
//MARK:- UITableViewDataSource Methods
extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let strCheck: String = arrayData[section]["expand"]!
        if strCheck == "0"{
            return 0
        }
        else{
            return 2
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellObj = tableview.dequeueReusableCell(withIdentifier: "cell") as! expandCell
        cellObj.lblDesc.text = "Section = \(indexPath.section) Row = \(indexPath.row)"
        return cellObj
    }
}
//MARK:- UITableViewDelegate Methods
extension ViewController: UITableViewDelegate, UIGestureRecognizerDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let viewnew : HeaderView = Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)![0] as! HeaderView
        
        print(arrayData)
    
        var dicDataNew = arrayData[section]
        if  dicDataNew["expand"] == "0"
        {
            viewnew.imgview.transform = CGAffineTransform(rotationAngle: self.DEGREES_TO_RADIANS(value: 180.0))
        }
        else if dicDataNew["expand"] == "1"
        {
            viewnew.imgview.transform = CGAffineTransform(rotationAngle: self.DEGREES_TO_RADIANS(value: 0))
        }
        
        viewnew.tag = section
        viewnew.lblHeader!.text = "Section : \(section)"
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap(_:)))
        tap.numberOfTapsRequired = 1
        tap.delegate = self
        viewnew.isUserInteractionEnabled = true
        viewnew.addGestureRecognizer(tap)
    
        return viewnew
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    func DEGREES_TO_RADIANS(value: CGFloat) -> CGFloat {
        return ((CGFloat(M_PI) * value)/180.0)
    }
}
