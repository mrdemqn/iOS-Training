//
//  PersonTableViewCell.swift
//  iOSTraining
//
//  Created by Димон on 11.07.23.
//

import UIKit

struct PersonTableViewModel {
    let title: NSAttributedString
}

final class PersonTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var nameSurnameLabel: UILabel!
    
    func configure(_ viewModel: PersonTableViewModel) {
        nameSurnameLabel.attributedText = viewModel.title
    }
}
