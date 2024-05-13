import SwiftUI

struct HealthKitPermissionPrimingView: View {
    let description =   """
                        This app displays your step and weight data in interactive charts.
                        
                        You can also add new weight data to Apple Health from this app. Your data is private and secured.
                        """
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Image(.appleHealthIcon)
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .shadow(color: .gray.opacity(0.3), radius: 16)
            Text("Apple Health Integration")
                .font(.title2.bold())
            Text(description)
                .foregroundStyle(.secondary)
            
            Button("Connect Apple Health") {
                print("Connect...")
            }
            .buttonStyle(.borderedProminent)
            .tint(.pink)
            .frame(maxWidth: .infinity)
            .padding(.top, 130)
        }
        .padding(30)
    }
}

#Preview {
    HealthKitPermissionPrimingView()
}
