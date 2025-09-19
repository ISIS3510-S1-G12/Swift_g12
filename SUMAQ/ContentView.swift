//
//  ContentView.swift
//  SUMAQ
//
//  Created by Maria Alejandra Pinzon Roncancio on 18/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemBackground).ignoresSafeArea()

                NavigationLink {
                    ChoiceUserView()           // <- tu pantalla destino
                } label: {
                    Image("AppLogo")          // nombre EXACTO del asset
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220)
                        .contentShape(Rectangle()) // área táctil completa
                }
                .buttonStyle(.plain)           // sin estilo de botón azul
            }
            .toolbar(.hidden, for: .navigationBar) // opcional: oculta la barra
        }
    }
}

#Preview { ContentView() }
