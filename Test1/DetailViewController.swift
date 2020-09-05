//
//  DetailViewController.swift
//  Test1
//
//  Created by The App Experts on 04/09/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var tableView: UITableView?
    var content: String?
    var delegate: DetailViewControllerDelegate?
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func saveValue(_ sender: Any) {
        self.content = self.textField.text
        if let content = self.textField.text {
            self.delegate?.updateContent(with: content, tableView! )
        }
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.text = self.content

    }
}

protocol DetailViewControllerDelegate {
  func updateContent(with content: String, _ tableView: UITableView)
}
