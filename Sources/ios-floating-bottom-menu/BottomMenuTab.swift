//
//  BottomMenuTab.swift
//  ios-floating-bottom-menu
//
//  Created by Fakhri Rasyid Saputro on 14/01/25.
//

public protocol BottomMenuTab: Identifiable, Equatable, CaseIterable {
    var icon: String { get }
}
