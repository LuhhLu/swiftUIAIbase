import SwiftUI

struct PFour: View {
    @State var showAlert = false

    var body: some View {
        
 
        ZStack {
            if showAlert {
                
                GroupBox {
                    VStack(spacing: 15) {
                     
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundStyle(.red).font(.system(size: 50))

                        Text("Are you sure you want to delete your account?")
                            .font(.headline)
                          
                        Text("Deleting your account is permanent and cannot be undone. All your data will be lost.")
                            .font(.footnote).foregroundStyle(.secondary)
                        
                        Button {withAnimation {  showAlert = false  }
                        } label: {
                            Text("Dismiss").bold()
                                .frame(maxWidth: .infinity) .padding(.vertical, 15)
                                .background(.gray.opacity(0.2), in: .rect(cornerRadius: 8))
                        }
                        .tint(.primary)
                    }
                    .multilineTextAlignment(.center)
                }
                .transition(.asymmetric(insertion: .scale, removal: .scale(scale: 0).combined(with: .opacity)))
            }
            
            Button { withAnimation { showAlert = true }
            } label: { Text("Delete account")
                    .frame(maxWidth: .infinity) .padding(.vertical, 15)
                    .background(.gray.opacity(0.2), in: .rect(cornerRadius: 8))
            }
            .tint(.primary) .frame(maxHeight: .infinity,alignment: .bottom)

        }
        .padding()
    }
}

#Preview {
    PFour()
}
