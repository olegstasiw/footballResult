//
//  TeamsTableViewController.swift
//  Football Results App
//
//  Created by mac on 21.06.2020.
//  Copyright © 2020 Oleg Stasiw. All rights reserved.
//

import UIKit

class TeamsTableViewController: UITableViewController {

    @IBOutlet weak var teamsTable: UITableView!
    private let jsonUrl = "https://raw.githubusercontent.com/openfootball/football.json/master/2019-20/en.1.clubs.json"

    private var clubs: [Club] = []
    private var result: Members?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        fetchData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        clubs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TeamsTableViewCell

        let club = clubs[indexPath.row]
        cell.configure(with: club, and: result)

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func fetchData() {
        guard let url = URL(string: jsonUrl) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in

            if let error = error { print(error); return }
            if let response = response { print(response) }
            guard let data = data else { return }

            let decoder = JSONDecoder()

            do {
                self.result = try decoder.decode(Members.self, from: data)
                self.clubs = self.result?.clubs as! [Club]
            } catch let error {
                print(error)
            }

            self.teamsTable.reloadData()

        }.resume()
    }
}
