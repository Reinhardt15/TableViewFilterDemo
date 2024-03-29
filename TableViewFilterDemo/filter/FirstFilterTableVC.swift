//
//  FirstFilterTableVC.swift
//  TableViewFilterDemo
//
//  Created by Rienhardt on 2019/04/17.
//  Copyright © 2019 ReinhardEnero. All rights reserved.
//

import UIKit
//筛选feild 2 3 5
class FirstFilterTableVC: UITableViewController{
    //全部数据
    var cardatas: [Cardata] = []
    //feild2标题
    var feild2Datas: [String] = []
    //feild3标题
    var feild3Datas: [String] = []
    //feild5标题
    var feild5Datas: [String] = []
    //标题数组
    var feildsTitles = [Array<String>]()
    //加载全部数据
    func loadJson() {
        let coder = JSONDecoder()
        
        do{
            let url = Bundle.main.url(forResource: "Cardata", withExtension: "json")!
            let data = try Data(contentsOf: url)
            cardatas = try coder.decode([Cardata].self, from: data)
            
        }
        catch{
            print("解码错误",error)
            
        }
    }
    
    //加载feild2 3 5标题
    func loadFields() -> Void {
        for cardata:Cardata in cardatas {
            if(!feild2Datas.contains(cardata.FIELD2))
            {
                feild2Datas.append(cardata.FIELD2);
            }
            if(!feild3Datas.contains(cardata.FIELD3))
            {
                feild3Datas.append(cardata.FIELD3);
            }
            if(!feild5Datas.contains(cardata.FIELD5))
            {
                feild5Datas.append(cardata.FIELD5);
            }
        }
        feildsTitles = [feild2Datas,feild3Datas,feild5Datas];
        tableView.reloadData()
    }
    
    //拼接字符串
    func creatFeildTitleStr(feildDatas:Array<String>) -> String {
        var titles:String = ""
        for title:String in feildDatas {
            if(titles.isEmpty)
            {
                titles += title
            }else
            {
                titles += ("," + title)
            }
            
        }
        print(titles)
        return titles;
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJson()
        loadFields()
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
        return feildsTitles.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configure the cell...
        if indexPath.row==1 {
            cell.textLabel?.text = "Brand"
        }else
        {
            cell.textLabel?.text = creatFeildTitleStr(feildDatas: feildsTitles[indexPath.row])
        }
        
        
        return cell
    }
    //转场传值
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSecond" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! SecondFilterTableVC
                destinationController.searchType = indexPath.row
                destinationController.cardatas = cardatas;
                destinationController.feildDatas = feildsTitles[indexPath.row]
            }
        }
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
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

