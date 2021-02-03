//
//  Dependency.swift
//  IOCContainerFramework
//
//  Created by Julio Reyes on 2/1/21.
//

import Foundation

@propertyWrapper
class Dependency<T> {
    var wrappedValue: T
    
    init(wrappedValue: T) {
        self.wrappedValue = IOCContainerFramework.resolve()
    }
}

