//
//  TreeNameTableViewController.swift
//  2015111457
//
//  Created by SWUCOMPUTER on 2017. 12. 22..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//  2015111457 컴퓨터학과 권종희

import UIKit
import CoreData

class TreeNameTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0); //테이블 뷰 위쪽의 여백을 지정해준다.

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    //key 값은 나무의 이름, value의 값은 각 사이즈이다
    var info:[String: [String]] =
        ["기막살나무": [
            "수고:0.6 수관폭:0.3",
            "수고:0.8 수관폭:0.3",
            "수고:1 수관폭:0.4",
            "수고:1.2 수관폭:0.6"],
         "가시나무": [
            "수고:2 근원직경:4",
            "수고:2.5 근원직경:5",
            "수고:3 근원직경:6",
            "수고:3.5 근원직경:8",
            "수고:4 근원직경:10"],
         "가죽나무(가중나무)":
            ["수고:2.5",
             "수고:3.5",
             "수고:4.5 흉고직경:10",
             "수고:5",
             "수고:4.5 흉고직경:12",
             "수고:4",
             "수고:3"],
         "나무수국":
            ["수고:1.0 수관폭:0.6",
             "수고:1.5 수관폭:1.0",
             "수고:1.2 수관폭:0.8"],
         "나한송":[
            "수고:1.2 수관폭:0.4",
            "수고:1.5 수관폭:0.6",
            "수고:1.8 수관폭:0.8",
            "수고:2.0 수관폭:1.0",
            "수고:2.5 수관폭:1.0",
            "수고:3.0 수관폭:1.2",
            "수고:3.5 수관폭:1.2",
            "수고:4.0 수관폭:1.5"],
         "노각나무":[
            "수고:2.0 근원직경:4.0",
            "수고:2.5 근원직경:6.0",
            "수고:3.0 근원직경:8.0",
            "수고:3.5 근원직경:10.0",
            "수고:3.5 근원직경:12.0",
            "수고:4.0 근원직경:15.0"],
         "다래덩굴":[
            "흉고직경:1 근원직경:2",
            "흉고직경:2 근원직경:4"],
         "다정큼나무":[
            "수고:0.6 수관폭:0.3",
            "수고:0.8 수관폭:0.5",
            "수고:1 수관폭:0.6",
            "수고:1.2 수관폭:0.8",
            "수고:1.5 수관폭:1"],
         "단풍철쭉":[
            "수고:0.3 수관폭:0.1",
            "수고:0.4 수관폭:0.2",
            "수고:0.6 수관폭:0.3",
            "수고:0.8 수관폭:0.5",
            "수고:1 수관폭:0.6"]
    ]
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return info.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tree Cell", for: indexPath)

        //이 뷰에는 키 값만 보여주고 각 열을 눌렀을때 각각의 사이즈를 보여준다.
        var treeName = Array(info.keys)
        cell.textLabel?.text = treeName[indexPath.row]

        return cell
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController. // Pass the selected object to the new view controller.
        if segue.identifier == "toSize" { //SizeTableViewController와 값을 주고받을 수 있도록 해준다.
            if let destination = segue.destination as? SizeTableViewController {
                if let selectedIndex = self.tableView.indexPathsForSelectedRows?.first?.row {
                    destination.title = Array(info.keys) [selectedIndex]
                    destination.sizeList = Array(info.values) [selectedIndex]
                    destination.name = Array(info.keys) [selectedIndex]
                }
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
