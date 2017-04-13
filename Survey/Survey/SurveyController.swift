//
//  SurveyController.swift
//  Survey
//
//  Created by Bradley GIlmore on 4/13/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import Foundation

class SurveyController {
    
    //MARK: - baseURL
    
    static let baseURL = URL(string: "https://survey-ios12-31e7b.firebaseio.com/survey")
    
    //MARK: - Fetch Method
    
    static func fetchResponses(completion: @escaping (_ responses: [Survey]) -> Void) {
        var surveys: [Survey] = []
        defer { completion(surveys) }
        
        guard let url = baseURL?.appendingPathExtension("json") else {
            fatalError("URL is nil") }
        
        NetworkController.performRequest(for: url, httpMethod: .get) { (data, error) in
            guard let data = data else { return }
            let responseDataString = String(data: data, encoding: .utf8) ?? ""
            
            guard error == nil else { print("Error: \(String(describing: error?.localizedDescription))"); return }
            guard !responseDataString.contains("error") else { print("Error: \(responseDataString)"); return }
           
            guard let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: [String: Any]] else { return }
            surveys = jsonDictionary.flatMap { Survey(dictionary: $0.value, identifier: $0.key) }
        }
        
        
    }
    
    
    //MARK: - Post Method
    
}
