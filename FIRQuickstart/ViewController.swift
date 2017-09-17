//
//  ViewController.swift
//  FIRQuickstart
//
//  Created by admin on 2017. 9. 17..
//  Copyright © 2017년 admin. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    @IBOutlet weak var conditionLabel: UILabel!
    
    let conditionRef = Database.database().reference().child("condition")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sunnyDidTouch(_ sender: Any) {
        conditionRef.setValue("Sunny")
    }
    
    @IBAction func foggyDidTouch(_ sender: Any) {
        conditionRef.setValue("Foggy")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        conditionRef.observe(.value){ (snap:DataSnapshot) in
            self.conditionLabel.text = snap.value as? String
            
        }
    }

}

