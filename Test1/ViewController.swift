//
//  ViewController.swift
//  Test1
//
//  Created by The App Experts on 04/09/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    var array1 = ["0", "1", "2", "3","4", "5", "6", "7"]
    var array2 = ["a", "b", "c", "d","e", "f", "g", "h"]
    override func viewDidLoad() {
        super.viewDidLoad()
          self.tableView1.dataSource = self
          self.tableView2.dataSource = self
        self.tableView1.delegate = self
        self.tableView2.delegate = self
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView1.register(nib, forCellReuseIdentifier: "TableViewCell")
        self.tableView2.register(nib, forCellReuseIdentifier: "TableViewCell")
    }
}

extension ViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView1: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Section \(section)"
  }
  
  func tableView(_ tableView1: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.array1.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    
    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    
    if tableView ===  self.tableView1 {
        cell.textLabel?.text = self.array1[indexPath.row]
        cell.backgroundColor = .yellow
    }
    
    if tableView ===  self.tableView2 {
        cell.textLabel?.text = self.array2[indexPath.row]
        cell.backgroundColor = .green
    }
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
    if tableView ===  self.tableView1 {
        detailViewController.content = self.array1[indexPath.row]
        detailViewController.tableView = self.tableView1
    }
    if tableView ===  self.tableView2{
        detailViewController.content = self.array2[indexPath.row]
        detailViewController.tableView = self.tableView2
    }
    detailViewController.delegate = self
    self.navigationController?.pushViewController(detailViewController, animated: true)
  }
}

extension ViewController: DetailViewControllerDelegate {
    
  func updateContent(with content: String, _ tableView: UITableView) {
    
    if self.tableView1 === tableView{
        guard let updateIndex = self.tableView1.indexPathForSelectedRow?.row else { return }
        self.array1[updateIndex] = content
        self.tableView1.reloadData()
    }
    if self.tableView2 === tableView{
        guard let updateIndex = self.tableView2.indexPathForSelectedRow?.row else { return }
        self.array2[updateIndex] = content
        self.tableView2.reloadData()
    }
  }
}
