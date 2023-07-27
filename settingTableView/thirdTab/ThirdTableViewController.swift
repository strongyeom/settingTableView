//
//  ThirdTableViewController.swift
//  settingTableView
//
//  Created by 염성필 on 2023/07/27.
//

import UIKit

class ThirdTableViewController: UITableViewController {
    
    @IBOutlet var inputTextField: UITextField!
    
    @IBOutlet var checkBoxImage: UIImageView!
    var shoppingList: [String] = ["브로콜리",
                                  "냠냠" ,
                                  "난 빈그릇 증후근"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
        
        let aa = UserDefaults.standard.array(forKey: "shoppingList") as? [String] ?? shoppingList
        shoppingList = aa
        print("shoppingList",shoppingList)
    }
    
    
    @IBAction func addBtnClicked(_ sender: UIButton) {
        print(#function)
        if let text = inputTextField.text {
            shoppingList.append(text)
        }
        UserDefaults.standard.set(shoppingList, forKey: "shoppingList")
        
        tableView.reloadData()
        inputTextField.text = ""
     
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "thirdCell")!
        cell.textLabel?.text = shoppingList[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
 
}
