import SDWebImageSwiftUI
import SwiftUI

struct TheImageView: View {
    @EnvironmentObject var vm :DataManager
    var body: some View {
        ZStack{
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            WebImage(url: URL(string: vm.selectedImage ?? ""))
                .resizable()
                .scaledToFill()
                .frame(maxWidth: UIScreen.main.bounds.width - 60 ,maxHeight: UIScreen.main.bounds.height - 200)
                .clipped()
                .cornerRadius(20)
                .overlay(alignment: .bottom) {
                    HStack{
                        ZStack{
                            Circle()
                                .stroke(Color.gray.opacity(0.2),lineWidth: 5)
                            Circle()
                                .trim(from: 0.0, to: vm.animateCircle ? 1.0: 0.0)
                                .stroke(Color.green,lineWidth: 5)
                                .rotationEffect(.degrees(-90))
                                .animation(.easeInOut(duration: 2.0), value: vm.animateCircle)
                            Button {
                                vm.animateCircle.toggle()
                                vm.downloadansSaveImage(url: vm.selectedImage ?? "")
                            } label: {
                                Image(systemName: vm.animateCircle ? "checkmark" : "arrow.down.to.line")
                                    .font(.title3)
                                    .foregroundColor(vm.animateCircle ? .green : .black.opacity(0.7))
                                    .padding(6)
                                    .background(.white.opacity(0.7))
                                    .clipShape(Circle())
                            }
                            
                        }
                        .frame(width: 35, height: 35)
                        Spacer()
                        Button {
                            vm.selectedImage = nil
                            vm.animateCircle = false
                        } label: {
                            Image(systemName: "xmark")
                                .font(.title3)
                                .foregroundColor(.black.opacity(0.7))
                                .padding(6)
                                .background(.white.opacity(0.7))
                                .clipShape(Circle())
                        }
                    }
                    .padding()
                    
            }
        }
    }
}

struct TheImageView_Previews: PreviewProvider {
    static var previews: some View {
        TheImageView()
            .environmentObject(DataManager())
    }
}
