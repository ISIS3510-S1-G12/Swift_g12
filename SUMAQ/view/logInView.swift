import SwiftUI

struct LoginView: View {
    let role: UserType  

    var body: some View {
        VStack(spacing: 28) {
            Image("AppLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding(.top, 40)
        
            Text("WELCOME")
                .font(.custom("Mukta-ExtraBold", size: 36))
                .foregroundColor(role == .user ? Palette.purple : Palette.teal)
            
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Email or Username")
                        .font(.custom("Montserrat-Regular", size: 14))
                        .foregroundColor(.gray)
                    TextField("Value", text: .constant(""))
                        .textFieldStyle(.roundedBorder)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Password")
                        .font(.custom("Montserrat-Regular", size: 14))
                        .foregroundColor(.gray)
                    SecureField("Value", text: .constant(""))
                        .textFieldStyle(.roundedBorder)
                }
            }
            .padding(.horizontal, 32)
            
            SolidButton(
                title: "Log In",
                color: role == .usuario ? Palette.purple : Palette.teal,
                textColor: .white
            ) {
            }
            .padding(.horizontal, 32)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.ignoresSafeArea())
    }
}
