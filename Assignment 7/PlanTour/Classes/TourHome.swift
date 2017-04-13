//
//  TourHome.swift
//  PlanTour
//
//  Created by Bakytzhan Apetov on 2017-03-22.
//  Copyright © 2017 School of ICT, Seneca College. All rights reserved.
//

import UIKit

class TourHome: UIViewController, WebServiceRequestDelegate {

    var model: Model!
    var tourDetails: Dictionary<String, Any> = [:]
    @IBOutlet weak var personName: UITextField!
    @IBOutlet weak var numberOfPeople: UISegmentedControl!
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var buyOutlet: UIButton!
    @IBOutlet weak var text: UITextView!
    
    
    @IBAction func clear(_ sender: UIButton) {
        personName.text = ""
        numberOfPeople.selectedSegmentIndex = 0
        let now = Date()
        date.date = now
        
        personName.isEnabled = true
        numberOfPeople.isEnabled = true
        date.isEnabled = true
        buyOutlet.isEnabled = true
        
        personName.resignFirstResponder()
    }
    
    @IBAction func buyAction(_ sender: UIButton) {
        if personName.text != nil {
            personName.resignFirstResponder()
            personName.isEnabled = false
            numberOfPeople.isEnabled = false
            date.isEnabled = false
            buyOutlet.isEnabled = false
            let isoDateString = ISO8601DateFormatter()
            isoDateString.timeZone = TimeZone.current
            
            var userData: Dictionary<String, Any> = [
                "CustomerName" : "",
                "NumberOfCustomers" : "",
                "TourDate" : ""
            ]
            userData["CustomerName"] = personName.text
            userData["NumberOfCustomers"] = numberOfPeople.selectedSegmentIndex + 1
            userData["TourDate"] = isoDateString.string(from: date.date)
            model.getTourData(userData: userData)
            //setTextView()
        } else {
            return
        }
    }
    
    func webServiceRequestDidChangeContent(model: Model) {
    
        print("hello")

        //let msg: String = tourDetails["Message"] as! String
        let msg: String = model.tour["Message"] as! String
        let msgArray = msg.components(separatedBy: ";")
        let customer = msgArray[0]
        let guide = msgArray[1]
        let custNo = model.tour["NumberOfCustomers"]
        let rsrvCode = model.tour["ReservationCode"]
        text.text = "Toronto Tour\nReservation Details:\n\(customer)\n\(guide)\n\(custNo) tickets\nTour Date:\n\nReservation code:\n\(rsrvCode)"

    }
    
    func setTextView() {
        
        let msg: String = tourDetails["Message"] as! String
        let msgArray = msg.components(separatedBy: ";")
        let customer = msgArray[0]
        let guide = msgArray[1]
        let custNo = tourDetails["NumberOfCustomers"]
        let rsrvCode = tourDetails["ReservationCode"]
        text.text = "Toronto Tour\nReservation Details:\n\(customer)\n\(guide)\n\(custNo) tickets\nTour Date:\n\nReservation code:\n\(rsrvCode)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let now = Date()
        date.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: now)
        date.maximumDate = Calendar.current.date(byAdding: .day, value: 14, to: now)
        
        model.delegate = self
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
