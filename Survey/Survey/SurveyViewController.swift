//
//  SurveyViewController.swift
//  Survey
//
//  Created by Bradley GIlmore on 4/13/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var languageTextField: UITextField!

    
    @IBAction func submitButtonTapped(_ sender: Any) {
        
        guard let name = nameTextField.text,
            let language = languageTextField.text,
            !name.isEmpty, !language.isEmpty else { return }
        
        SurveyController.putSurvey(name: name, language: language)
        
        nameTextField.text = ""
        languageTextField.text = ""
    }
    

}
