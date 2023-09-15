//
//  CollectionViewListController.swift
//  settingTableView
//
//  Created by 염성필 on 2023/09/16.
//

import UIKit
import SnapKit


struct SettingText {
    let image: UIImage?
    let title: String
    let subtitle: String?
}

class CollectionViewListController : UIViewController {
    
    let listCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    let firstList : [SettingText] = [
        SettingText(image: UIImage(systemName: "moon.fill"),title: "방해 금지 모드", subtitle: "켬"),
        SettingText(image: UIImage(systemName: "bed.double.fill"),title: "수면", subtitle: nil),
        SettingText(image: UIImage(systemName: "person"),title: "업무 /n 09:00 ~ 18:00", subtitle: nil),
        SettingText(image: UIImage(systemName: "doc.fill"),title: "개인시간", subtitle: "설정")
    
    ]
    
    let secondList: [SettingText] = [
        SettingText(image: nil, title: "모든 기기에서 공유", subtitle: nil)
    ]
    
    // UICollectionViewListCell : accessories를 사용하려면 listCell 이어야 한다?
    var CellRegisteration: UICollectionView.CellRegistration<UICollectionViewListCell, SettingText>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(listCollectionView)
        listCollectionView.delegate = self
        listCollectionView.dataSource = self
        listCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        CellRegisteration = UICollectionView.CellRegistration(handler: { cell, indexPath, itemIdentifier in
            
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.title
            content.secondaryText = itemIdentifier.subtitle
            content.image = itemIdentifier.image
            cell.contentConfiguration = content
            cell.accessories = [UICellAccessory.disclosureIndicator()]
        })
        
        
        
    }
    
    static func layout() -> UICollectionViewLayout {
        let configure = UICollectionLayoutListConfiguration(appearance: .grouped)
        let layout = UICollectionViewCompositionalLayout.list(using: configure)
        return layout
    }
    
    
}
extension  CollectionViewListController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            return firstList.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = firstList[indexPath.item]
        let cell = collectionView.dequeueConfiguredReusableCell(using: CellRegisteration, for: indexPath, item: data)
        return cell
    }
}