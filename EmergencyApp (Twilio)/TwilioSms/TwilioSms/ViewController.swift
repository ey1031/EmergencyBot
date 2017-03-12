//
//  ViewController.swift
//  TwilioSms
//
//  Created by Emily on 2/8/17.
//  Copyright © 2017 Emily. All rights reserved.

//sending for multiple works - make custom messages?

import UIKit
import Alamofire

var emergencyContacts: [Int] = [6505754922, 6505754922]

class ViewController: UIViewController {
    
    @IBOutlet var phoneNumberField: UITextField!
    @IBOutlet var messageField: UITextField!
    
    @IBAction func sendData(sender: AnyObject) {
        for i in emergencyContacts {
            sendMessage(contact: i);
            
        }
    }
    
    func sendMessage(contact:Int){
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        let parameters: Parameters = [
            "To": String(contact), //loop this through emergencyContacts
            "Body": messageField.text ?? ""
        ]
        
        Alamofire.request("http://emergency-app-twilio.herokuapp.com/sms", method: .post, parameters: parameters, headers: headers).response { response in
            print(response)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}