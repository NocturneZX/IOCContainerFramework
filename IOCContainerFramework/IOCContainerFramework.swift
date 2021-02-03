//
//  IOCContainerFramework.swift
//  IOCContainerFramework
//
//  Created by Julio Reyes on 2/1/21.
//

import Foundation

public class IOCContainerFramework {
    
    private var dependecies = [String: WeakClass]()
    private static var shared = IOCContainerFramework.init()
    
    public static func register<T> (_ dependency: T) {
        shared.register(dependency)
    }
    public static func resolve<T> () -> T {
        shared.resolve()
    }
    
    private func register<T> (_ dependency: T) {
        let key = "\(type(of: T.self))"
        let weakInstanceValue = WeakClass.init(value: dependency as AnyObject)
        dependecies[key] = weakInstanceValue
    }
    
    private func resolve<T> () -> T{
        let key = "\(type(of: T.self))"
        let weakInstanceValue = dependecies[key]
        
        precondition(weakInstanceValue != nil, "WARNING: No dependency has been found for key: \(key), Application must have a dependency registered before resolution.")
        
        let dependency = weakInstanceValue!.value as? T
        precondition(dependency != nil, "WARNING: No dependency has been found for key: \(key), This dependency is deallocated.")
        
        return dependency!
    }

}

