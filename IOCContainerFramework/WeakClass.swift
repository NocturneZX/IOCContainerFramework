//
//  WeakClass.swift
//  IOCContainerFramework
//
//  Created by Julio Reyes on 2/1/21.
//

import Foundation


class WeakClass: Equatable {
    weak var value: AnyObject?
    
    init(value: AnyObject){
        self.value = value
    }
    
    static func == (lhs: WeakClass, rhs: WeakClass) -> Bool{
        return lhs.value === rhs.value
    }
}
