//
//  AdaptiveAttributes.swift
//  SnapKit
//
//  Created by 黄道明輝 on 2021/11/15.
//  Copyright © 2021 SnapKit Team. All rights reserved.
//

import Foundation

public enum AdaptiveAttribute: Int {
    case left = 1

    case right = 2

    case top = 3

    case bottom = 4

    case leading = 5

    case trailing = 6

    case width = 7

    case height = 8

    case centerX = 9

    case centerY = 10

    case lastBaseline = 11

    case firstBaseline = 12

    case leftMargin = 13
    
    case rightMargin = 14

    case topMargin = 15

    case bottomMargin = 16

    case leadingMargin = 17

    case trailingMargin = 18

    case centerXWithinMargins = 19

    case centerYWithinMargins = 20
    
    var constraint: ConstraintAttributes {
        switch self {
        case .left:
            return .left
        case .right:
            return .right
        case .top:
            return .top
        case .bottom:
            return .bottom
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        case .width:
            return .width
        case .height:
            return .height
        case .centerX:
            return .centerX
        case .centerY:
            return .centerY
        case .lastBaseline:
            return .lastBaseline
        case .firstBaseline:
            return .firstBaseline
        case .leftMargin:
            return .leftMargin
        case .rightMargin:
            return .rightMargin
        case .topMargin:
            return .topMargin
        case .bottomMargin:
            return .bottomMargin
        case .leadingMargin:
            return .leadingMargin
        case .trailingMargin:
            return .trailingMargin
        case .centerXWithinMargins:
            return .centerXWithinMargins
        case .centerYWithinMargins:
            return .centerYWithinMargins
        }
    }
    
}

extension Array where Element == AdaptiveAttribute {
    static public var horizental: Self {
        [.left, .right, .leading, .trailing, .width, .centerX, .leftMargin, .rightMargin, .leadingMargin, .trailingMargin, .centerXWithinMargins]
    }
    
    static public var vertical: Self {
        [.top, .bottom, .height, .centerY, .lastBaseline, .firstBaseline, .topMargin, .bottomMargin, .centerYWithinMargins]
    }
    
    static public var all: Self {
        horizental + vertical
    }
}
