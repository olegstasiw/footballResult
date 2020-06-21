//
//  ResultTableViewCell.swift
//  Football Results App
//
//  Created by mac on 21.06.2020.
//  Copyright © 2020 Oleg Stasiw. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    @IBOutlet weak var resultLabel: UILabel!

    func configure(with result: Round) {
        self.resultLabel.text = "\(result.name ?? "")"
    }

}
