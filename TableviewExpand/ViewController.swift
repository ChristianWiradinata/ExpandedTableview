//
//  ViewController.swift
//  TableviewExpand
//
//  Created by Christian Wiradinata on 28/03/22.
//

import UIKit

class Model {
    let title: String
    let footer: String
    var status: Bool = false
    var isExpand: Bool = false
    
    init(title: String,
         footer: String,
         status: Bool = false,
         isExpand: Bool = false
    ) {
        self.title = title
        self.footer = footer
        self.status = status
        self.isExpand = isExpand
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tv: UITableView!
    
    private var dataModel = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataModel = [
            Model(title: "Cell 1", footer: "Footer 1"),
            Model(title: "Cell 2", footer: "Footer 2")
        ]
        
        tv.register(UINib(nibName: "ExpandedCell", bundle: nil), forCellReuseIdentifier: "ExpandedCell")
//        tv.rowHeight = view.frame.height/6
        tv.delegate = self
        tv.dataSource = self
        tv.frame = view.bounds
    }
    
    
    @IBAction func statusClick(_ sender: Any) {
        print("=========")
        for model in dataModel {
            print("==> Title: \(model.title), Status: \(model.status)")
        }
        print("=========")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            dataModel[indexPath.section].isExpand = !dataModel[indexPath.section].isExpand
            
            UIView.animate(withDuration: 0.05, animations: {
                tableView.reloadSections([indexPath.section], with: .none)
            }, completion: { done in
                
            })
        } else {
//            print(indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
//            cell.heightAnchor.constraint(equalToConstant: ).isActive = true
//            cell.screen.frame = CGRect(x: 0, y: 0, width: view.frame.width - 10, height: 50)
            cell.screen.translatesAutoresizingMaskIntoConstraints = false
            cell.screen.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
            cell.title.text = dataModel[indexPath.section].title
            cell.contentView.layoutIfNeeded()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandedCell", for: indexPath) as! ExpandedCell
            
            
            cell.indexPath = indexPath
            cell.delegate = self
            cell.title.text = dataModel[indexPath.section].footer
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let model = dataModel[section]
        
        if model.isExpand {
            return 2
        } else {
            return 1
        }
    }
}

extension ViewController:ExpandedCellDelegate{
    func buttonClicked(indexPath: IndexPath, isChecked: Bool) {
        dataModel[indexPath.section].status = isChecked
    }
}
