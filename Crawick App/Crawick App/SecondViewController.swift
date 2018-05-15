//
//  SecondViewController.swift
//  Crawick App
//
//  Created by Steven Gibson on 24/03/2018.
//  Copyright © 2018 Steven Gibson. All rights reserved.
//

import UIKit
import MessageUI

class SecondViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    

    @IBOutlet var DatePicker: UIDatePicker!
    @IBOutlet var GroupPicker: UIPickerView!
    @IBOutlet var YougestPicker: UIPickerView!
    @IBOutlet var OldestPicker: UIPickerView!
    @IBOutlet var TravelPicker: UIPickerView!
    @IBOutlet var FindOutPicker: UIPickerView!
    @IBOutlet var DownloadPicker: UIPickerView!
    @IBOutlet var ImprovePicker: UIPickerView!
    
    

    @IBOutlet var ExpText: UITextView!
    @IBOutlet var ExplreText: UITextView!
    
    // strings for storing answers
    var VisitDate = ""
    var GSize = ""
    var AgeYoung = ""
    var AgeOld = ""
    var Travel = ""
    var FoundUs = ""
    var Download = ""
    var ImproveVisit = ""
    var Experince = ""
    var Feels = ""
    //array for storing questions
    var SurveyQuestions:[String]?
    //Array for pickerview
    let AgeRange = ["Under 5","5 - 11", "12 - 17","18 - 24","25 - 34","35 - 44", "45 - 54" ,"55+"]
    
    let GroupSize = ["1","2","3 - 4", "5 - 9", "10+"]
    
    let Distance = ["We're Local", "10 - 20 miles","30 - 60 miles","60 + miles"]
    
    let YesNo = ["Yes","No"]
    
    let FindOut = ["Local Knowlegde","Another tourist attraction","Website", "Social Media","Internet Search", "Other (please specify)"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GroupPicker.delegate = self
        GroupPicker.dataSource = self
        YougestPicker.delegate = self
        YougestPicker.dataSource = self
        OldestPicker.delegate = self
        OldestPicker.dataSource = self
        TravelPicker.delegate = self
        TravelPicker.dataSource = self
        FindOutPicker.delegate = self
        FindOutPicker.dataSource = self
        DownloadPicker.delegate = self
        DownloadPicker.dataSource = self
        ImprovePicker.delegate = self
        ImprovePicker.dataSource = self
        // set up questions in an array
        
        if let path = Bundle.main.path(forResource: "Survey", ofType: "txt"){
            do{
                let data = try String(contentsOfFile: path,encoding: .utf8)
                SurveyQuestions = data.components(separatedBy: "££")
                
            }
            catch
            {
                print(error)
            }
        // Do any additional setup after loading the view, typically from a nib.
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == GroupPicker {
            return GroupSize.count
            
        }
        else if pickerView == YougestPicker{
            return AgeRange.count
        }
        else if pickerView == OldestPicker{
            return AgeRange.count
        }
        else if pickerView == TravelPicker{
            return Distance.count
        }
        else if pickerView == FindOutPicker{
            return FindOut.count
        }
        else if pickerView == DownloadPicker{
            return YesNo.count
        }
        else if pickerView == ImprovePicker{
            return YesNo.count
        }
        else
        {
            return 1
        }
    }

    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == GroupPicker {
            return GroupSize[row]
            
        }
        else if pickerView == YougestPicker{
            return AgeRange[row]
        }
        else if pickerView == OldestPicker{
            return AgeRange[row]
        }
        else if pickerView == TravelPicker{
            return Distance[row]
        }
        else if pickerView == FindOutPicker{
            return FindOut[row]
        }
        else if pickerView == DownloadPicker{
            return YesNo[row]
        }
        else if pickerView == ImprovePicker{
            return YesNo[row]
        }
        else
        {
            return " "
        }
    }
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == GroupPicker {
            print(GroupSize[row])
            GSize = GroupSize[row]
        }
        else if pickerView == YougestPicker{
            print(AgeRange[row])
            AgeYoung = AgeRange[row]
        }
        else if pickerView == OldestPicker{
            print(AgeRange[row])
            AgeOld = AgeRange[row]
        }
        else if pickerView == TravelPicker{
            print(Distance[row])
            Travel = Distance[row]
        }
        else if pickerView == FindOutPicker{
            print(FindOut[row])
            FoundUs = FindOut[row]
        }
        else if pickerView == DownloadPicker{
            print(YesNo[row])
            Download = YesNo[row]
        }
        else if pickerView == ImprovePicker{
            print( YesNo[row])
            ImproveVisit = YesNo[row]
        }
        
        
    }
    //submit the survey
    @IBAction func btnSumbit(_ sender: Any) {
        donePick()
        Experince = ExpText.text
        Feels = ExplreText.text
        sendSurvey()
    }
    
    func donePick(){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        VisitDate = dateFormatter.string(from: DatePicker.date)
        self.view.endEditing(true)
    }
    func sendSurvey() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self as? MFMailComposeViewControllerDelegate
           //change email
        mail.setToRecipients(["napier.group48@gmail.com"])
            mail.setSubject("Crawick Muultiverse Survey")
            //message body
            mail.setMessageBody("<p>" + SurveyQuestions![0] + "</p>" +
                                "<p>" + VisitDate + "</p>" +
                                "<p>" + SurveyQuestions![1] + "</p>" +
                                "<p>" + GSize + "</p>" +
                                "<p>" + SurveyQuestions![2] + "</p>" +
                                "<p>" + AgeYoung + "</p>" +
                                "<p>" + SurveyQuestions![3] + "</p>" +
                                "<p>" + AgeOld + "</p>" +
                                "<p>" + SurveyQuestions![4] + "</p>" +
                                "<p>" + Travel + "</p>" +
                                "<p>" + SurveyQuestions![5] + "</p>" +
                                "<p>" + Experince + "</p>" +
                                "<p>" + SurveyQuestions![6] + "</p>" +
                                "<p>" + Feels + "</p>" +
                                "<p>" + SurveyQuestions![7] + "</p>" +
                                "<p>" + FoundUs + "</p>" +
                                "<p>" + SurveyQuestions![8] + "</p>" +
                                "<p>" + Download + "</p>" +
                                "<p>" + SurveyQuestions![9] + "</p>" +
                                "<p>" + ImproveVisit + "</p>" , isHTML: true)
            
            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}


