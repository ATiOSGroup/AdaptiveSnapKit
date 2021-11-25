//
//  AdaptiveExtensions.swift
//  SnapKit
//
//  Created by 黄道明輝 on 2021/11/22.
//  Copyright © 2021 SnapKit Team. All rights reserved.
//

import Foundation
#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

extension BinaryFloatingPoint {
    /// 按照规则适配
    public func adapted(to rule: AdaptiveRule, screen: TargetScreen? = nil) -> CGFloat {
        let screenSize: CGSize = {
#if os(iOS) || os(tvOS)
            return (screen ?? UIScreen.main).bounds.size
#else
            return (screen ?? NSScreen.main)!.frame.size
#endif
        }()
        
        switch rule {
        case .byDirection:
            fatalError("Not Support At FloatingPoint Adapt.")
        case .x:
            return CGFloat(self) * screenSize.width / AdaptiveRuleManager.shared.designSize.width
        case .y:
            return CGFloat(self) * screenSize.height / AdaptiveRuleManager.shared.designSize.height
        }
    }
}

extension BinaryInteger {
    /// 按照规则适配
    public func adapted(to rule: AdaptiveRule, screen: TargetScreen? = nil) -> CGFloat {
        CGFloat(self).adapted(to: rule, screen: screen)
    }
}
