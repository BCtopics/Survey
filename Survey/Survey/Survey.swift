//
//  Survey.swift
//  Survey
//
//  Created by Bradley GIlmore on 4/13/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import Foundation

class Survey {
    
    //MARK: - Internal Properties
    
    let name: String
    let language: String
    let identifier: UUID
    
    //MARK: - Initializers
    
    init(name: String, language: String, identifier: UUID = UUID()) {
        self.name = name
        self.language = language
        self.identifier = identifier
    }
    
}

//MARK: - JSON

extension Survey {
    
    private static var kName: String { return "name" }
    private static var kLanguage: String { return "language" }
    
    convenience init?(dictionary: [String: Any], identifier: String){
        guard let name = dictionary[Survey.kName] as? String,
            let language = dictionary[Survey.kLanguage] as? String,
            let identifier = UUID(uuidString: identifier) else { return nil }
        
        self.init(name: name, language: language, identifier: identifier)
    }
    
    var jsonDictionary: [String: Any] {
        let jsonDictionary: [String: Any] = [Survey.kName: name, Survey.kLanguage: language]
        return jsonDictionary
     }
    
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: jsonDictionary, options: .prettyPrinted)
    }
    
}
