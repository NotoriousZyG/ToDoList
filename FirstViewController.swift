//
//  FirstViewController.swift
//  To Do
//
//  Created by Roman Parajuli on 7/6/15.
//  Copyright (c) 2015 Roman Parajuli. All rights reserved.
//

import UIKit

var todoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if NSUserDefaults.standardUserDefaults().objectForKey("todoList") != nil {
            
    
       todoList = NSUserDefaults.standardUserDefaults().objectForKey("todoList") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return todoList.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.textLabel?.text = todoList[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        // this function is called whenever user tries to  edit an iten in the table i.e swipe to the left
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            todoList.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(todoList, forKey: "todoList")
            table.reloadData()
            
        }
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        table.reloadData()
        
    }
}

