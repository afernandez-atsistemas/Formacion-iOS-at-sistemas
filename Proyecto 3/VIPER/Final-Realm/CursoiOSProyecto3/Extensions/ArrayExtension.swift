//
//  ArrayExtension.swift
//  VIPER
//
//  Created by Manuel Alfonso Terol on 06/11/2020.
//

import Foundation

extension Array {
    
    /// forEach function that allows mutate the items
    ///
    /// - Example:
    ///     array.mutateEach(by: { item in
    ///         item.property = newValue
    ///     })
    ///
    mutating func mutateEach(by transform: (inout Element) throws -> Void) rethrows {
       self = try map { element in
           var element = element
           try transform(&element)
           return element
       }
    }
}
