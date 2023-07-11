//
//  StringExtensions.swift
//  iOSTraining
//
//  Created by Димон on 11.07.23.
//

import Foundation

extension String {
    func trimmingLeadingAndTrailingSpaces(using characterSet: CharacterSet = .whitespacesAndNewlines) -> String {
        return trimmingCharacters(in: characterSet)
    }
}
