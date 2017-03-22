//
//  CompleteTaskViewController.swift
//  Doit
//
//  Created by Lee Pendexter on 3/21/17.
//  Copyright © 2017 appdog. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
   
    @IBOutlet weak var taskLabel: UILabel!
    var Task = task()
    var previousVC = TasksViewController()
    override func viewDidLoad() {
        super.viewDidLoad()

        if Task.important {
            taskLabel.text = "❗️\(Task.name)"
            
        } else {
            
            
            taskLabel.text = Task.name
        }

    }

    @IBAction func completeTapped(_ sender: Any) {
        previousVC.tasks .remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
   
}
