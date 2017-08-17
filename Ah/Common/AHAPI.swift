//
//  AHAPI.swift
//  Ah
//
//  Created by Guillaume Monot on 17/8/17
//  Copyright (c) 2017 mobizel. All rights reserved.
//

import Foundation

// TODO: 📝 Fill Ah's API URL

/*
** ⚠️ Supprimer la configuration ATS dans `info.plist` ⚠️
*/

/// Ah's API
enum AhAPI {

    /**
     API base URL
     - URL = https://
     */
    static let baseURL: String = "https://"

    ///
    static let test: String = "/test"
}

/// Ah's URL
enum AhURL {

    /// Facebook
    static let facebook: URL? = URL(string: "https://facebook.com/Ah")
}

// MARK: - Ah's API Debug
enum AhAPIDebug {

    /// Test account
    enum Account {
        static let username: String = ""
        static let password: String = ""
    }
}
