//
//  TriState.swift
//  SinglePlayerSet
//
//  Created by Wangshu Zhu on 2023/4/17.
//

import Foundation

// represents three kind of state, with store value of type dont care
//
struct TriState :Equatable {
    // with  0...2 representing 3 kind of states
    private(set) var valueIndex: Int
    
    // how to check two tristate is same?
    // first has to have same type
    // second has
    
    init?(_ valueIndex: Int) {
        if valueIndex < 0 || valueIndex > 2 {
            return nil
        }
        self.valueIndex = valueIndex
    }
}


/// Represents a thing that has three different states
/// @Element
enum Trig<Element> {
    case first(Element)
    case second(Element)
    case third(Element)
    
    init(from index: Int, elements: [Element]) {
        switch index  {
        case 0:
            self = .first(elements[0])
        case 1:
            self = .second(elements[1])
        case 2:
            self = .third(elements[2])
        default:
            self = .first(elements[0])
        }
    
    }
}
