//
//  UIView+Extension.swift
//  BanchanApp
//
//  Created by 송태환 on 2022/04/19.
//

import UIKit.UIView

extension UIView {
    func setHeight(_ value: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: value).isActive = true
    }

    func setWidth(_ value: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: value).isActive = true
    }

    func setDimensions(width: CGFloat, height: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: width),
            self.heightAnchor.constraint(equalToConstant: height)
        ])
    }

    func setHeight(toAnchor anchor: NSLayoutAnchor<NSLayoutDimension>, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }

    func setWidth(toAnchor anchor: NSLayoutAnchor<NSLayoutDimension>, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }

    func centerX(inView view: UIView, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
    }

    func centerY(inView view: UIView, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    }

    func center(inView view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    func centerX(inLayoutGuide layout: UILayoutGuide, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: layout.centerXAnchor, constant: constant).isActive = true
    }

    func centerY(inLayoutGuide layout: UILayoutGuide, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerYAnchor.constraint(equalTo: layout.centerYAnchor, constant: constant).isActive = true
    }

    func center(inLayoutGuide layout: UILayoutGuide) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: layout.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: layout.centerYAnchor)
        ])
    }

    func anchor(
        top: NSLayoutYAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        leading: NSLayoutXAxisAnchor? = nil,
        trailing: NSLayoutXAxisAnchor? = nil,
        paddingTop: CGFloat = 0,
        paddingBottom: CGFloat = 0,
        paddingLeft: CGFloat = 0,
        paddingRight: CGFloat = 0,
        width: CGFloat? = nil,
        height: CGFloat? = nil
    ) {
        self.translatesAutoresizingMaskIntoConstraints = false

        var constraints = [NSLayoutConstraint]()

        if let top = top {
            let constraint = self.topAnchor.constraint(equalTo: top, constant: paddingTop)
            constraints.append(constraint)
        }

        if let bottom = bottom {
            let constraint = self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom)
            constraints.append(constraint)
        }

        if let leading = leading {
            let constraint = self.leadingAnchor.constraint(equalTo: leading, constant: paddingLeft)
            constraints.append(constraint)
        }

        if let trailing = trailing {
            let constraint = self.trailingAnchor.constraint(equalTo: trailing, constant: paddingRight)
            constraints.append(constraint)
        }

        if let width = width {
            let constraint = self.widthAnchor.constraint(equalToConstant: width)
            constraints.append(constraint)
        }

        if let height = height {
            let constraint = self.heightAnchor.constraint(equalToConstant: height)
            constraints.append(constraint)
        }

        NSLayoutConstraint.activate(constraints)
    }

    func fill(inView view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        let topAnchor = view.topAnchor
        let leadingAnchor = view.leadingAnchor
        let trailingAnchor = view.trailingAnchor
        let bottomAnchor = view.bottomAnchor

        self.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor)
    }

    func fill(inView view: UILayoutGuide) {
        self.translatesAutoresizingMaskIntoConstraints = false
        let topAnchor = view.topAnchor
        let leadingAnchor = view.leadingAnchor
        let trailingAnchor = view.trailingAnchor
        let bottomAnchor = view.bottomAnchor

        self.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor)
    }
}
