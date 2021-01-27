//
//  ViewController.swift
//  AutoLayoutStudy
//
//  Created by Yeon on 2020/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cellIdentifier: String = "cell"
    let item = Item()
    var isDisplay: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.title.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? TableViewCell else {
            debugPrint("CellError")
            return UITableViewCell()
        }
        cell.titleLabel.text = item.title[indexPath.row]
        cell.descriptionLabel.text = item.description
        cell.accessoryType = .detailButton
        //        if isDisplay == false {
        //            cell.titleLabel.text = item.title[indexPath.row]
        //            cell.descriptionLabel.text = ""
        //            cell.descriptionLabel.isHidden = true
        //            cell.accessoryType = .detailButton
        //        } else {
        //            cell.titleLabel.text = item.title[indexPath.row]
        //            cell.descriptionLabel.text = item.description
        //            cell.descriptionLabel.isHidden = false
        //            cell.accessoryType = .detailButton
        //        }
        return cell
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? TableViewCell else {
            return
        }
        //        if isDisplay == false {
        //            isDisplay = true
        //        } else {
        //            isDisplay = false
        //        }
        
        if cell.descriptionLabel.text == "" {
            cell.descriptionLabel.text = item.description
        } else {
            cell.descriptionLabel.text = ""
        }
        //tableView.reloadRows(at: [indexPath], with: .left)
        //tableView.reloadData()
    }
    
}
