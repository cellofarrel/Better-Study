import SwiftUI
import Combine

struct PomodoroView: View {
    enum TimerMode {
        case work, shortBreak, longBreak
    }

    @State private var timerMode: TimerMode = .work
    @State private var remainingTime: Int = 1500
    @State private var isTimerRunning: Bool = false
    @State private var pomodoroCount: Int = 1
    @State private var timerSubscription: AnyCancellable?

    var body: some View {
        VStack {
            Text(timerMode == .work ? "Pomodoro #\(pomodoroCount)" : "Break")
                .font(.title2)
                .padding(.bottom)
                .bold()

            Text(formatTime(seconds: remainingTime))
                .font(.system(size: 100, weight: .bold, design: .monospaced))
                .padding()

            HStack {
                Button(isTimerRunning ? "Pause" : "Start") {
                    isTimerRunning.toggle()
                }
                .frame(width: 100, height: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

                Button("Reset") {
                    resetTimer()
                }
                .frame(width: 100, height: 50)
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .onAppear {
            timerSubscription = Timer.publish(every: 1, on: .main, in: .common)
                .autoconnect()
                .sink { _ in
                    if isTimerRunning {
                        if remainingTime > 0 {
                            remainingTime -= 1
                        } else {
                            handleTimerEnd()
                        }
                    }
                }
        }
        .onDisappear {
            timerSubscription?.cancel()
        }
    }

    func formatTime(seconds: Int) -> String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds)
    }

    func handleTimerEnd() {
        isTimerRunning = false

        switch timerMode {
        case .work:
            pomodoroCount += 1
            timerMode = .shortBreak
            remainingTime = 300
        case .shortBreak:
            timerMode = .work
            remainingTime = 1500
        default:
            break
        }
    }

    func resetTimer() {
        isTimerRunning = false
        remainingTime = 1500
        timerMode = .work
        pomodoroCount = 1
    }
}

struct PomodoroView_Previews: PreviewProvider {
    static var previews: some View {
        PomodoroView()
    }
}
