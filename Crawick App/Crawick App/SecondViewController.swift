//
//  SecondViewController.swift
//  Crawick App
//
//  Created by Steven Gibson on 24/03/2018.
//  Copyright © 2018 Steven Gibson. All rights reserved.
//

import UIKit
import MessageUI

class SecondViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,MFMailComposeViewControllerDelegate,UITextViewDelegate {

    

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
    var GSize = "Question Not answered"
    var AgeYoung = "Question Not answered"
    var AgeOld = "Question Not answered"
    var Travel = "Question Not answered"
    var FoundUs = "Question Not answered"
    var Download = "Question Not answered"
    var ImproveVisit = "Question Not answered"
    var Experince = "Question Not answered"
    var Feels = "Question Not answered"
    //array for storing questions
    var SurveyQuestions:[String]?
    //Array for pickerview
    let AgeRange = ["Please Select","Under 5","5 - 11", "12 - 17","18 - 24","25 - 34","35 - 44", "45 - 54" ,"55+"]
    
    let GroupSize = ["Please Select","1","2","3 - 4", "5 - 9", "10+"]
    
    let Distance = ["Please Select","We're Local", "10 - 20 miles","30 - 60 miles","60 + miles"]
    
    let YesNo = ["Please Select","Yes","No"]
    
    let FindOut = ["Please Select","Local Knowlegde","Another tourist attraction","Website", "Social Media","Internet Search", "Other (please specify)"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ExplreText.delegate = self
        ExpText.delegate = self
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

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
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
        let mailComposeViewController = configureMailController()
        if MFMailComposeViewController.canSendMail()
        {
            self.present(mailComposeViewController,animated: true,completion: nil)
        }
        else{
            showMailError()
        }
        //sendSurvey()
    }
    
    func donePick(){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        VisitDate = dateFormatter.string(from: DatePicker.date)
        self.view.endEditing(true)
        
    }
    func configureMailController() -> MFMailComposeViewController {
        
            let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = self
           //change email
            mail.setToRecipients(["info@crawickmultiverse.co.uk"])
            mail.setSubject("Crawick Multiverse Survey")
            //message body
            mail.setMessageBody("<p>What was the date of your Visit? </p>" +
                                "<p>" + VisitDate + "</p>" +
                                "<p>How many people were in your group? </p>" +
                                "<p>" + GSize + "</p>" +
                                "<p>How old was the youngest person in your group? </p>" +
                                "<p>" + AgeYoung + "</p>" +
                                "<p>How old was the oldest person in your group? </p>" +
                                "<p>" + AgeOld + "</p>" +
                                "<p>How far did you travel to get here? </p>" +
                                "<p>" + Travel + "</p>" +
                                "<p>What was your experience of Crawick Multiverse? </p>" +
                                "<p>" + Experince + "</p>" +
                                "<p>How did you feel while exploring Crawick Multiverse? </p>" +
                                "<p>" + Feels + "</p>" +
                                "<p>How did you find out out about Crawick Multiverse? </p>" +
                                "<p>" + FoundUs + "</p>" +
                                "<p>Did you Download this App before Visiting? </p>" +
                                "<p>" + Download + "</p>" +
                                "<p>Did this app help improve your experience of Crawick Multiverse? </p>" +
                                "<p>" + ImproveVisit + "</p>" , isHTML: true)
        
        return mail
        
    }
    func showMailError(){
        let sendMailErrorAlert = UIAlertController(title:"Could not send email", message: " Sorryyour email could not be sent", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "OK", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
        
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    }


