import SwiftUI

struct RegisterView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""


    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()

            VStack(spacing: 20) {
                Spacer().frame(height: 40)

                Image("AppLogoUI")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                    .accessibilityLabel("App logo")

                Text("WELCOME")
                    .font(.system(size: 40, weight: .heavy, design: .default))
                    .foregroundColor(Palette.purple)
                    .kerning(1)

                VStack(alignment: .leading, spacing: 18) {

                   LabeledField(
                       title: "Name",
                       text: $name,
                       placeholder: "Value",
                       keyboard: .default,
                       autocap: .words
                   )

                   LabeledField(
                       title: "Email",
                       text: $email,
                       placeholder: "Value",
                       keyboard: .emailAddress,
                       autocap: .never
                   )
                   .textInputAutocapitalization(.never)

                   LabeledField(
                       title: "Username",
                       text: $username,
                       placeholder: "Value",
                       keyboard: .default,
                       autocap: .never
                   )
                   .textInputAutocapitalization(.never)

                   LabeledSecureField(
                       title: "Password",
                       text: $password,
                       placeholder: "Value"
                   )
                   .textInputAutocapitalization(.never)
               }
                Button(action: {}) {
                    Text("Register")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .frame(maxWidth: .infinity, minHeight: 56)
                }
                .buttonStyle(PrimaryCapsuleButton())
                .padding(.top, 6)
                
                
               Spacer().frame(height: 24)
            }
            .padding(.horizontal, 24)
        }
    }
}

struct LabeledField: View {
    let title: String
    @Binding var text: String
    let placeholder: String
    var keyboard: UIKeyboardType = .default
    var autocap: TextInputAutocapitalization = .never

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.custom("Montserrat-SemiBold", size: 16))
                .foregroundColor(Palette.burgundy)          // <- antes .sumaqLabel

            TextField(placeholder, text: $text)
                .font(.custom("Montserrat-Regular", size: 16))
                .keyboardType(keyboard)
                .textInputAutocapitalization(autocap)
                .autocorrectionDisabled(true)
                .padding(.horizontal, 16)
                .frame(height: 52)
                .background(Color(.systemGray5))
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        }
    }
}

struct LabeledSecureField: View {
    let title: String
    @Binding var text: String
    let placeholder: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.custom("Montserrat-SemiBold", size: 16))
                .foregroundColor(Palette.burgundy)          // <- antes .sumaqLabel

            SecureField(placeholder, text: $text)
                .font(.custom("Montserrat-Regular", size: 16))
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
                .padding(.horizontal, 16)
                .frame(height: 52)
                .background(Color(.systemGray5))
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        }
    }
}

// MARK: - Botón primario usando la paleta

struct PrimaryCapsuleButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(Palette.purple)                   // <- usa Palette
            )
            .shadow(radius: configuration.isPressed ? 0 : 2, x: 0, y: configuration.isPressed ? 0 : 1)
            .opacity(configuration.isPressed ? 0.92 : 1.0)
            .animation(.easeInOut(duration: 0.12), value: configuration.isPressed)
    }
}

#Preview("RegisterView") {
    RegisterView()
        .environment(\.colorScheme, .light)
        .previewDevice("iPhone 15 Pro")
}

