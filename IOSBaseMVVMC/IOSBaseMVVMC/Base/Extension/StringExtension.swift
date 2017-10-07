//
//  StringExtension10.swift
//  IOSBaseMVVMC
//
//  Created by KhiemND on 10/5/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation

extension String {
    var URLEscapedString: String {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)!
    }
    
    func localized() -> String {
        let currentLanguage = LanguageUtils.currentLanguage()
        let path = Bundle.main.path(forResource: currentLanguage, ofType: "lproj")
        if let path = path, let bundle = Bundle(path: path) {
            return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
        }
        return self
    }
    
}
