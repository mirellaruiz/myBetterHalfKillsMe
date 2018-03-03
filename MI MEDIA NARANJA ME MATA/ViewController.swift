//
//  ViewController.swift
//  MI MEDIA NARANJA ME MATA
//
//  Created by Mirella on 23/10/17.
//  Copyright © 2017 Mirella. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var date: UIDatePicker!
    
    @IBAction func swipeFunc(_ sender: UISwipeGestureRecognizer) {
        performSegue(withIdentifier: "continue", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if let dateDefault = defaults.object(forKey: "birth") as? Date{
            date.date = dateDefault
        }
        let swipeRec = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunc(_:))) //cual es el objeto y que va a ejecutar
        swipeRec.direction = UISwipeGestureRecognizerDirection.up
        view.addGestureRecognizer(swipeRec)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let defaults = UserDefaults.standard
        defaults.set(date.date, forKey: "birth")
        defaults.synchronize()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "continue" {
            if let sdvc = segue.destination as? RelationshipDateViewController {
              sdvc.birthDate = date.date
                    
                }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

