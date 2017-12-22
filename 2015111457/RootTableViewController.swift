//
//  RootTableViewController.swift
//  2015111457
//
//  Created by SWUCOMPUTER on 2017. 12. 22..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
// 2015111457 컴퓨터학과 권종희

import UIKit
import CoreData //core data를 사용하기 위해 추가

class RootTableViewController: UITableViewController {

    var trees: [NSManagedObject] =  [] //core data에서 값을 받아와 저장하기 위해 선언
    var totalCount:Int = 0 //총 금액을 계산하기 위한 변수


    var display: String = ""
    var display2: String = ""
    var display3: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    // View가 보여질 때 자료를 DB에서 가져오도록 한다
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let context = self.getContext()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Tree")
        
        let sortDescriptor = NSSortDescriptor (key: "treeName", ascending: true) //정렬 기준
        fetchRequest.sortDescriptors = [sortDescriptor] //정렬
        
        do {
            trees = try context.fetch(fetchRequest)
        }
        catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        totalCount = 0
        self.tableView.reloadData() //바뀐 내용을 화면에 뿌려줌
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1 //한 섹션만 사용할 것이다.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return trees.count //core data에 저장된 오브젝트를 모두 보여주므로 그 수량만큼 필요하다.
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Trees Cell", for: indexPath)
        
        let tree = trees[indexPath.row]
    
        if let nameLabel = tree.value(forKey: "treeName") as? String {
            display = nameLabel }
        
        if let nameLabel = tree.value(forKey: "treeSize") as? String {
            display = display + "  " + nameLabel }
        
        if let nameLabel2 = tree.value(forKey: "treenum") as? String {
            display2 = nameLabel2 }
        
        if let price = tree.value(forKey: "treeprice") as? String {
            display3 = price }
        
        
        cell.textLabel?.text = display //테이블 뷰에는 나무의 이름과 사이즈를 적어준다.
        cell.detailTextLabel?.text = display2 + "개" //디테일에는 수량을 적어준다.
     
        totalCount += (Int(display2)!*Int(display3)!) //총 금액
        

        
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? { //섹션이 끝나는 지점
        return "총 \(totalCount)원" }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // Core Data 내의 해당 자료 삭제
            let context = getContext()
            context.delete(trees[indexPath.row])
            do {
                try context.save()
                print("deleted!")
            } catch let error as NSError {
                print("Could not delete \(error), \(error.userInfo)") }
            // 배열에서 해당 자료 삭제
            trees.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
             totalCount = 0 //테이블 뷰가 바뀌었으므로 다시 계산하기위해 초기화
            self.tableView.reloadData() //바뀐 내용을 화면에 뿌려준다
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    
    
   
}
