//
//  BottomMenu.swift
//  ios-floating-bottom-menu
//
//  Created by Fakhri Rasyid Saputro on 14/01/25.
//

import SwiftUI

public struct BottomMenu<TabType: BottomMenuTab>: View {
    let tabs: [TabType]
    @Binding var selectedTab: TabType
    var cornerRadius: CGFloat = 20
    var backgroundColor: Color = .white
    var shadowColor: Color = .gray.opacity(0.4)
    var selectedIconColor: Color = .black
    var unselectedIconColor: Color = .gray

    public var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer(minLength: 0)
                ForEach(tabs) { tab in
                    TabButton(
                        tab: tab,
                        selectedTab: $selectedTab,
                        selectedIconColor: selectedIconColor,
                        unselectedIconColor: unselectedIconColor
                    )
                    .frame(width: 65, height: 65, alignment: .center)
                    Spacer(minLength: 0)
                }
            }
            .padding(.horizontal, 6)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(backgroundColor)
                    .shadow(color: shadowColor, radius: cornerRadius, x: 0, y: cornerRadius)
            )
            .padding(16)
        }
    }
}

struct TabButton<TabType: BottomMenuTab>: View {
    let tab: TabType
    @Binding var selectedTab: TabType
    var selectedIconColor: Color
    var unselectedIconColor: Color

    var body: some View {
        Button {
            withAnimation {
                selectedTab = tab
            }
        } label: {
            ZStack {
                Image(systemName: tab.icon)
                    .font(.system(size: 23, weight: .semibold, design: .rounded))
                    .foregroundColor(isSelected ? selectedIconColor : unselectedIconColor)
                    .scaleEffect(isSelected ? 1 : 0.8)
            }
        }
        .buttonStyle(.plain)
    }

    private var isSelected: Bool {
        selectedTab.id == tab.id
    }
}
