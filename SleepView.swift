import SwiftUI

struct CustomSleepTitleView: View {
    var body: some View {
        Text("Better Sleep")
            .font(.callout)
            .bold()
            .foregroundColor(.primary)
    }
}

struct SleepView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Why?")
                        .font(.title)
                        .bold()
                        .foregroundColor(.primary)
                        .padding(.bottom, 15)

                    Text("prioritizing better sleep significantly impact their academic success and overall well-being. With enhanced memory, focus, and problem-solving skills, a well-rested mind tackle academic challenges with increased efficiency and perform better in their studies. Here's what you can do to achieve better sleep:")
                        .font(.body)
                        .padding(.bottom, 15)

                    Text("Consistent Sleep Schedule")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)

                    Text("Consistent sleep schedules are the foundation for good sleep because they help regulate your body's natural sleep-wake cycle. This cycle controls when you feel sleepy and alert. By having a consistent sleep schedule you reinforce this rhythm, making it easier to fall asleep at night and wake up feeling refreshed.")
                        .font(.body)
                        .padding(.bottom, 15)

                    Text("Comfortable Sleep Environment")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)

                    Text("A comfortable sleep environment is key for good sleep. Your bedroom should be dark, quiet, and cool to promote relaxation. Darkness helps your brain produce melatonin, a sleep-inducing hormone. Quiet minimizes disruptions, and a cool temperature aids your body's natural temperature drop for optimal sleep.")
                        .font(.body)
                        .padding(.bottom, 15)

                    Text("Limit daytime naps")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)

                    Text("Limiting daytime naps is important to prioritize a good night's sleep. While short naps (20-30 minutes) can be refreshing, longer naps can disrupt your nighttime sleep patterns. If you need a nap, keep it short and avoid napping late in the afternoon or evening, as this can make it harder to fall asleep at your regular bedtime.")
                        .font(.body)
                        .padding(.bottom, 15)

                    Text("Manage Stress")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)

                    Text("Schoolwork, extracurriculars, and social pressures can lead to stress. Don't forget to prioritize your wellbeing. Take a break, and consider techniques like: ")
                        .font(.body)
                        .padding(.bottom, 5)

                    HStack(spacing: 0) {
                        Text("* ")
                        NavigationLink(destination: JournalView()) {
                            Text("Journaling")
                        }
                    }

                    HStack(spacing: 0) {
                        Text("* ")
                        NavigationLink(destination: BreathingView()) {
                            Text("Breathing Exercise")
                        }
                    }

                    Text("* Talking with a counselor to help manage stress.")
                        .font(.body)
                        .padding(.bottom, 15)
                }
                .padding(.horizontal, geometry.size.width * 0.02)
                .padding(.vertical, 10)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        CustomSleepTitleView()
                    }
                }
            }
        }
    }
}

struct SleepView_Previews: PreviewProvider {
    static var previews: some View {
        SleepView()
    }
}
