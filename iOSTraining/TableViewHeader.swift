//
//  TableViewHeader.swift
//  iOSTraining
//
//  Created by Димон on 11.07.23.
//

import UIKit

final class TableViewHeader: UITableViewCell {
    
    @IBOutlet weak var headerLabel: UILabel!
    
    func configure(with viewModel: TableHeaderViewModel) {
        headerLabel.text = String(viewModel.title)
    }
}

struct TableHeaderViewModel {
    let title: Character
}
