import SwiftUI

struct CustomOverviewTitleView: View {
    var body: some View {
        Text("Focus Enchancement")
            .font(.callout)
            .bold()
            .foregroundColor(.primary)
    }
}

struct OverviewView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Getting Ready")
                        .font(.title)
                        .bold()
                        .foregroundColor(.primary)
                        .padding(.bottom, 10)

                    Text("Reducing distractions is crucial for effective learning. By minimizing interruptions, learners can fully concentrate on the material, leading to better understanding and retention, ultimately enhancing learning outcomes. Here’s what u can do to reduce distractions:")
                        .font(.body) // Consider using a scalable font style
                        .padding(.bottom, 10)

                    Text("Find a comfortable and peaceful environment")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 10)

                    Text("A comfortable and peaceful environment is essential for effective learning, reducing distractions, and promoting concentration. It also facilitates better memory formation and positively impacts mood and motivation, ultimately improving academic performance.")
                        .font(.body) // Consider using a scalable font style
                        .padding(.bottom, 10)

                    Text("Turn on Do Not Disturb")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 10)

                    Text("A comfortable and peaceful environment is essential for effective learning, reducing distractions, and promoting concentration. It also facilitates better memory formation and positively impacts mood and motivation, ultimately improving academic performance.")
                        .font(.body) // Consider using a scalable font style
                        .padding(.bottom, 10)

                    Text("Avoid multitasking")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 10)

                    Text("Avoiding multitasking is essential for focused studying, as it allows for deep concentration and effective retention of study material. By focusing on one task at a time, productivity is optimized, leading to improved academic performance.")
                        .font(.body) // Consider using a scalable font style
                        .padding(.bottom, 10)

                    NavigationLink(destination: PomodoroView()) {
                        Text("Use our Pomodoro Timer")
                            .font(.title2)
                            .bold()
                            .padding(.bottom, 10)
                    }

                    Text("Using a Pomodoro timer enhances study focus by breaking sessions into manageable intervals, promoting deep concentration and optimal productivity. This method improves retention of study material and ultimately boosts academic performance.")
                        .font(.body) // Consider using a scalable font style
                        .padding(.bottom, 10)
                }
                .padding(.horizontal, geometry.size.width * 0.02)
                .padding(.vertical, 10)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        CustomOverviewTitleView()
                    }
                }
            }
        }
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
    }
}
