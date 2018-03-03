//
//  DeathDateViewController.swift
//  MI MEDIA NARANJA ME MATA
//
//  Created by Mirella on 23/10/17.
//  Copyright © 2017 Mirella. All rights reserved.
//

import UIKit

class DeathDateViewController: UIViewController {
    
   
    
    @IBOutlet weak var dateLabel: UILabel!
    var date: Date?{
        didSet{        
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE, dd MMMM yyyy"
            let convertedDate = dateFormatter.string(from: date!);
            dateLabel.text = "\(convertedDate)"
        }
        }
    
   
    @IBAction func swipeFunc(_ sender: UISwipeGestureRecognizer) {
        performSegue(withIdentifier: "go", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeRec = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunc(_:))) //cual es el objeto y que va a ejecutar
        swipeRec.direction = UISwipeGestureRecognizerDirection.up
        view.addGestureRecognizer(swipeRec)
         dateLabel.text = "Pulsa COMENZAR"
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func end(_ segue: UIStoryboardSegue){
        if let sdvc = segue.source as? RelationshipDateViewController {
            let interval = sdvc.datePicker.date.timeIntervalSinceNow - sdvc.birthDate!.timeIntervalSinceNow
            date = Date(timeInterval: interval, since: sdvc.datePicker.date)
        }
    }

}
