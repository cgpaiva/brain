//
//  ViewCodable.swift
//  SaoRoque
//
//  Created by Gabriel on 28/08/22.
//
import Foundation

public protocol ViewCodable {
    func configHierarchy()
    func configConstraints()
    func configViews()
    func configureViewsText()
    func configureActions()
    func render()
}

extension ViewCodable {
    public func setupView() {
        configHierarchy()
        configConstraints()
        configViews()
        configureViewsText()
        configureActions()
        render()
    }
}
