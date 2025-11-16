import SwiftUI

struct Sidebar: View {

    var body: some View {
        List {
            Section(header: Text("Better Study")
                .font(.largeTitle).bold()
                .foregroundColor(.primary)
            ) {
            }
            NavigationLink(destination: WhyView()) {
                Text("Why?")
            }
            Section(header: Text("Focus Enchancement")) {
                NavigationLink(destination: OverviewView()) {
                    Text("Getting ready")
                }
                NavigationLink(destination: PomodoroView()) {
                    Text("Pomodoro timer")
                }
            }
                Section(header: Text("Wellbeing Support")) {
                    NavigationLink(destination: SleepView()) {
                        Text("Sleep coach")
                    }
                    NavigationLink(destination: JournalView()) {
                        Text("Journal")
                    }
                    NavigationLink(destination: BreathingView()) {
                        Text("Breathing exercise")
                    }
            }
            Section(header: Text("Motivation Boost")) {
                NavigationLink(destination: GoalsView()) {
                    Text("Goals")
                }
                NavigationLink(destination: MentalAffirmationsView()) {
                    Text("Mental Affirmations")
                }
                NavigationLink(destination: StudyAffirmationsView()) {
                    Text("Study Affirmations")
                }
            }
        }
        .listStyle(.plain)
    }
}
    
    struct ContentView: View {
        var body: some View {
            NavigationView{
                Sidebar()
                HomeView()
                }
            }
        }
    

 
