//
//  ViewController.swift
//  Adding to Beasts
//
//  Created by Noel Mendoza on 1/16/18.
//  Copyright © 2018 Noel Mendoza. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var wordArray:[String] = []
    
    @IBOutlet var myTableView: UITableView!
    @IBOutlet var myTextField: UITextField!
        
    // Button pressed
    
    @IBAction func beastButtonPressed(_ sender: UIButton) {
        if myTextField.text == nil {
            return
        }
        
        if let newWord = myTextField.text {
            
            wordArray.append(newWord)
            myTableView.reloadData()
        }
        else {
            return
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    // Protocol and Delegate Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = wordArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        wordArray.remove(at: indexPath.row)
        myTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


