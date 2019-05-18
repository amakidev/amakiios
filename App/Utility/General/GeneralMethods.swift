//
//  GeneralMethods.swift
//  Catao
//
//  Created by Victor Catão on 30/12/18.
//  Copyright © 2018 Catao. All rights reserved.
//

import Foundation

func isUserLogged() -> Bool {
    return UserDefaults.standard.string(forKey: KEY_USER_TOKEN) != nil
}
