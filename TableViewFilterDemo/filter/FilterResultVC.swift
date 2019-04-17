//
//  FilterResultVC.swift
//  TableViewFilterDemo
//
//  Created by Rienhardt on 2019/04/17.
//  Copyright © 2019 ReinhardEnero. All rights reserved.
//

import UIKit

class FilterResultVC: UITableViewController{

    //feild类型  235   0-》2，1-》3，2-》5
    var searchType:intmax_t = 0;
    //全部数据
    var cardatas: [Cardata] = []
    var searchString:String = ""
    var searchResults: [Cardata] = []
    
    //按选择的字段进行筛选结果
    func searchFilter(text: String){
        switch searchType {
        case 0:
            searchResults = cardatas.filter({ (Cardata) -> Bool in
                return Cardata.FIELD2.localizedCaseInsensitiveContains(text)})
        case 1:
            searchResults = cardatas.filter({ (Cardata) -> Bool in
                return Cardata.FIELD3.localizedCaseInsensitiveContains(text)})
        case 2:
            searchResults = cardatas.filter({ (Cardata) -> Bool in
                return Cardata.FIELD5.localizedCaseInsensitiveContains(text)})
        default:
            searchResults = cardatas.filter({ (Cardata) -> Bool in
                return Cardata.FIELD2.localizedCaseInsensitiveContains(text)})
        }
    }
    
    @IBAction func favBtnTap(_ sender: UIButton) {
        let btnPos = sender.convert(CGPoint.zero, to: self.tableView)
        print("爱心所在tableview中的位置",btnPos)
        let indexPath = tableView.indexPathForRow(at: btnPos)!
        
        print("爱心所在行", indexPath)
        self.searchResults[indexPath.row].FIELD6 = !self.searchResults[indexPath.row].FIELD6
        
        let cell = tableView.cellForRow(at: indexPath) as! CardCell
        
        cell.favorite = self.searchResults[indexPath.row].FIELD6
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        searchFilter(text: searchString)
        tableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchResults.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = String(describing: CardCell.self)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! CardCell
        
        
        let Cardata = searchResults[indexPath.row]
        // Configure the cell...
        cell.classLabel.text  = Cardata.FIELD2
        cell.accradLabel.text = Cardata.FIELD3
        cell.brandLabel.text = Cardata.FIELD4
        cell.backImageView.image = UIImage(named: Cardata.FIELD1)
        cell.favorite = Cardata.FIELD6
        
        cell.accessoryType = Cardata.FIELD6 ? .checkmark : .none
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
