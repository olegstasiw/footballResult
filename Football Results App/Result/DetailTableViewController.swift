//
//  DetailTableViewController.swift
//  Football Results App
//
//  Created by mac on 21.06.2020.
//  Copyright © 2020 Oleg Stasiw. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    @IBOutlet weak var table2: UITableView!
    var name: Match!
    var round: Round!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        round.matches.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailMatchResultTableViewCell

        let teamMatches = round.matches[indexPath.row]
        cell.dateLabel.text = teamMatches?.date
        cell.namesTeamsLabel.text = "\(teamMatches?.team1?.name ?? "") - \(teamMatches?.team2?.name ?? "")"
        cell.scoreLabel.text = "\(teamMatches?.score1 ?? 0):\(teamMatches?.score2 ?? 0)"

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
