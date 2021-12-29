//
//  AdaptiveRuleManager.swift
//  SnapKit
//
//  Created by 黄道明輝 on 2021/11/16.
//  Copyright © 2021 SnapKit Team. All rights reserved.
//

import Foundation
#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif


public class AdaptiveRuleManager {
    public static let shared = AdaptiveRuleManager()
    
    /// 设计安全区尺寸
    public var designSafeAreaSize: CGSize = .zero
    
    private var screenSafeAreaSizeMap: [CGFloat : CGSize] = [:]
    
    private func getScreenSize(_ description: ConstraintDescription) -> CGSize? {
#if os(iOS) || os(tvOS)
        let screen = (description.item as? ConstraintView)?.window?.screen ?? UIScreen.main
#else
        let screen = (description.item as? ConstraintView)?.window?.screen ?? NSScreen.main
#endif
        
        return getSafeAreaSize(screen)
    }
    
    func getSafeAreaSize(_ screen: TargetScreen) -> CGSize {
#if os(iOS) || os(tvOS)
        if let size = screenSafeAreaSizeMap[screen.bounds.size.width] {
            return size
        }
        
        var inset = UIEdgeInsets.zero
        if #available(iOS 11.0, *) {
            inset = UIApplication.shared.windows.first?.safeAreaInsets ?? .zero
        } else {
            inset.top = UIApplication.shared.windows.first?.rootViewController?.topLayoutGuide.length ?? 0
            inset.bottom = UIApplication.shared.windows.first?.rootViewController?.bottomLayoutGuide.length ?? 0
        }
        
        let newSize = CGSize(width: screen.bounds.size.width - inset.left - inset.right,
                             height: screen.bounds.size.height - inset.top - inset.bottom)
        
        screenSafeAreaSizeMap[screen.bounds.size.width] = newSize
        return newSize
#else
        return screen.frame.size
#endif
    }
    
    internal func excute(_ description: ConstraintDescription) {
        assert(designSafeAreaSize != .zero, "Set ApdaptiveRuleManager")
        var scaleX: CGFloat = 1
        var scaleY: CGFloat = 1
        if let currentSize = getScreenSize(description) {
            scaleX = currentSize.width / designSafeAreaSize.width
            scaleY = currentSize.height / designSafeAreaSize.height
        }
        applyScale(description, x: scaleX, y: scaleY)
    }
    
    private func applyScale(_ description: ConstraintDescription, x: CGFloat, y: CGFloat) {
        var scaleX = x
        var scaleY = y
        switch description.rule {
        case .byDirection:
            break
        case .x:
            scaleY = x
        case .y:
            scaleX = y
        }
        
        let constant = description.constant
        
        // 单一数值转化为CGPoint
        if let value = constant as? CGFloat {
            description.constant = CGPoint(x: value * scaleX,
                                           y: value * scaleY)
        }
        
        if let value = constant as? Float {
            description.constant = CGPoint(x: CGFloat(value) * scaleX,
                                           y: CGFloat(value) * scaleY)
        }
        
        if let value = constant as? Double {
            description.constant = CGPoint(x: CGFloat(value) * scaleX,
                                           y: CGFloat(value) * scaleY)
        }
        
        if let value = constant as? Int {
            description.constant = CGPoint(x: CGFloat(value) * scaleX,
                                           y: CGFloat(value) * scaleY)
        }
        
        if let value = constant as? UInt {
            description.constant = CGPoint(x: CGFloat(value) * scaleX,
                                           y: CGFloat(value) * scaleY)
        }
        
        if let value = constant as? CGSize {
            description.constant = CGSize(width: value.width * scaleX,
                                          height: value.height * scaleY)
        }
        
        if let value = constant as? CGPoint {
            description.constant = CGPoint(x: value.x * scaleX, y: value.y * scaleY)
        }
        
        if let value = constant as? ConstraintInsets {
            description.constant = ConstraintInsets(top: value.top * scaleY,
                                                    left: value.left * scaleX,
                                                    bottom: value.bottom * scaleY,
                                                    right: value.right * scaleX)
        }
        
        #if os(iOS) || os(tvOS)
            if #available(iOS 11.0, tvOS 11.0, *),
                let value = constant as? ConstraintDirectionalInsets {
                description.constant = ConstraintDirectionalInsets(top: value.top * scaleY,
                                                                   leading: value.leading * scaleX,
                                                                   bottom: value.bottom * scaleY,
                                                                   trailing: value.trailing * scaleX)
            }
        #endif
    }
    
}
