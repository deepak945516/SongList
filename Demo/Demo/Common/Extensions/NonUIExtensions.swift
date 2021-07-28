//
//  NonUIExtensions.swift
//  Demo
//
//  Created by Deepak Kumar on 26/07/21.
//

import Foundation

// MARK: - NSObject
extension NSObject {
    class var className: String {
        self.classForCoder().description().components(separatedBy: ".").last!
    }
}
