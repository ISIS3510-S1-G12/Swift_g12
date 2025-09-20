//
//  SegmentedTabs.swift
//  SUMAQ
//
//  Created by Gabriela  Escobar Rojas on 19/09/25.
//

import SwiftUI
// MARK: - Segmented tabs (UI estática)
struct SegmentedTabs: View {
    private let items = ["Home", "Favorites", "Offers", "Review History"]
    private let selectedIndex = 0

    var body: some View {
        HStack(spacing: 0) {
            ForEach(items.indices, id: \.self) { idx in
                Text(items[idx])
                    .font(.system(size: 15, weight: idx == selectedIndex ? .semibold : .regular))
                    .foregroundStyle(idx == selectedIndex ? .primary : .secondary)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(
                        Capsule()
                            .fill(.white)
                            .opacity(idx == selectedIndex ? 1 : 0)
                    )
                    .overlay(
                        Rectangle()
                            .fill(Color(.separator))
                            .frame(width: idx == items.count - 1 ? 0 : 1, height: 18),
                        alignment: .trailing
                    )
            }
        }
        .padding(6)
        .background(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(Color(.systemGray6))
        )
        .padding(.horizontal, 16)
    }
}
