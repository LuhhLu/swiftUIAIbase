 
import SwiftUI

struct Feature: Identifiable {
    var id = UUID()
    var icon: String
    var title: String
    var description: String
}
struct FeatureView: View {
    var feature: Feature
    var body: some View {
        HStack(spacing:12){
            ZStack{
                Circle()
                    .frame(width: 45, height: 45)
                    .foregroundStyle(.gray.opacity(0.3))
                Image(systemName: feature.icon)
                    .foregroundStyle(.white)
                    .font(.system(size: 20).bold())
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(feature.title)
                    .font(.system(size: 18).bold())
                Text(feature.description)
                    .font(.system(size: 16))
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
        }
        .padding(.horizontal,35)
    }
}
#Preview {
    FeatureView(feature: Feature(icon: "bell.fill", title: "Tareas ilimitadas", description: "Establece recordatorios y alertas para no perder nunca una fecha límite")
    )
}

 
