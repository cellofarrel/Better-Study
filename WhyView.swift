import SwiftUI

struct CustomWhyTitleView: View {
    var body: some View {
        Text("Why this app exist")
            .font(.callout)
            .bold()
            .foregroundColor(.primary)
    }
}

struct WhyView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Short Backstory")
                        .font(.title)
                        .bold()
                        .foregroundColor(.primary)
                        .padding(.bottom, 10)

                    Text("As a first-year computer science student, I wanted to succeed, but some days, just getting out of bed felt impossible. My mind buzzed with worry, and that made it so hard to concentrate. It wasn't just the coursework; it was everything.  Sometimes, it seemed like taking care of myself meant failing my classes, and trying to keep up with my studies meant my mental health took a nosedive. It felt like a lose-lose battle.")
                        .font(.body)
                        .padding(.bottom, 10)

                    Text("What I feel and my fix to it")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 10)

                    Text("The worse I felt, the harder it was to focus. It wasn't about being lazy or unmotivated – the simplest tasks would take hours, and the self-doubt became deafening. But on the good days, when my mind was clear, everything clicked. I'd code for hours, problem-solving felt effortless, and I actually felt like I was getting somewhere. That's when I realized mental health wasn't just about feeling okay; it was the key to unlocking my potential as a student. I started looking for solutions, ways to reduce stress, affirmations to fight that inner critic, and tools to manage my time when my brain felt scattered. That search led me to create this app, because if I struggled this much, I know others must too. I want anyone battling their mental health to know it doesn't have to control their studies – there are ways to fight back and find success.")
                        .font(.body)
                        .padding(.bottom, 10)

                    Text("My research and what data says")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 10)

                    Text("As I dug deeper, I wasn't just struggling alone. The research painted a grim picture – mental health issues were rampant among students, with overwhelming statistics like 77% experiencing significant distress. It wasn't just about feeling down; this was tied to academic performance, focus, and long-term well-being. Left unaddressed, it could spiral into serious complications, impacting not just our grades but our entire future. This wasn't a problem I could ignore anymore.")
                        .font(.body)
                        .padding(.bottom, 10)

                    Text("My Wish and what my app will try to do")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 10)

                    Text("My biggest wish is that anyone feeling overwhelmed like I did can find support within this app.  Even if it's a small step, every positive change matters. That's why my app focuses on the core issues – better sleep, a safe outlet for journaling, calming breathing exercises to fight anxiety, a place to  track goals, and those much-needed affirmations to boost self-belief. It's also about giving students the tools to reclaim their focus. This isn't about a magic cure, but about building a toolkit to manage those tough days and unlock the potential we all have within us.")
                        .font(.body)
                        .padding(.bottom, 10)

                    Text("YOU MATTER, dont give up, and i believe in you <3")
                        .font(.body)
                        .bold()
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

struct WhyView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
    }
}
