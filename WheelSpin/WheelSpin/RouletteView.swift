 
import SwiftUI

struct RouletteView: View {
    @State  var radius: CGFloat = 0
    @StateObject var viewModel = RouletteViewModel()
    var body: some View {
      
            VStack {
                GeometryReader { geometry in
                    ZStack {
                        ForEach(0..<viewModel.segmentCount, id: \.self) { index in
                            ZStack {
                                Segment(startAngle: self.angleForSegment(index), endAngle: self.angleForSegment(index + 1))
                                    .fill(viewModel.colors[index % viewModel.colors.count])
                                    .onAppear {
                                        let midX = geometry.frame(in: .local).midX + 40
                                        let midY = geometry.frame(in: .local).midY + 40
                                        radius = min(midX, midY)
                                    }
                                Text(viewModel.names[index])
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .rotationEffect(self.angleForSegment(index + 1) - Angle(degrees: 10))
                                    .offset(
                                        CGSize(
                                            width: { () -> Double in
                                                let mean: Angle = (self.angleForSegment(index) + self.angleForSegment(index + 1)) / 2
                                                return radius * 0.5 * cos(mean.radians)
                                            }(),
                                            height: { () -> Double in
                                                let mean: Angle = (self.angleForSegment(index) + self.angleForSegment(index + 1)) / 2
                                                return radius * 0.5 * sin(mean.radians)
                                            }()
                                        )
                                    )
                            }
                            .frame(width: 300, height: 300)
                            .rotationEffect(.degrees(viewModel.rotation))
                        }
                        
                        Circle()
                            .fill(Color.white)
                            .frame(width: 50, height: 50)

                        Arrow()
                            .fill(Color.gray)
                            .frame(width: 30, height: 30)
                            .rotationEffect(.degrees(180))
                            .offset(x: 150, y: 0)
                            .shadow(color: .gray, radius: 4, x: 2, y: 2)
                    }
    //                .offset(x: 10)
                    .onTapGesture {
                        viewModel.spinRoulette()
                    }
                    
                    
                    
                    
                }
                .padding(30)

                VStack(spacing: 10) {
                    HStack {
                        TextField("Enter name", text: $viewModel.newColorName)
                            .padding(.leading)
                            .frame(height: 55)
                            .background(.thinMaterial,in:.rect(cornerRadius: 12))
                        Button(action: viewModel.addNewItem) {
                            Text("Add").bold()
                                .frame(width: 80,height: 55)
                                .background(.thinMaterial,in:.rect(cornerRadius: 12))
                        }
                        .tint(.primary)
                        
                    }
                     Spacer()
                    if viewModel.names.filter({$0  != ""}).isEmpty == false {
                        List {
                            ForEach(viewModel.names, id: \.self) { name in
                                Text(name)
                            }
                            .onDelete(perform: viewModel.deleteItems)
                         
                        }
                        .listStyle(.grouped)
                        .scrollContentBackground(.hidden)
                     
                       
                    }
                       
                }
            }
            .ignoresSafeArea(.keyboard)
            .padding(.horizontal,10)
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("We have Winner!"),
                    message: Text("The winning is \(viewModel.winningName)"),
                    dismissButton: .default(Text("OK"))
                )
        }
        
        
    }
    
    func angleForSegment(_ index: Int) -> Angle {
        Angle(degrees: Double(index) / Double(viewModel.names.count) * 360)
    }
    
    func textAngleForSegment(_ index: Int) -> Angle {
        let segmentAngle = 360.0 / Double(viewModel.names.count)
        return Angle(degrees: -Double(index) * segmentAngle - segmentAngle / 2)
    }
}

#Preview {
    RouletteView()
}
