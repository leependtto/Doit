//
//  TasksViewController.swift
//  Doit
//
//  Created by Lee Pendexter on 3/16/17.
//  Copyright © 2017 appdog. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [task] = []
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️\(task.name)"
            
        } else {
            
            
            cell.textLabel?.text = task.name
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    
    
    selectedIndex = indexPath.row
    
    let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskDSegue", sender: task)
        
    }
    
    
    
    
    
    
    func makeTasks() -> [task] {
        let task1 = task()
        task1.name = "Walk the dog"
        task1.important = false
        
        let task2 = task()
        task2.name = "buy cheese"
        task2.important = true
        
        let task3 = task()
        task3.name = "mow the lawn"
        task3.important = false
        
        return [task1, task2, task3]
        
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue" {
            let nextVC = segue.destination as! CreatTaskViewController
            nextVC.previousVC = self
        }
       if segue.identifier == "selectTaskDSegue" {
        let nextVC = segue.destination as! CompleteTaskViewController
        nextVC.Task = sender as! task
        nextVC.previousVC = self
        }
    }
}
