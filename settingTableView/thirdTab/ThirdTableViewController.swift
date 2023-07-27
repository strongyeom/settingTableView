//
//  ThirdTableViewController.swift
//  settingTableView
//
//  Created by 염성필 on 2023/07/27.
//

import UIKit


/*
 1.
 TableCell에서 style을 custom이 아닐 때는 기본 구성의 위치를 바꿀 수 없음
 ex) 사진 레이블 사진 ❌ / accerssory     사진 레이블 레이블  🅾️ /  accerssory
 그렇기 때문에 Cell 안에서 이벤트를 사용 할 수 없음
 
 2.
 TableCell에 TapGesture를 적용하면 cell이 재사용되면서 생성되지만 TapGesture는 적용되지 않는다...
 Cell에 이벤트를 적용하려면 didSelectRowAt 메서드 사용
 
    📌 공부해야 할 것들
 
    🔍 데이터 전달 방식
    1. delegate 패턴을 이용해서 데이터를 받을 수 있음
    2. 클로저를 사용해서 받을 수 있음
    3. notification을 사용 해서 받을 수 있음
 
    🔍 Property Wrapper
 
 * 참고 블로그 : https://leechamin.tistory.com/500
 
 */

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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell 클릭 row: \(indexPath.row)")
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "thirdCell")!
        cell.textLabel?.text = shoppingList[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
 
}
