import SwiftUI

struct MentalAffirmationsView: View {
    let topics = ["-", "Depression", "Anxiety", "PTSD", "Loneliness"]

    @State private var selectedTopic = ""
    @State private var selectedAffirmation = ""

    let mentalAffirmations = [
        "Depression": [
            "I am worthy of love and happiness.",
            "My feelings are valid, and it's okay to not feel okay sometimes.",
            "I am stronger than I think.",
            "I am capable of overcoming challenges.",
            "Small steps are still progress.",
            "I deserve to feel joy.",
            "I am allowed to ask for help when I need it.",
            "There are people who care about me.",
            "I am resilient, and I will get through this.",
            "My worth is not defined by my depression.",
            "I will find things that bring me light again.",
            "This is temporary, and better days are coming.",
            "I am gentle with myself during difficult times.",
            "It's okay to rest and take time to heal.",
            "I am proud of myself for getting through each day.",
            "I am loved and supported.",
            "My best is enough.",
            "I choose to focus on the positive.",
            "I am working towards a brighter future.",
            "I believe in my ability to feel better."
        ],
        "Anxiety": [
            "I am safe and in control.",
            "I can handle whatever comes my way.",
            "My worries do not define me.",
            "I am capable of calming my mind and body.",
            "This feeling will pass.",
            "I release tension with every breath I take.",
            "I choose peace over worry.",
            "I am stronger than my anxiety.",
            "I trust my ability to cope.",
            "I am present in this moment.",
            "It's okay to feel anxious, and it doesn't make me weak.",
            "I can challenge my anxious thoughts.",
            "I am learning to manage my anxiety, one day at a time.",
            "I am patient with myself.",
            "I focus on what I can control.",
            "I celebrate small victories over anxiety.",
            "I am more than my fears.",
            "I choose courage over fear.",
            "I am grounded and centered.",
            "I am surrounded by love and support."
        ],
        "PTSD": [
            "I am safe now.",
            "The past does not control me.",
            "My trauma does not define me.",
            "I am a survivor, and I am strong.",
            "My feelings are valid and understandable.",
            "I am allowed to heal at my own pace.",
            "It's okay to not be okay all the time.",
            "I am learning to cope with triggers.",
            "I deserve to feel happiness and peace.",
            "I can reclaim my power.",
            "I will not let my trauma break me.",
            "I am building a life worth living.",
            "I am patient and kind with myself.",
            "I choose hope over fear.",
            "I am capable of overcoming challenges.",
            "I am finding my strength every day.",
            "There are people who understand and support me.",
            "I am worthy of love and happiness.",
            "Healing is possible, and I am on my way.",
            "I believe in a brighter future for myself."
        ],
        "Loneliness": [
            "I am worthy of connection and belonging.",
            "I am building meaningful relationships.",
            "I am open to new friendships and connections.",
            "Even when I'm alone, I am not unloved.",
            "I am capable of reaching out to others.",
            "I deserve to feel supported.",
            "I am loved, even if it doesn't feel like it right now.",
            "I am interesting and valuable.",
            "I have something unique to offer the world.",
            "I am actively seeking my community.",
            "Loneliness is temporary.",
            "I am kind and compassionate towards myself.",
            "I can enjoy my own company.",
            "I am making steps towards a life filled with connection.",
            "I am reaching out for help when I need it.",
            "I am focusing on building genuine relationships.",
            "I am patient with myself as I navigate social connections.",
            "I am not alone in this.",
            "I am creating a space where I feel loved and accepted.",
            "I believe in my ability to find my people."
        ]
    ]

    var body: some View {
        VStack {
            Text("Mental Health Affirmations")
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
                if let topicAffirmations = mentalAffirmations[selectedTopic] {
                    selectedAffirmation = topicAffirmations.randomElement() ?? ""
                }
            }
            .padding()
        }
    }
}

struct MentalAffirmationsView_Previews: PreviewProvider {
    static var previews: some View {
        MentalAffirmationsView()
    }
}
