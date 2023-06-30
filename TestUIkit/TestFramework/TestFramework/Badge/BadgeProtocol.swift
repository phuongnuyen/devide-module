//
//  BadgeProtocol.swift
//  TestFramework
//
//  Created by Phuong Nguyen on 26/06/2023.
//

import UIKit

public protocol BadgeLabelViewable {
    var text: String { get set }
    var typeProperty: BadgeLabelTypeProperty { get set }
}

public enum BadgeLabelProperty {
    case positive
    case informative
    case negative
    case neutral
}

public enum BadgeLabelTypeProperty {
    case primary(property: BadgeLabelProperty)
    case secondary(property: BadgeLabelProperty)
}

public protocol BadgeRibbonViewable {
    var rectBgColor: UIColor { get set }
    var arrowColor: UIColor { get set }
    var textColor: UIColor { get set }
    var text: String { get set }
}

public protocol BadgeNumbericViewable {
    var number: Int { get set }
}
