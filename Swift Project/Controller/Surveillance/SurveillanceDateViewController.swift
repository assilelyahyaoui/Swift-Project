//
//  SurveillanceDateViewController.swift
//  Swift Project
//
//  Created by Melvil on 11/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import CoreData

class SurveillanceDateViewController: UIViewController {
    @IBOutlet weak var myDatePicker: UIDatePicker!
    var nomSurveillanceSend : TypeSurveillance! // nom sent by segue
    var heureSurveillanceSend = Date() // heure sent by segue
    var dateChoisi = Date() // date getted now
    
    let segueShowNomSuivi = "showAllInfosSurveillanceSegue"
    override func viewDidLoad() {
        super.viewDidLoad()
        changerValueDateQuandDateChange(self) //au cas où l'utilisateur garde la date préséléctionnée
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == segueShowNomSuivi {
            let SurveillanceAjoutViewController = segue.destination as! SurveillanceAjoutViewController
            SurveillanceAjoutViewController.nomSurveillanceSend = self.nomSurveillanceSend
            SurveillanceAjoutViewController.heureSurveillanceSend = self.heureSurveillanceSend
            SurveillanceAjoutViewController.dateSurveillanceSend = self.dateChoisi
            
        }
        
    }
    
    @IBAction func changerValueDateQuandDateChange(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM"
        dateFormatter.locale = NSLocale(localeIdentifier: "fr_FR") as Locale!
        
        dateFormatter.timeZone = TimeZone.current
        
        let date = dateFormatter.string(from: myDatePicker.date)
        dateChoisi = dateFormatter.date(from : date)!
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
