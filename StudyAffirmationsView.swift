import SwiftUI

struct StudyAffirmationsView: View {
    let topics = ["-", "Long-Term Vision", "Self-Care & Mindset", "Test & Exam Confidence", "Facing Challenges", "General Motivation"]

    @State private var selectedTopic = ""
    @State private var selectedAffirmation = ""

    let studyAffirmations = [
        "Long-Term Vision": [
            "I am building a future I am passionate about.",
            "My education opens doors to endless possibilities.",
            "I have the power to make a positive impact on the world.",
            "I set ambitious goals and take action to achieve them.",
            "Every step I take brings me closer to my dreams.",
            "I embrace the unknown and trust my path.",
            "My voice and talents have a place in the world.",
            "I invest in myself because my future is limitless.",
            "My knowledge creates opportunities for success.",
            "I continuously learn, grow, and evolve.",
            "I believe in my ability to create the life I want.",
            "I embrace lifelong learning with enthusiasm.",
            "I surround myself with people who lift me higher.",
            "My potential inspires me to dream big.",
            "I take ownership of my education and my future.",
            "I am always working towards a better version of myself.",
            "I will use my education to make a difference.",
            "Obstacles are temporary; my vision is enduring.",
            "I will leave my mark on the world.",
            "My journey is unique, and I trust my path."
        ],
        "Self-Care & Mindset": [
            "I deserve rest and prioritize my well-being.",
            "Asking for help when I need it is a strength.",
            "I take breaks to recharge my mind and body.",
            "My emotional health is as important as my academics.",
            "I choose thoughts that empower and uplift me.",
            "I talk to myself with kindness and compassion.",
            "It's okay to say 'no' and set healthy boundaries.",
            "I believe in my potential and my inner strength.",
            "I am grateful for my body and all it does for me.",
            "I give myself permission to feel my emotions fully.",
            "I seek out healthy ways to manage stress.",
            "I make time for things that bring me joy.",
            "I am worthy of love, support, and respect.",
            "I release expectations of perfection.",
            "I nurture my creativity and allow myself to play.",
            "I am flexible and adapt to changes with grace.",
            "I prioritize healthy sleep and nourishing food.",
            "I forgive myself for past mistakes.",
            "I focus on progress, not perfection.",
            "I treat myself with the same kindness I show others."
       ],
        "Test & Exam Confidence": [
           "I have studied diligently, and I am prepared.",
           "I know the material, and I trust my recall.",
           "I focus my energy on doing my best.",
           "I visualize myself succeeding on my exams.",
           "I take deep breaths and remain calm.",
           "I approach challenges with a clear mind.",
           "I read directions carefully and manage my time wisely.",
           "I have confidence in my knowledge and abilities.",
           "I trust my preparation and instincts.",
           "I believe in my ability to perform well under pressure.",
           "One test does not define my worth.",
           "I am proud of how far I've come.",
           "I give myself credit for my hard work.",
           "I will tackle each question strategically.",
           "I can handle unexpected exam questions.",
           "I will stay focused until the very end.",
           "I will analyze my results and learn from them.",
           "I have the power to improve my performance.",
           "I celebrate my progress, not just my scores.",
           "I can achieve my academic goals."
       ],
       "Facing Challenges": [
           "Mistakes are my greatest teachers.",
           "I learn as much from failure as I do from success.",
           "Asking for help is a sign of strength.",
           "I trust my ability to problem-solve.",
           "I won't give up, even when things get tough.",
           "Setbacks are temporary; I will persevere.",
           "I find creative solutions to obstacles.",
           "I can ask for clarification when I don't understand.",
           "I can break down large tasks into smaller steps.",
           "Every challenge teaches me resilience.",
           "I believe in my ability to overcome any obstacle.",
           "My determination is stronger than any difficulty.",
           "I have the courage to step outside my comfort zone.",
           "I view setbacks as opportunities for growth.",
           "I give myself time to process challenging situations.",
           "I will not let one mistake define me.",
           "I take breaks when I need to recharge.",
           "I trust my instincts and stay true to myself.",
           "Difficult times will pass, and I will emerge stronger.",
           "I am not afraid to try again."
       ],
        "General Motivation": [
            "I am a gifted learner.",
            "I have a unique perspective to offer.",
            "My thoughts and ideas are valuable.",
            "I embrace challenges with a growth mindset.",
            "Learning excites me.",
            "My curiosity fuels my success.",
            "I actively participate in my education.",
            "I seek out knowledge beyond the classroom.",
            "I am committed to excellence.",
            "My determination drives me forward.",
            "I set goals and work diligently to achieve them.",
            "I am proud of my accomplishments, big and small.",
            "I find joy in the learning process.",
            "My voice matters in the classroom.",
            "I make positive contributions to my learning community.",
            "I surround myself with inspiring individuals.",
            "I welcome opportunities to collaborate with others.",
            "I am always expanding my knowledge.",
            "I view education as a lifelong journey.",
            "I am capable of extraordinary things."
            ]
    ]

    var body: some View {
        VStack {
            Text("Study Affirmations")
                .font(.largeTitle)
                .bold()
                .padding()
            
            Text("What are you struggling with right now?")
                .font(.title)
                .padding(.bottom)

            Picker("Topic", selection: $selectedTopic) {
                ForEach(topics, id: \.self) { topic in
                    Text(topic)
                        .padding()
                        .frame(maxWidth: .infinity)
                }
            }
            .pickerStyle(.wheel)

            Text(selectedAffirmation)
                .padding()
                .multilineTextAlignment(.center)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
                .frame(width: 900, height: 250)
                .font(.title)
                .bold()


            Button("New Affirmation") {
                if let topicAffirmations = studyAffirmations[selectedTopic] {
                    selectedAffirmation = topicAffirmations.randomElement() ?? ""
                }
            }
            .padding()
        }
    }
}

struct StudyAffirmationsView_Previews: PreviewProvider {
    static var previews: some View {
        StudyAffirmationsView()
    }
}
