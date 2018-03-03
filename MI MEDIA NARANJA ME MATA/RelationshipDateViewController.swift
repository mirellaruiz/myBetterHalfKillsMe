//
//  RelationshipDateViewController.swift
//  MI MEDIA NARANJA ME MATA
//
//  Created by Mirella on 23/10/17.
//  Copyright © 2017 Mirella. All rights reserved.
//

import UIKit

class RelationshipDateViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    var birthDate: Date?
    
    @IBAction func swipeFuncBack(_ sender: UISwipeGestureRecognizer) {
        dismiss(animated: true)
    }
    
    @IBAction func swipeFunc(_ sender: UISwipeGestureRecognizer) {
        if shouldPerformSegue(withIdentifier: "end", sender: self){
            performSegue(withIdentifier: "end", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if let dateDefault = defaults.object(forKey: "love") as? Date{
            datePicker.date = dateDefault
        }
        let swipeRec1 = UISwipeGestureRecognizer(target: self, action: #selector(swipeFuncBack(_:)))
        swipeRec1.direction = UISwipeGestureRecognizerDirection.down
        view.addGestureRecognizer(swipeRec1)
        let swipeRec = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunc(_:))) //cual es el objeto y que va a ejecutar
        swipeRec.direction = UISwipeGestureRecognizerDirection.up
        view.addGestureRecognizer(swipeRec)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let defaults = UserDefaults.standard
        defaults.set(datePicker.date, forKey: "love")
        defaults.synchronize()
    }
    
    
    @IBAction func comeBack(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if identifier == "end"{
            if(birthDate != nil){
                if (birthDate! > datePicker.date){
                    let alert = UIAlertController(title: "ERROR", message: "NO PUEDES ENAMORARTE ANTES DE NACER", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: {(aa: UIAlertAction) in print("Repetir fechas")}))
                    present(alert, animated:true)
                    return false
                }
            }
        }
        return true
    }

}
