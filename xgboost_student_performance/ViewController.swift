//
//  ViewController.swift
//  xgboost_student_performance
//
//  Created by M'haimdat omar on 21-03-2020.
//  Copyright © 2020 M'haimdat omar. All rights reserved.
//

import UIKit
import CoreML

struct inputData {
    var gender: Double
    var race: Double
    var parentEducation: Double
    var lunch: Double
    var test: Double
    
    init() {
        self.gender = 1
        self.race = 1
        self.parentEducation = 1
        self.lunch = 1
        self.test = 1
    }
}

struct predictionData {
    var math: Double
    var read: Double
    var write: Double
    
    init() {
        self.math = 0.0
        self.read = 0.0
        self.write = 0.0
    }
}

class ViewController: UIViewController {
    
    var myInputData = inputData()
    
    let genderArray = ["Male", "Female"]
    let raceArray = ["group A", "group B", "group C", "group D", "group E"]
    let parentArray = ["associate's degree", "bachelor's degree", "high school", "master's degree", "some college", "some high school"]
    let lunchArray = ["free/reduced", "standard"]
    let testArray = ["completed", "none"]
    
    
    let genderTextField: UITextField = {
       let text = UITextField()
        text.text = "Gender"
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = UIColor.black
        text.font = UIFont(name: "Avenir-Medium", size: 20)
        text.textColor = UIColor.green
    
        return text
    }()
    
    let gender: UIPickerView = {
       let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let raceTextField: UITextField = {
       let text = UITextField()
        text.text = "Race"
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = UIColor.black
        text.font = UIFont(name: "Avenir-Medium", size: 20)
        text.textColor = UIColor.green
    
        return text
    }()
    
    let race: UIPickerView = {
       let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let parentEducationTextField: UITextField = {
       let text = UITextField()
        text.text = "Parent education"
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = UIColor.black
        text.font = UIFont(name: "Avenir-Medium", size: 20)
        text.textColor = UIColor.green
    
        return text
    }()
    
    let parentEducation: UIPickerView = {
       let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let lunchTextField: UITextField = {
       let text = UITextField()
        text.text = "Lunch"
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = UIColor.black
        text.font = UIFont(name: "Avenir-Medium", size: 20)
        text.textColor = UIColor.green
    
        return text
    }()
    
    let lunch: UIPickerView = {
       let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let testTextField: UITextField = {
       let text = UITextField()
        text.text = "Test preparation"
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = UIColor.black
        text.font = UIFont(name: "Avenir-Medium", size: 20)
        text.textColor = UIColor.green
    
        return text
    }()
    
    let test: UIPickerView = {
       let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    
    let confirmBtn: BtnVideLarge = {
        let button = BtnVideLarge()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonToPredict(_:)), for: .touchUpInside)
        button.setTitle("Predict", for: .normal)
        button.setTitleColor(UIColor.green, for: .normal)
        button.backgroundColor = .systemBackground
        button.layer.borderColor = UIColor.green.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowColor = UIColor.green.cgColor
        button.layer.shadowOffset = CGSize(width: 1, height: 5)
        button.layer.cornerRadius = 30
        button.layer.shadowRadius = 8
        button.layer.masksToBounds = true
        button.clipsToBounds = false
        button.contentHorizontalAlignment = .center
        button.layoutIfNeeded()
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        button.titleEdgeInsets.left = 0
        
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        gender.delegate = self
        race.delegate = self
        parentEducation.delegate = self
        lunch.delegate = self
        test.delegate = self
        
        setupLayout()
    }
    
    func setupLayout() {
        
        self.view.addSubview(genderTextField)
        self.view.addSubview(raceTextField)
        self.view.addSubview(parentEducationTextField)
        self.view.addSubview(lunchTextField)
        self.view.addSubview(testTextField)
        self.view.addSubview(confirmBtn)
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.barStyle = .black
        toolbar.tintColor = .white
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ViewController.dismissKeyboard))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([flexibleSpace, doneButton], animated: true)
        toolbar.isUserInteractionEnabled = true
        
        genderTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        genderTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        genderTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 30).isActive = true
        genderTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        genderTextField.inputView = gender
        genderTextField.inputAccessoryView = toolbar
        genderTextField.borderStyle = .roundedRect
        
        raceTextField.topAnchor.constraint(equalTo: self.genderTextField.bottomAnchor, constant: 30).isActive = true
        raceTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        raceTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 30).isActive = true
        raceTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        raceTextField.inputView = race
        raceTextField.inputAccessoryView = toolbar
        raceTextField.borderStyle = .roundedRect
        
        
        parentEducationTextField.topAnchor.constraint(equalTo: self.raceTextField.bottomAnchor, constant: 30).isActive = true
        parentEducationTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        parentEducationTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 30).isActive = true
        parentEducationTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        parentEducationTextField.inputView = parentEducation
        parentEducationTextField.inputAccessoryView = toolbar
        parentEducationTextField.borderStyle = .roundedRect
        
        lunchTextField.topAnchor.constraint(equalTo: self.parentEducationTextField.bottomAnchor, constant: 30).isActive = true
        lunchTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        lunchTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 30).isActive = true
        lunchTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        lunchTextField.inputView = lunch
        lunchTextField.inputAccessoryView = toolbar
        lunchTextField.borderStyle = .roundedRect
        
        testTextField.topAnchor.constraint(equalTo: self.lunchTextField.bottomAnchor, constant: 30).isActive = true
        testTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        testTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 30).isActive = true
        testTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        testTextField.inputView = test
        testTextField.inputAccessoryView = toolbar
        testTextField.borderStyle = .roundedRect
        
        
        confirmBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmBtn.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        confirmBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        confirmBtn.topAnchor.constraint(equalTo: testTextField.bottomAnchor, constant: 50).isActive = true
        
        
    }
    
    @objc func buttonToPredict(_ sender: BtnPleinLarge) {
        let controller = PredictionViewController()
        controller.myInputData = self.myInputData
        let navController = UINavigationController(rootViewController: controller)
        controller.modalPresentationStyle = .custom
        self.present(navController, animated: true, completion: nil)
    }
    
    
}
