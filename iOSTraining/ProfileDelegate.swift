//
//  ProfileDelegate.swift
//  iOSTraining
//
//  Created by Димон on 15.06.23.
//

import UIKit

protocol ProfileDelegate {
    var profile: Profile { get set }
    
    func saveProfile(profile: Profile)
}

struct Profile {
    var gender: String
    var nickname: String
    var avatarImage: UIImage?
    
    init() {
        gender = ""
        nickname = "No name"
    }
    
    var isMale: Bool {
        return gender == "Male"
    }
}
