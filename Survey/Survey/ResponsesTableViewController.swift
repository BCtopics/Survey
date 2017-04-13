//
//  ResponsesTableViewController.swift
//  Survey
//
//  Created by Bradley GIlmore on 4/13/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class ResponsesTableViewController: UITableViewController {
    
    var surveys = [Survey](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SurveyController.fetchResponses { (surveys) in
            self.surveys = surveys
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return surveys.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "surveyCell", for: indexPath)

        let survey = surveys[indexPath.row]
        cell.textLabel?.text = survey.language
        cell.detailTextLabel?.text = survey.name

        return cell
    }
}
