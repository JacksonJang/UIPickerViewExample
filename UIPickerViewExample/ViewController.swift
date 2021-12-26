//
//  ViewController.swift
//  UIPickerViewExample
//
//  Created by 장효원 on 2021/12/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var data:[String] = [
        "CustomPickerView",
        "CustomDatePickerView"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerDelegate()
        setupUI()
    }
    
    func registerDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupUI() {
        tableView.rowHeight = 43.5
    }
    
    func createExampleDatas() {
        var i = 1
        while i < 21 {
            data.append("test\(i)")
            i += 1
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! MainTableViewCell
        
        cell.titleLabel.text = self.data[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("move to \(data[indexPath.row])")
        
        let index = indexPath.row
        let viewName = data[index]
        var vc:UIViewController? = nil
        
        if index == 0 {
            vc = CustomPickerView.init(nibName: viewName, bundle: nil)
        } else if index == 1 {
            vc = CustomDatePickerView.init(nibName: viewName, bundle: nil)
        }
        
        guard let vc = vc else { return }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
