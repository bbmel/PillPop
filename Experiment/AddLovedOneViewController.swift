//
//  AddLovedOneViewController.swift
//  Experiment
//
//  Created by Melanie Gravier on 12/3/17.
//  Copyright © 2017 Melanie Gravier. All rights reserved.
//

import UIKit

class AddLovedOneViewController: UIViewController, UITextFieldDelegate {

    @IBAction func addLovedOne(_ sender: Any) {
        let itemsObject = UserDefaults.standard.object(forKey:"items")
        var items:[String]
        if let tempItems = itemsObject as? [String] {
            items = tempItems
            items.append(lovedOneName.text!)
        } else {
            items = [lovedOneName.text!]
        }
        UserDefaults.standard.set(items, forKey:"items")
        lovedOneName.text = ""
        lovedOnePhone.text = ""
    }
    
    @IBOutlet var lovedOnePhone: UITextField!
    @IBOutlet var lovedOneName: UITextField!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
