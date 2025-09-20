//
//  RestaurantCard.swift
//  SUMAQ
//
//  Created by Gabriela  Escobar Rojas on 19/09/25.
//
import SwiftUI
// MARK: - Restaurant Card
struct RestaurantCard: View {
    let name: String
    let category: String
    let tag: String
    let rating: Double
    let logoSystemName: String

    private let purple = Palette.purple // #792765

    var body: some View {
        HStack(spacing: 0) {
            // Panel morado (texto + estrellas)
            VStack(alignment: .leading, spacing: 8) {
                StarsView(rating: rating)
                VStack(alignment: .leading, spacing: 4) {
                    Text(name)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.white)
                    Text(category)
                        .font(.system(size: 14))
                        .foregroundStyle(.white.opacity(0.9))
                    Text(tag)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundStyle(.white.opacity(0.9))
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(purple)

            // Logo / imagen
            ZStack {
                Color.white
                Image(systemName: logoSystemName)
                    .font(.system(size: 56))
                    .foregroundStyle(.secondary)
            }
            .frame(width: 120)
        }
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .shadow(color: .black.opacity(0.08), radius: 8, y: 6)
    }
}
