 

import SwiftUI
import PhotosUI
class ImagePickerViewModel: ObservableObject {
    @Published var progress: Double = 0.0
    @Published private(set) var selectedUIImage: UIImage?
    @Published var pickedPhotoItem: PhotosPickerItem? {
        didSet {
            loadImageFrom(item: pickedPhotoItem)
        }
    }
    private var hasImageBeenSelected: Bool = false
    func loadImageFrom(item: PhotosPickerItem?) {
        guard let item = item else { return }
        Task {
            if let data = try? await item.loadTransferable(type: Data.self),
               let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.selectedUIImage = uiImage
                    if !self.hasImageBeenSelected {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                            withAnimation {
                                self.progress += 0.25
                                // Set the flag to true
                                self.hasImageBeenSelected = true
                            }
                          
                        }
                     
                    }
                }
            }
        }
    }
}
struct ContentView: View {
    @State var text = ""
    @State var text2 = ""
    @State var text3 = ""
    @Binding var step: Int
    @State var offsetY: CGFloat = 0
    @State var shouldStartTransition: Bool = false
    var isContinueButtonActive: Bool {
        switch step {
        case 0:
            return !text.isEmpty
        case 1:
            return !text2.isEmpty
        case 2:
            return !text3.isEmpty
        case 3:
            return true
        default:
            return false
        }
    }
    @StateObject var vm = ImagePickerViewModel()
    var body: some View {
        VStack {
            PhotosPicker(selection: $vm.pickedPhotoItem) {
                if vm.selectedUIImage == nil{
                    ZStack{
                        Circle().stroke(lineWidth: 5).foregroundColor(.gray)
                        Circle().trim(from: 0, to: CGFloat(vm.progress))
                            .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round ))
                            .rotationEffect(.degrees(-95))
                            .foregroundColor(.yellow)
                        Image(systemName: "plus").font(.system(size: 50))
                            .foregroundColor(.gray)
                    }
                    .frame(width: 150, height: 150)
                }else{
                    ZStack{
                        Image(uiImage: vm.selectedUIImage!).resizable().scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                        
                        Circle().trim(from: 0, to: CGFloat(vm.progress))
                            .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round ))
                            .rotationEffect(.degrees(-95))
                            .foregroundColor(.yellow)
                            .frame(width: 155, height: 155)
                    }
                    
                }
            }
            .padding(.bottom,70)
            VStack {
               TFView(text: $text, titel: "Nmae", step: step, step2: 0, offsetY: offsetY, offsetY2: 8)
                TFView(text: $text2, titel: "Last Name", step: step, step2: 1, offsetY: offsetY, offsetY2: 18)
                TFView(text: $text3, titel: "Email", step: step, step2: 2, offsetY: offsetY, offsetY2: 22)
                
            }
            .padding(.horizontal)
            .offset(y: -offsetY)
            .overlay {
                HStack{
                    Button {
                        if step > 0 {
                            withAnimation {
                                step -= 1
                                offsetY -= 50
                                vm.progress -= 0.25
                            }
                        }
                    } label: {
                        Image(systemName: "arrow.left").font(.title2)
                            .foregroundColor(.white)
                            .frame(height: 40)
                            .padding(.horizontal,10)
                            .background(.black,in:RoundedRectangle(cornerRadius: 5))
                    }
                    .disabled(step == 0)
                    .opacity( step == 0 ? 0.5 : 1.0)
                    
                    
                    Button {
                        if isContinueButtonActive{
                            if step == 2 {
                                withAnimation {
                                    vm.progress += 0.25
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                    withAnimation {
                                        shouldStartTransition = true
                                        step += 1
                                        vm.progress += 0.25
                                    }
                                }
                            }
                            else{
                                withAnimation {
                                    step += 1
                                    offsetY += 50
                                    vm.progress += 0.25
                                }
                            }
                        }
                    } label: {
                        Text("Continue").font(.title2)
                            .foregroundColor(.white)
                            .frame(height: 40)
                            .padding(.horizontal,10)
                            .background(.black,in:RoundedRectangle(cornerRadius: 5))
                    }
                    .disabled(!isContinueButtonActive)
                    .opacity(isContinueButtonActive ? 1.0 : 0.5)


                }
        }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(step: .constant(0))
    }
}

struct TFView: View {
    @Binding var text: String
    var titel = ""
    var step: Int
    var step2: Int
    var offsetY: CGFloat
    var offsetY2: CGFloat
    var body: some View {
        VStack(alignment: .leading,spacing: 5){
            Text(titel).foregroundColor(.gray).padding(.leading,2)
            TextField(titel, text: $text) .autocorrectionDisabled(true)
                .padding(.leading).frame(height: 60)
                .background(.white,in:RoundedRectangle(cornerRadius: 10))
            .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 0)
        }
        .opacity(step == step2 ? 1 : 0)
        .offset(y: -offsetY - offsetY2)
       
        
    }
}






















