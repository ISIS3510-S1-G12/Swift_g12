//
//  TopBar.swift
//  SUMAQ
//
//  Created by Gabriela  Escobar Rojas on 19/09/25.
//
import SwiftUI

// MARK: - Top bar (logo + tabs header)
struct TopBar: View {
    var body: some View {
        HStack {
            Image("AppLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 36, height: 36)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))

            Spacer()

            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 36))
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal, 16)
    }
}
