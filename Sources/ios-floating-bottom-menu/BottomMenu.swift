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
    var cornerRadius: CGFloat
    var backgroundColor: Color
    var shadowColor: Color
    var selectedIconColor: Color
    var unselectedIconColor: Color

    public init(
        tabs: [TabType],
        selectedTab: Binding<TabType>,
        cornerRadius: CGFloat = 20,
        backgroundColor: Color = .white,
        shadowColor: Color = .gray.opacity(0.4),
        selectedIconColor: Color = .black,
        unselectedIconColor: Color = .gray
    ) {
        self.tabs = tabs
        self._selectedTab = selectedTab
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.shadowColor = shadowColor
        self.selectedIconColor = selectedIconColor
        self.unselectedIconColor = unselectedIconColor
    }

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
