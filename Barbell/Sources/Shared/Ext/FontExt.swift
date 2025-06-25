//
//  FontExt.swift
//  Barbell
//
//  Created by 김은찬 on 6/25/25.
//

import SwiftUI

enum Pretendard: String {
    case semiBold = "Pretendard-SemiBold"
    case medium = "Pretendard-Medium"
    case bold = "Pretendard-Bold"
    case regular = "Pretendard-Regular"
}

public extension Font {
    private static func Pretendard(_ weight: Pretendard, _ size: CGFloat) -> Self {
        Font.custom(weight.rawValue, size: size)
    }
    
    static func regular(_ size: CGFloat) -> Self {
        Font.Pretendard(.regular, size)
    }
    
    static func medium(_ size: CGFloat) -> Self {
        Font.Pretendard(.medium, size)
    }
    
    static func bold(_ size: CGFloat) -> Self {
        Font.Pretendard(.bold, size)
    }
    
    static func semiBold(_ size: CGFloat) -> Self {
        Font.Pretendard(.semiBold, size)
    }
}
