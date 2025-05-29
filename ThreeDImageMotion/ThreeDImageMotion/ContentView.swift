 
import SwiftUI
import CoreMotion
struct ContentView: View {
    @State var motion: CMDeviceMotion? = nil
    let motionManager = CMMotionManager()
    let thresholdPitch: Double = 35 * .pi / 180
    let maxRotationAngle = 20.0
//motion: This is a state variable that holds the current motion data of the device. Being a state variable means that whenever this data changes, the view will re-render.
//motionManager: An instance of CMMotionManager which is responsible for accessing motion data from the device's hardware.
//thresholdPitch: The threshold angle (in radians) for the device's pitch, after which we want to begin affecting the UI.
//maxRotationAngle: Maximum allowed rotation angle (in degrees) for the 3D effect on the image.
    
    
    
    
    
    
    var rotation: (x:Double, y:Double){
        if let motion = motion{
            let pitchDegrees = min(maxRotationAngle,motion.attitude.pitch > thresholdPitch ? (motion.attitude.pitch - thresholdPitch) * (100.0 / .pi) : 0)
            let rollDegrees = min(maxRotationAngle,motion.attitude.roll * (100.0 / .pi))
            return(x: -pitchDegrees,y: rollDegrees)
        }
        return (x:0 , y:0)
        
    }
    
    
//    This computed property calculates the rotation effect for the image based on the device's attitude (its orientation in space).
//
//    It checks if there's valid motion data.
//    pitchDegrees: It calculates the degree of pitch (tilting forward and backward) based on the device's current attitude and subtracts the threshold. The result is then scaled by multiplying with 100 / pi. If the pitch is less than the threshold, it's set to 0.
//    rollDegrees: It calculates the degree of roll (tilting side to side) by scaling the device's attitude roll.
    
    
    

   
    var circleYOffset :CGFloat{
        if let motion = motion,motion.attitude.pitch > thresholdPitch{
            return CGFloat((motion.attitude.pitch - thresholdPitch) * 600.0 / .pi)
        }
        return 0
    }

//    This computed property determines how much the white circle should be offset in the Y-direction based on the device's pitch.
//
//    If the pitch exceeds the threshold, the circle's Y offset is computed by subtracting the threshold from the current pitch and scaling it.
    var body: some View {
        ZStack{
            Image(.NFT).resizable().scaledToFill()
                .frame(width: 300, height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 0)
                .rotation3DEffect(
                    .init(degrees: rotation.x),
                                          axis: (x: 1.0, y: 0.0, z: 0.0)
                )
                .rotation3DEffect(
                    .init(degrees: rotation.y),
                                          axis: (x: 0.0, y: 1.0, z: 0.0)
                )
            Circle().frame(width: 70, height: 70).foregroundStyle(.white.opacity(0.6))
                .blur(radius: 40)
                .offset(x: motion != nil ? CGFloat(motion!.gravity.x * 400 ) : 0 , y: circleYOffset)
//            400 is how fast or how much movement you want. I chose 400 only so that it will be easy to see in the video. All you have to do is manipulate the numbers and create a movement that suits you.
            
                .mask {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 300, height: 300)
                        .rotation3DEffect(
                            .init(degrees: rotation.x),
                            axis: (x: 1, y: 0, z: 0)
                        )
                        .rotation3DEffect(
                            .init(degrees: rotation.y),
                            axis: (x: 0, y: 1, z: 0)
                        )
                }
            
//            I created a mask so that a white circle will always be present inside an image, and the mask must have the same rotation3DEffect in order for it to be synchronized with movement and image.
            
        }
        .onAppear{
            if  motionManager .isDeviceMotionAvailable{
                self.motionManager.deviceMotionUpdateInterval = 1.0 / 60.0
                self.motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { (data,error) in
                    if let validData = data{
                        self.motion = validData
                    }
                }
            }
            
        }
        //        This section sets up the motion updates when the view appears. It checks if device motion updates are available, sets the update interval, and then starts getting updates. The motion data is then stored in the motion state variable, which triggers a view update.
    }
}

#Preview {
    ContentView()
}
