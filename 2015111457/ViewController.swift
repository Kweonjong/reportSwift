//
//  ViewController.swift
//  2015111457
//
//  Created by SWUCOMPUTER on 2017. 12. 22..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//  2015111457 컴퓨터학과 권종희

import UIKit
import CoreData

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var sizeLabel: UILabel!
    @IBOutlet var numText: UITextField!
    
    var nameT: String = ""
    var sizeT: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        nameLabel.text = nameT
        sizeLabel.text = sizeT
        
    }

    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { textField.resignFirstResponder()
        return true }//텍스트 필드 키보드 처리
    
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Tree", in: context)
        // friend record를 새로 생성함
        let object = NSManagedObject(entity: entity!, insertInto: context)
        
        object.setValue(numText.text, forKey: "treenum")
        object.setValue(nameT, forKey: "treeName")
        object.setValue(sizeT, forKey: "treeSize")
        switch sizeT { //사이즈별 값을 저장한다.
        case "수고:0.6 수관폭:0.3": object.setValue("6500", forKey: "treeprice")
        case "수고:0.8 수관폭:0.3": object.setValue("9250", forKey: "treeprice")
        case "수고:1 수관폭:0.4": object.setValue("13550", forKey: "treeprice")
        case "수고:1.2 수관폭:0.6": object.setValue("30000", forKey: "treeprice")
        case "수고:2 근원직경:4": object.setValue("44000", forKey: "treeprice")
        case "수고:2.5 근원직경:5": object.setValue("63000", forKey: "treeprice")
        case "수고:3 근원직경:6": object.setValue("112000", forKey: "treeprice")
        case "수고:3.5 근원직경:8": object.setValue("170000", forKey: "treeprice")
        case "수고:4 근원직경:10": object.setValue("247000", forKey: "treeprice")
        case "수고:2.5": object.setValue("55860", forKey: "treeprice")
        case "수고:3.5": object.setValue("99000", forKey: "treeprice")
        case "수고:4.5 흉고직경:10":object.setValue("228000", forKey: "treeprice")
        case "수고:5":object.setValue("435000", forKey: "treeprice")
        case "수고:4.5 흉고직경:12":object.setValue("297000", forKey: "treeprice")
        case "수고:4":object.setValue("149000", forKey: "treeprice")
        case "수고:3":object.setValue("70000", forKey: "treeprice")
        case "수고:1.0 수관폭:0.6":object.setValue("10850", forKey: "treeprice")
        case "수고:1.5 수관폭:1.0":object.setValue("39000", forKey: "treeprice")
        case "수고:1.2 수관폭:0.8":object.setValue("20460", forKey: "treeprice")
        case "수고:1.2 수관폭:0.4":object.setValue("50580", forKey: "treeprice")
        case "수고:1.5 수관폭:0.6":object.setValue("80000", forKey: "treeprice")
        case "수고:1.8 수관폭:0.8":object.setValue("106000", forKey: "treeprice")
        case "수고:2.0 수관폭:1.0":object.setValue("135740", forKey: "treeprice")
        case "수고:2.5 수관폭:1.0":object.setValue("223050", forKey: "treeprice")
        case "수고:3.0 수관폭:1.2":object.setValue("253000", forKey: "treeprice")
        case "수고:3.5 수관폭:1.2":object.setValue("376000", forKey: "treeprice")
        case "수고:4.0 수관폭:1.5":object.setValue("489000", forKey: "treeprice")
        case "수고:2.0 근원직경:4.0":object.setValue("44000", forKey: "treeprice")
        case "수고:2.5 근원직경:6.0":object.setValue("78850", forKey: "treeprice")
        case "수고:3.0 근원직경:8.0":object.setValue("153000", forKey: "treeprice")
        case "수고:3.5 근원직경:10.0":object.setValue("350000", forKey: "treeprice")
        case "수고:3.5 근원직경:12.0":object.setValue("524000", forKey: "treeprice")
        case "수고:4.0 근원직경:15.0":object.setValue("930940", forKey: "treeprice")
        case "흉고직경:1 근원직경:2":object.setValue("36000", forKey: "treeprice")
        case "흉고직경:2 근원직경:4":object.setValue("61000", forKey: "treeprice")
        case "수고:0.6 수관폭:0.3":object.setValue("33000", forKey: "treeprice")
        case "수고:0.8 수관폭:0.5":object.setValue("49000", forKey: "treeprice")
        case "수고:1 수관폭:0.6":object.setValue("87000", forKey: "treeprice")
        case "수고:1.2 수관폭:0.8":object.setValue("146000", forKey: "treeprice")
        case "수고:1.5 수관폭:1":object.setValue("245000", forKey: "treeprice")
        case "수고:0.3 수관폭:0.1":object.setValue("2000", forKey: "treeprice")
        case "수고:0.4 수관폭:0.2":object.setValue("2880", forKey: "treeprice")
        case "수고:0.6 수관폭:0.3":object.setValue("5130", forKey: "treeprice")
        case "수고:0.8 수관폭:0.5":object.setValue("7700", forKey: "treeprice")
        case "수고:1 수관폭:0.6":object.setValue("9500", forKey: "treeprice")
        
        default:
            
            object.setValue(0, forKey: "treePrice")
        }
        
        
        do {
            try context.save() //저장
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        // 현재의 View를 없애고 루트 화면으로 복귀
        self.navigationController?.popToRootViewController(animated: true)
        
    }


}

