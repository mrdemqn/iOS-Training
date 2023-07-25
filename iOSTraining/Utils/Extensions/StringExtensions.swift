//
//  StringExtensions.swift
//  iOSTraining
//
//  Created by Димон on 25.07.23.
//

import Foundation

extension String {
    
    var isNotEmpty: Bool {
        !self.isEmpty
    }
    
    var trim: String {
        self.trimmingCharacters(in: .whitespaces)
    }
    
    var isNumbers: Bool {
        self == self.components(separatedBy: .decimalDigits.inverted).joined()
    }
}
