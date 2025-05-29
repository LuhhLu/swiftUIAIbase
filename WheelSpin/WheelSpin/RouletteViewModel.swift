 

import Foundation
import SwiftUI
import Combine

class RouletteViewModel: ObservableObject {
    @Published  var segmentCount = 1
    @Published  var rotation: Double = 0
    @Published  var isSpinning = false
    @Published  var winningName: String = ""
    @Published  var showAlert = false
    @Published  var usedColors: [Color] = [.blue]
    @Published  var colors: [Color] = [.gray.opacity(0.3)]
    @Published  var usedColorsNames: [Color] = [.blue]
    @Published  var names: [String] = [""]
    @Published  var winningColor: [String] = []
    @Published  var newColorName: String = ""
    var selectedColor: Color = .blue  
    var lastUsedColor: Color = .clear
    let availableColors: [Color] = [.red, .blue, .green, .yellow, .purple, .orange]
    let totalSpinDuration: Double = 5.0
    var totalRotations: Double = 3500
    
    func spinRoulette() {
        guard !isSpinning else { return }
        isSpinning = true
        
        withAnimation(Animation.timingCurve(0.1, 0.8, 0.3, 1.0, duration: totalSpinDuration)) {
            rotation += totalRotations
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + totalSpinDuration) {[weak self] in
            guard let this = self else {return}
            this.isSpinning = false
            let incompleteRotation = Int(this.rotation) % 360
            let restOfRotation: Double = Double(incompleteRotation) / (360.0 / Double(this.segmentCount))
            let restOfRotationInteger = Int(restOfRotation)
            let winningIndex = Double(restOfRotationInteger) == restOfRotation ? restOfRotationInteger : restOfRotationInteger + 1
            this.winningColor = this.names.reversed()
            print("dddd", this.winningColor)
            this.winningName = this.winningColor[winningIndex - 1]
            this.showAlert = true
        }
    }
    
    func addNewItem() {
        guard !newColorName.isEmpty else { return }
        addNewColorAndName(name: newColorName)
        names.removeAll(where: {$0 == ""})
        segmentCount = names.count
        newColorName = ""
    }
    
    func deleteItems(at offsets: IndexSet) {
        names.remove(atOffsets: offsets)
        segmentCount -= 1
        if names.isEmpty {
            names = [""]
            segmentCount = 1
        }
    }
    
    func addNewColorAndName(name: String) {
        if usedColors.count < availableColors.count {
            let unusedColors = availableColors.filter { !usedColors.contains($0) }
            if let randomColor = unusedColors.randomElement() {
                colors.append(randomColor)
                usedColors.append(randomColor)
                lastUsedColor = randomColor
                if availableColors.firstIndex(of: randomColor) != nil {
                    names.append(name)
                }
            }
        } else {
            if let randomColor = availableColors.filter({$0 != lastUsedColor && $0 != colors[0]}).randomElement() {
                colors.append(randomColor)
                lastUsedColor = randomColor
                if availableColors.firstIndex(of: randomColor) != nil {
                    names.append(name)
                }
            }
        }
    }
    
}

#Preview {
    RouletteView()
}
