//
//  extension.swift
//  20151221
//
//  Created by SinObjectC on 15/12/28.
//  Copyright © 2015年 SinObjectC. All rights reserved.
//

import Foundation

public extension Int {
    public static func random(lower: Int = 0, _ upper: Int = Int.max) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
    
    public static func random(range: Range<Int>) -> Int {
        return random(range.startIndex, range.endIndex)
    }
}

public extension Bool {
    /// SwiftRandom extension
    public static func random() -> Bool {
        return Int.random(0, 1) == 0
    }
}

public extension Double {
    /// SwiftRandom extension
    public static func random(lower: Double, _ upper: Double = 100) -> Double {
        return (Double(arc4random()) / 0xFFFFFFFF) * (upper - lower) + lower
    }
}

public extension Float {
    /// SwiftRandom extension
    public static func random(lower: Float = 0, _ upper: Float = 100) -> Float {
        return (Float(arc4random()) / 0xFFFFFFFF) * (upper - lower) + lower
    }
}

//public extension CGFloat {
//    /// SwiftRandom extension
//    public static func random(lower: CGFloat = 0, _ upper: CGFloat = 1) -> CGFloat {
//        return CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * (upper - lower) + lower
//    }
//}