//
//  Utils.swift
//  LocalStorege_cw20
//
//  Created by Sergey Intern  on 12/12/17.
//  Copyright © 2017 Sergey Intern . All rights reserved.
//

import Foundation

struct Utils {
    
    static var directoryPath: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    static func pathInDocument(withComponent component: String) -> URL {
        return directoryPath.appendingPathComponent(component)
    }
}
