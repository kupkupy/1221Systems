//
//  UITableViewCell+Reusable.swift
//  1221SystemsTest
//
//  Created by Tanya on 17.08.2023.
//

import UIKit

protocol Reusable { }

extension Reusable where Self: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension Reusable where Self: UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Reusable {}
extension UICollectionViewCell: Reusable {}
