//
//  ProfileViewController.swift
//  Experiment
//
//  Created by Melanie Gravier on 12/3/17.
//  Copyright © 2017 Melanie Gravier. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    /*
    @IBAction func userMedInput(_ sender: UITextField) {
        medLabel.text = sender.text! + "Reminder"
    }
    @IBOutlet var medLabel: UILabel!
    */
    
    
    
    @IBOutlet var medicineReminder: UILabel!
    
    @IBOutlet var datePicker: UIDatePicker!
    
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
