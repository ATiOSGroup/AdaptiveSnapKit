//
//  AdaptiveRules.swift
//  SnapKit
//
//  Created by 黄道明輝 on 2021/11/16.
//  Copyright © 2021 SnapKit Team. All rights reserved.
//

import Foundation

public enum AdaptiveRule {
    /// 默认, 可以不使用rule()
    case byDirection
    /// 全部按照水平约束匹配
    case x
    /// 全部按照纵向约束匹配
    case y
}
