import SwiftUI
import AVFoundation

struct BreathingView: View {
    @State private var isBreathingIn = false
    @State private var scale: CGFloat = 1.0
    @State private var isExerciseRunning = false
    @State private var timer: Timer?
    @State private var startTime: Date?
    @State private var elapsedTime: TimeInterval = 0
    
    var audioPlayer: AVAudioPlayer?
    
    init() {
        let musicFile = Bundle.main.path(forResource: "breathe", ofType: "mp3")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicFile!))
            audioPlayer?.numberOfLoops = -1 
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        ZStack {
            backgroundView
            
            VStack {
                Text(isBreathingIn ? "Breathe In" : "Breathe Out")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding()
                
                Text("Exercise Time: \(formatTimeInterval(elapsedTime))")
                
                Circle()
                    .fill(Color("BreathingCircle"))
                    .frame(width: 200, height: 200)
                    .scaleEffect(scale)
                
                Button(action: {
                    toggleExercise()
                }) {
                    Text(isExerciseRunning ? "Stop Exercise" : "Start Breathing")
                }
                .padding()
            }
        }
        .onAppear {
            audioPlayer?.play()
        }
        .onDisappear {
            audioPlayer?.stop()
            timer?.invalidate()
            timer = nil
            startTime = nil
            elapsedTime = 0
        }
    }
    
    var backgroundView: some View {
        ZStack {
            Color(isBreathingIn ? "BreathingInBackground" : "BreathingOutBackground")
                .ignoresSafeArea()
            
            LinearGradient(colors: [
                isBreathingIn ? .cyan.opacity(0.2) : .blue.opacity(0.2),
                isBreathingIn ? .cyan.opacity(0.6) : .blue.opacity(0.6)],
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                .animation(.linear(duration: 8).repeatForever(autoreverses: true), value: isBreathingIn)
        }
    }
    
    func toggleExercise() {
        isExerciseRunning.toggle()
        if !isExerciseRunning {
            timer?.invalidate()
            timer = nil
            scale = 1.0
            startTime = nil
            elapsedTime = 0
        } else {
            startBreathingAnimation()
        }
    }
    
    func startBreathingAnimation() {
        startTime = Date()
        timer = Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 2)) {
                scale = isBreathingIn ? 1.2 : 0.8
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isBreathingIn.toggle()
            }
        }
        
        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if let startTime = startTime {
                elapsedTime = Date().timeIntervalSince(startTime)
            }
        }
    }
    
    func formatTimeInterval(_ interval: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: interval) ?? ""
    }
}

struct BreathingView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingView()
    }
}
