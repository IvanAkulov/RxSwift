//
//  TablViewControllerEditPartialUpdate.swift
//  RxExample
//
//  Created by Alexandr Glushchenko on 06.05.16.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

import Foundation
import UIKit
#if !RX_NO_MODULE
    import RxSwift
    import RxCocoa
#endif

class TableViewControllerEditPartialUpdate : ViewController {
    @IBOutlet weak var tableView: UITableView!
    var sections = Variable([NumberSection]())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let items = [
            NumberSection(model: "Section 1", items: [1, 3, 5]),
            NumberSection(model: "Section 2", items: [2, 4, 6, 8]),
            NumberSection(model: "Section 3", items: [7, 11, 10])
        ]
        self.sections.value = items
        let editableDataSource = RxTableViewSectionedAnimatedDataSource<NumberSection>()
        
        configDataSource(editableDataSource)
        self.sections.asObservable()
            .bindTo(tableView.rx_itemsAnimatedWithDataSource(editableDataSource))
            .addDisposableTo(disposeBag)
        
        tableView.rx_itemDeleted.subscribeNext{[weak self] item in
            if let controller = self {
                controller.sections.value[item.section].items.removeAtIndex(item.row)
            }
            }.addDisposableTo(disposeBag)
        
        tableView
            .rx_modelSelected(IdentifiableValue<Int>)
            .subscribeNext { i in
                DefaultWireframe.presentAlert("Tapped `\(i)`")
            }
            .addDisposableTo(disposeBag)
        
        tableView
            .rx_itemSelected
            .subscribeNext { [weak self]  i in
                if let controller = self {
                    print("Tapped `\(i)` - \(controller.sections.value[i.section].items[i.row].dynamicType)")
                }
            }
            .addDisposableTo(disposeBag)
    }
    
    func configDataSource(dataSource: RxTableViewSectionedDataSource<NumberSection>) {
        dataSource.configureCell = { (_, tv, ip, i) in
            let cell = tv.dequeueReusableCellWithIdentifier("Cell")
                ?? UITableViewCell(style:.Default, reuseIdentifier: "Cell")
            cell.textLabel!.text = "\(i)"
            return cell
        }
        
        dataSource.titleForHeaderInSection = { (ds, section: Int) -> String in
            return dataSource.sectionAtIndex(section).model
        }
        
        dataSource.canEditRowAtIndexPath = { (ds, ip) in
            return true
        }
    }
}
