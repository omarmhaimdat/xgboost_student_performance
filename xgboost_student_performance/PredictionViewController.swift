//
//  PredictionViewController.swift
//  xgboost_student_performance
//
//  Created by M'haimdat omar on 21-03-2020.
//  Copyright © 2020 M'haimdat omar. All rights reserved.
//

import Foundation

import UIKit

class PredictionViewController: UIViewController {
    
    var myInputData = inputData()
    var predictions = predictionData()
    
    var mathPrediction = 0.0
    var readingPrediction = 0.0
    var writingPrediction = 0.0
    
    
    let predictionStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = CGFloat(exactly: 20)!
        
        return stackView
    }()
    
    let math: MyStackViewElement = {
        let textView = MyStackViewElement()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .systemPurple
        return textView
    }()
    
    let reading: MyStackViewElement = {
        let textView = MyStackViewElement()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .systemYellow
        return textView
    }()
    
    let writing: MyStackViewElement = {
        let textView = MyStackViewElement()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .systemGreen
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTabBar()
        setupStackView()
        makePrediction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(predictions)
        
        DispatchQueue.main.async(execute: {
            self.math.text = "Math \n \(Int(self.predictions.math))"
            self.reading.text = "Reading \n \(Int(self.predictions.read))"
            self.writing.text = "Writing \n \(Int(self.predictions.write))"
        })
        
    }
    
    func makePrediction() {
        let writingModel = student_performance_writing()
        let readingModel = student_performance_reading()
        let mathModel = student_performance_math()
        let writingPrediction = try! writingModel.prediction(gender: myInputData.gender, race_ethnicity: myInputData.race, parental_level_of_education: myInputData.parentEducation, lunch: myInputData.lunch, test_preparation_course: myInputData.test)
        let readingPrediction = try! readingModel.prediction(gender: myInputData.gender, race_ethnicity: myInputData.race, parental_level_of_education: myInputData.parentEducation, lunch: myInputData.lunch, test_preparation_course: myInputData.test)
        let mathPrediction = try! mathModel.prediction(gender: myInputData.gender, race_ethnicity: myInputData.race, parental_level_of_education: myInputData.parentEducation, lunch: myInputData.lunch, test_preparation_course: myInputData.test)
        self.predictions.write = writingPrediction.target
        self.predictions.read = readingPrediction.target
        self.predictions.math = mathPrediction.target
    }
    
    func setupTabBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Prediction"
        if #available(iOS 13.0, *) {
            self.navigationController?.navigationBar.barTintColor = .systemBackground
             navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.label]
        } else {
            // Fallback on earlier versions
            self.navigationController?.navigationBar.barTintColor = .lightText
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.black]
        }
        self.navigationController?.navigationBar.isHidden = false
        self.setNeedsStatusBarAppearanceUpdate()
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.barStyle = .default
        if #available(iOS 13.0, *) {
            navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor : UIColor.label]
        } else {
            navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor : UIColor.black]
        }
        if #available(iOS 13.0, *) {
            navigationController?.navigationBar.backgroundColor = .systemBackground
        } else {
            // Fallback on earlier versions
            navigationController?.navigationBar.backgroundColor = .white
        }
        self.tabBarController?.tabBar.isHidden = false
        
    }
    
    fileprivate func setupStackView() {
        predictionStack.addArrangedSubview(reading)
        predictionStack.addArrangedSubview(math)
        predictionStack.addArrangedSubview(writing)
        
        view.addSubview(predictionStack)
        
        predictionStack.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 30).isActive = true
        predictionStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        predictionStack.widthAnchor.constraint(equalToConstant: view.frame.width - 50).isActive = true
        predictionStack.heightAnchor.constraint(equalToConstant: 280).isActive = true
        
    }
    
}
