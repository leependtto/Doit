//
//  CreatTaskViewController.swift
//  Doit
//
//  Created by Lee Pendexter on 3/17/17.
//  Copyright © 2017 appdog. All rights reserved.
//

import UIKit

class CreatTaskViewController: UIViewController {

    @IBOutlet weak var importantSwitch: UISwitch!

    @IBOutlet weak var taskNameTextField: UITextField!
    
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func addTapped(_ sender: Any) {
        
       let Task = task()
       
        Task.name = taskNameTextField.text!
        
        Task.important = importantSwitch.isOn
        
        previousVC.tasks.append(Task)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }




}
