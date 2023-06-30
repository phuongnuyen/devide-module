//
//  BadgeLabel.swift
//  TestFramework
//
//  Created by Phuong Nguyen on 26/06/2023.
//

import UIKit
import SnapKit

public class BadgeLabel: UIView {
    
    private var _rectBgColor: UIColor = .Primary.green500
    private var _textColor: UIColor = .Primary.white500
    private var _text: String = ""
    private var _typeProperty: BadgeLabelTypeProperty = .primary(property: .positive)
    public var label: UILabel = {
       let view = UILabel()
        view.setContentHuggingPriority(.required, for: .horizontal)
        view.textColor = .Primary.white500
//        view.font = .SFProBold(size: 14)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        initLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public convenience init(typeProperty: BadgeLabelTypeProperty) {
        self.init(frame: .zero)
        updateTypeProperty(typeProperty: typeProperty)
        initLayout()
    }
    
    private func initLayout() {
        addSubview(label)
        self.backgroundColor = _rectBgColor
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.snp.makeConstraints({
            $0.height.equalTo(24)
        })
        
        label.snp.makeConstraints({
            $0.trailing.leading.equalToSuperview().inset(12)
            $0.top.bottom.equalToSuperview()
        })
    }
    
    public func updateTypeProperty(typeProperty: BadgeLabelTypeProperty) {
        switch typeProperty {
        case .primary(let property):
            switch property {
            case .positive:
                _rectBgColor = .Primary.green500
                _textColor = . Primary.white500
            case .informative:
                _rectBgColor = .Secondary.orange500
                _textColor = . Secondary.orange800
            case .negative:
                _rectBgColor = .Secondary.red500
                _textColor = . Primary.white500
            case .neutral:
                _rectBgColor = .Primary.dark300
                _textColor = .Primary.white500
            }
        case .secondary(let property):
            switch property {
            case .positive:
                _rectBgColor = .Primary.green50
                _textColor = . Primary.green700
            case .informative:
                _rectBgColor = .Secondary.orange50
                _textColor = . Secondary.orange700
            case .negative:
                _rectBgColor = .Secondary.red50
                _textColor = . Secondary.red700
            case .neutral:
                _rectBgColor = .Primary.dark50
                _textColor = .Primary.dark400
            }
        }
        backgroundColor = _rectBgColor
        label.textColor = _textColor
    }
}

extension BadgeLabel: BadgeLabelViewable{
    public var typeProperty: BadgeLabelTypeProperty {
        get {
            return _typeProperty
        }
        set {
            _typeProperty = newValue
            updateTypeProperty(typeProperty: newValue)
        }
    }
    
    public var text: String {
        get {
            return _text
        }
        set {
            _text = newValue
            label.text = text
        }
    }
}
