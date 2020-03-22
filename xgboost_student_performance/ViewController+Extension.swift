//
//  ViewController+Extension.swift
//  xgboost_student_performance
//
//  Created by M'haimdat omar on 21-03-2020.
//  Copyright © 2020 M'haimdat omar. All rights reserved.
//

import UIKit

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == self.gender {
            return self.genderArray.count
        } else if pickerView == self.race {
            return self.raceArray.count
        } else if pickerView == self.parentEducation {
        return self.parentArray.count
        } else if pickerView == self.lunch {
        return self.lunchArray.count
        } else {
            return self.testArray.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == self.gender {
            return self.genderArray[row]
        } else if pickerView == self.race {
            return self.raceArray[row]
        } else if pickerView == self.parentEducation {
        return self.parentArray[row]
        } else if pickerView == self.lunch {
        return self.lunchArray[row]
        } else {
            return self.testArray[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == self.gender {
            genderTextField.text = genderArray[row]
            self.myInputData.gender = Double(row + 1)
        } else if pickerView == self.race {
            raceTextField.text = raceArray[row]
            self.myInputData.race = Double(row + 1)
        } else if pickerView == self.parentEducation {
            parentEducationTextField.text = self.parentArray[row]
            self.myInputData.parentEducation = Double(row + 1)
        } else if pickerView == self.lunch {
            lunchTextField.text = self.lunchArray[row]
            self.myInputData.lunch = Double(row + 1)
        } else {
            testTextField.text = self.testArray[row]
            self.myInputData.test = Double(row + 1)
        }
        print(myInputData)
        
    }
    
}
