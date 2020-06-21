//
//  TeamsTableViewCell.swift
//  Football Results App
//
//  Created by mac on 21.06.2020.
//  Copyright © 2020 Oleg Stasiw. All rights reserved.
//

import UIKit

class TeamsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameTeamLabel: UILabel!
    @IBOutlet weak var ligaNameLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!

    func configure(with result: Club, and members: Members?) {
        self.nameTeamLabel.text = "\(result.name ?? "")"
        ligaNameLabel.text = "\(members?.name ?? "")"
        codeLabel.text = "\(result.code ?? "")"
    }
}
