//
//  ChoiceUserView.swift
//  SUMAQ
//
//  Created by Gabriela Escobar Rojas on 18/09/25.
//

import SwiftUI

struct ChoiceUserView: View {
    private let purple = Color(hex: 0x792765) // morado
    private let teal   = Color(hex: 0x276F79) // azulito

    var body: some View {
        VStack {
            Image("AppLogo")
                .resizable()
                .scaledToFit()
               

            Spacer()
            // Botones abajo
            VStack(spacing: 16) {
                NavigationLink {
                    LogInAndRegisterView()
                } label: {
                    Text("User")
                        .font(.system(size: 20, weight: .semibold))
                        .frame(maxWidth: .infinity, minHeight: 56)
                        .foregroundColor(.white)
                        .background(purple)
                        .clipShape(Capsule())
                        .shadow(radius: 2, y: 1)
                }

                NavigationLink {
                    LogInAndRegisterView()
                } label: {
                    Text("Restaurant")
                        .font(.system(size: 20, weight: .semibold))
                        .frame(maxWidth: .infinity, minHeight: 56)
                        .foregroundColor(.white)
                        .background(teal)
                        .clipShape(Capsule())
                        .shadow(radius: 2, y: 1)
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 24)
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemBackground).ignoresSafeArea())
        .toolbar(.hidden, for: .navigationBar)

    }
}




#Preview { ChoiceUserView() }

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red:   Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >>  8) & 0xff) / 255,
            blue:  Double( hex        & 0xff) / 255,
            opacity: alpha
        )
    }
}
