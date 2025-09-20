//
//  HomeUser.swift
//  SUMAQ
//
//  Created by Gabriela  Escobar Rojas on 19/09/25.
//

import SwiftUI
import MapKit

// MARK: - Home (sin navegación)
struct UserHomeView: View {
    @State private var searchText = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                TopBar()

                SegmentedTabs() // UI estática (Home seleccionado)

                HStack(spacing: 10) {
                    SearchBar(text: $searchText)
                    Button(action: {}) {
                        Image(systemName: "bubble.right")
                            .font(.system(size: 20, weight: .semibold))
                            .padding(10)
                            .overlay(Circle().stroke(Color(hex: 0xCE7B49), lineWidth: 2))
                    }
                    .foregroundStyle(Color(hex: 0xCE7B49))
                }
                .padding(.horizontal, 16)

                // Mapa OSM (zona Uniandes)
                OSMMapView(center: CLLocationCoordinate2D(latitude: 4.6010, longitude: -74.0661),
                           span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
                    .frame(height: 240)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .padding(.horizontal, 16)

                VStack(spacing: 14) {
                    RestaurantCard(
                        name: "La Puerta",
                        category: "Burgers restaurant",
                        tag: "Offers",
                        rating: 4.5,
                        logoSystemName: "circle" // cámbialo por un asset si lo tienes
                    )

                    RestaurantCard(
                        name: "Chick & Chips",
                        category: "Chicken restaurant",
                        tag: "Offers Tag",
                        rating: 5.0,
                        logoSystemName: "circle"
                    )
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
            }
            .padding(.top, 8)
        }
        .background(Color(.systemBackground).ignoresSafeArea())
    }
}

// MARK: - Top bar (logo + tabs header)
private struct TopBar: View {
    var body: some View {
        HStack {
            Image("AppLogo") // tu asset
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

// MARK: - Segmented tabs (UI estática)
private struct SegmentedTabs: View {
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

// MARK: - Search Bar
private struct SearchBar: View {
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
        .background(Color(hex: 0xCE7B49)) // naranja
        .foregroundStyle(.white)
        .clipShape(Capsule())
    }
}

// MARK: - Restaurant Card
private struct RestaurantCard: View {
    let name: String
    let category: String
    let tag: String
    let rating: Double
    let logoSystemName: String // usa un ImageSet si tienes logos

    private let purple = Color(hex: 0x792765)

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

// Estrellas (soporta medios puntos)
private struct StarsView: View {
    let rating: Double // 0...5

    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<5) { i in
                let value = rating - Double(i)
                if value >= 1 {
                    Image(systemName: "star.fill")
                } else if value >= 0.5 {
                    Image(systemName: "star.leadinghalf.filled")
                } else {
                    Image(systemName: "star")
                }
            }
        }
        .font(.system(size: 14, weight: .semibold))
        .foregroundStyle(.white.opacity(0.95))
    }
}

// MARK: - OpenStreetMap wrapper (sin dependencias)
struct OSMMapView: UIViewRepresentable {
    var center: CLLocationCoordinate2D
    var span: MKCoordinateSpan

    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.isRotateEnabled = false
        map.showsCompass = false
        map.showsScale = false

        let template = "https://tile.openstreetmap.org/{z}/{x}/{y}.png"
        let overlay = MKTileOverlay(urlTemplate: template)
        overlay.canReplaceMapContent = true
        map.addOverlay(overlay, level: .aboveLabels)

        map.delegate = context.coordinator

        let region = MKCoordinateRegion(center: center, span: span)
        map.setRegion(region, animated: false)
        return map
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {}

    func makeCoordinator() -> Coordinator { Coordinator() }

    final class Coordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let tile = overlay as? MKTileOverlay {
                return MKTileOverlayRenderer(tileOverlay: tile)
            }
            return MKOverlayRenderer(overlay: overlay)
        }
    }
}


#Preview {
    UserHomeView()
}
