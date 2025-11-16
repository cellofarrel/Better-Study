import SwiftUI

struct HomeView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Spacer()
                
                VStack(alignment: .leading, spacing: 30) {
                    Text("Better Study, your ultimate study companion! Say goodbye to distractions and hello to laser-focused study sessions with our tools. Prioritize your focus and wellbeing with Better Study – nurture your mind and reach your goals.")
                        .padding(.bottom, 20)
                        .font(.title3)
                    
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blue)
                            .frame(height: 150)
                        
                        VStack(alignment: .leading) {
                            Text("Focus Enhancement")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.bottom, 2)
                            Text("Your go-to for sharpening concentration skills and defeating distractions effortlessly. Follow our curated guide to boost focus and maximize study efficiency, while seamlessly integrating the Pomodoro Technique with our intuitive timer for optimal productivity.")
                                .font(.callout)
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                    
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.green)
                            .frame(height: 150)
                        
                        VStack(alignment: .leading) {
                            Text("Wellbeing Support")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.bottom, 2)
                            Text("Your personal Sleep Coach, Journal, and Breathing Exercise companion. Prioritize your mental and physical health with our app's Wellbeing Support feature. our Sleep Coach and breathing exercises, guides you towards optimal rest and enchanced mental clarity")
                                .font(.callout)
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                    
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.orange)
                            .frame(height: 150)
                        
                        VStack(alignment: .leading) {
                            Text("Motivational Boost")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.bottom, 2)
                            Text("Visualize your progress, celebrate your wins, and nourish your mind. Our intuitive tracker helps you stay on top of your goals nomatter how big or small it is, while our affirmations empower you with positivity and resilience to keep you going.")
                                .font(.callout)
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                }
                .padding(.horizontal, geometry.size.width * 0.02)
                
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
