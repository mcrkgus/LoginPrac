//
//  NSObject+.swift
//  kakao
//
//  Created by Gahyun Kim on 2024/01/02.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
