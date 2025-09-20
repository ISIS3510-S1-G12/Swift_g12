//
//  HomeUser.swift
//  SUMAQ
//
//  Created by Gabriela  Escobar Rojas on 19/09/25.
//
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
                            .overlay(Circle().stroke(Palette.orange, lineWidth: 2))
                    }
                    .foregroundStyle(Palette.orange)
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
                        logoSystemName: "circle"
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











#Preview { UserHomeView() }
