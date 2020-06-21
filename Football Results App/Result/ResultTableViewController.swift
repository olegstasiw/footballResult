//
//  ResultTableViewController.swift
//  Football Results App
//
//  Created by mac on 21.06.2020.
//  Copyright © 2020 Oleg Stasiw. All rights reserved.
//

import UIKit

class ResultTableViewController: UITableViewController {
    
    @IBOutlet weak var resultTable: UITableView!
    
    private let jsonUrl = "https://raw.githubusercontent.com/openfootball/football.json/master/2018-19/en.1.json"
    private var rounds: [Round] = []
    private var result: FootballResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        fetchData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rounds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ResultTableViewCell
        
        let round = rounds[indexPath.row]
        cell.configure(with: round)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let detailVC = segue.destination as! DetailTableViewController
        detailVC.round = rounds[indexPath.row]
        
    }
    
    func fetchData() {
        guard let url = URL(string: jsonUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error { print(error); return }
            if let response = response { print(response) }
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                self.result = try decoder.decode(FootballResult.self, from: data)
                self.rounds = self.result?.rounds as! [Round]
            } catch let error {
                print(error)
            }
            self.resultTable.reloadData()
            
        }.resume()
    }
    
}

