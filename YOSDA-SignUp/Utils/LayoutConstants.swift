//
//  LayoutConstants.swift
//  YOSDA-SignUp
//
//  Created by Giovanne Bressam on 09/05/24.
//

import Foundation

enum SpacingConstants {
    case xsmall, small, medium, big, xbig
    
    var constant: CGFloat {
        switch self {
        case .xsmall: return 4
        case .small: return 8
        case .medium: return 16
        case .big: return 24
        case .xbig: return 32
        }
    }
}

enum ButtonSizeConstants {
    case big
    
    var constant: CGFloat {
        switch self {
        case .big: return 48
        }
    }
}

enum RadiusConstants {
    case small
    
    var constant: CGFloat {
        switch self {
        case .small: return 8
        }
    }
}
