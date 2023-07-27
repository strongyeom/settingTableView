//
//  SecondTableViewController.swift
//  settingTableView
//
//  Created by 염성필 on 2023/07/27.
//

import UIKit

class SecondTableViewController: UITableViewController {

    let firstList: [String] = ["공지사항",
                                  "실험실",
                                  "버전 정보"]
    
    let secondList: [String] = ["개인/보안",
                                   "알림",
                                   "채팅"]
    
    let thirdList: [String] = ["고객센터/도움말"]
    
    lazy var kindOfSection: [[String]] = [firstList, secondList, thirdList]

    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        tableView.separatorColor = .red
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        // tableview.style 사용 할 수 없음
        /*
         왜냐하면 only - property임.. 스토리보드에 테이블 뷰 컨트롤러를 올렸기 때문에 (frame 과 style) defaults로 정해기 때문에 viewDidLoad에서 수정 할 수 없음
         */
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return kindOfSection.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return confiureCellCount(section: section)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return confiureSectionName(section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return confiureCell(indexPath: indexPath)
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight(indexPath: indexPath)
    }
    
}

extension SecondTableViewController {
    
    
    // MARK: - Cell의 갯수
    fileprivate func confiureCellCount(section: Int) -> Int {
        
        let sectionEnum = SectionEnum(rawValue: section)
        
        switch sectionEnum {
        case .firstSection:
            return firstList.count
        case .seconSection:
            return secondList.count
        case .thirdSection:
            return thirdList.count
        case .none:
            return 0
        }

    }
    
    // MARK: - Section의 이름설정 메서드
    fileprivate func confiureSectionName(section: Int) -> String? {
        
        let sectionEnum = SectionEnum(rawValue: section)
        
        switch sectionEnum {
        case .firstSection:
            return "전체 설정"
        case .seconSection:
            return "개인 설정"
        case .thirdSection:
            return "기타"
        case .none:
            return "오류"
        }
  
    }
    
    
    // MARK: - Cell을 보여주는 메서드
    fileprivate func confiureCell(indexPath: IndexPath) -> UITableViewCell {
        
        let sectionEnum = SectionEnum(rawValue: indexPath.section)
        
        switch sectionEnum {
        case .firstSection:
            return applyTableViewCell(list: firstList, indexPath: indexPath)
        case .seconSection:
            return applyTableViewCell(list: secondList, indexPath: indexPath)
        case .thirdSection:
            return applyTableViewCell(list: thirdList, indexPath: indexPath)
        case .none:
            return UITableViewCell()
        }
    }
    
    // 테이블뷰에 적용하는 메서드
    func applyTableViewCell(list: [String], indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell")!
        
        let section = SectionEnum(rawValue: indexPath.section)
        
        cell.textLabel?.text = list[indexPath.row]
        
        switch section {
        case .firstSection:
            cell.backgroundColor = .systemCyan
            cell.selectionStyle = .none
        case .seconSection:
            cell.backgroundColor = .systemOrange
            cell.selectionStyle = .none
        case .thirdSection:
            cell.backgroundColor = .systemPink
            cell.selectionStyle = .none
        case .none:
            cell.backgroundColor = .black
            cell.selectionStyle = .none
        }
        
        return cell
    }
    
    
    
    // MARK: - Cell 높이 설정 메서드
    fileprivate func cellHeight(indexPath: IndexPath) -> CGFloat {
        let sectionEnum = SectionEnum(rawValue: indexPath.section)
        
        switch sectionEnum {
        case .firstSection:
            return 50
        case .seconSection:
            return 100
        case .thirdSection:
            return 150
        case .none:
            return 0
        }
    }
}
