//
//  Shape.swift
//  Barbell
//
//  Created by 김은찬 on 6/25/25.
//

import SwiftUI

public extension View {
    func clipShape(size: CGFloat) -> some View {
        self.clipShape(RoundedRectangle(cornerRadius: size))
    }
}
