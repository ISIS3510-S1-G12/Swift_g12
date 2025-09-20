//
//  SearchBarUser.swift
//  SUMAQ
//
//  Created by Gabriela  Escobar Rojas on 19/09/25.
//
import SwiftUI
// MARK: - Search Bar
struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "line.3.horizontal")
                .font(.system(size: 18, weight: .semibold))
            TextField(
                "",
                text: $text,
                prompt: Text("Search your restaurant").foregroundStyle(.white.opacity(0.95))
            )
            .textInputAutocapitalization(.never)
            .foregroundStyle(.white)
            Image(systemName: "magnifyingglass")
                .font(.system(size: 18, weight: .semibold))
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(Palette.orangeAlt) // #CE7B49
        .foregroundStyle(.white)
        .clipShape(Capsule())
    }
}
