//
//  AttributeArray+Extensions.swift
//  SnapKit
//
//  Created by 黄道明輝 on 2021/11/16.
//  Copyright © 2021 SnapKit Team. All rights reserved.
//

import Foundation

extension Array where Element == ConstraintAttributes {
    func union() -> ConstraintAttributes {
        ConstraintAttributes.init(self)
    }
}
