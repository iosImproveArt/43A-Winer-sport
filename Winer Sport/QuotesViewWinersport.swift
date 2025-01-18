

import SwiftUI

struct QuotesViewWinersport43: View {
    let quotes: [String: String] = [
        "The only way to prove you are a good sport is to lose." : "Ernie Banks",
        "Success is where preparation and opportunity meet." : "Bobby Unser",
        "Champions keep playing until they get it right." : "Billie Jean King",
        "The more difficult the victory, the greater the happiness in winning." : "Pelé",
        "Do not let what you cannot do interfere with what you can do." : "John Wooden",
        "Hard work beats talent when talent doesn’t work hard." : "Tim Notke",
        "Pain is temporary. Quitting lasts forever." : "Lance Armstrong",
        "A trophy carries dust. Memories last forever." : "Mary Lou Retton",
        "The harder the battle, the sweeter the victory." : "Les Brown",
        "You miss 100% of the shots you don’t take." : "Wayne Gretzky",
        "Sports do not build character. They reveal it." : "Heywood Broun",
        "It’s not whether you get knocked down; it’s whether you get up." : "Vince Lombardi",
        "Persistence can change failure into extraordinary achievement." : "Matt Biondi",
        "Never let the fear of striking out keep you from playing the game." : "Babe Ruth",
        "Run when you can, walk if you have to, crawl if you must; just never give up." : "Dean Karnazes",
        "An athlete cannot run with money in his pockets. He must run with hope in his heart and dreams in his head." : "Emil Zátopek",
        "Set your goals high, and don’t stop till you get there." : "Bo Jackson",
        "Some people want it to happen, some wish it would happen, others make it happen." : "Michael Jordan",
        "Winning isn’t everything, but wanting to win is." : "Arnold Palmer",
        "Strength doesn’t come from what you can do. It comes from overcoming the things you once thought you couldn’t." : "Rikki Rogers",
        "You are never a loser until you quit trying." : "Mike Ditka",
        "Don’t count the days; make the days count." : "Muhammad Ali",
        "Gold medals aren’t really made of gold. They’re made of sweat, determination, and a hard-to-find alloy called guts." : "Dan Gable",
        "You’re never beaten until you admit it." : "George S. Patton",
        "It’s not the will to win that matters—everyone has that. It’s the will to prepare to win that matters." : "Paul Bryant",
        "Age is no barrier. It’s a limitation you put on your mind." : "Jackie Joyner-Kersee",
        "A champion is afraid of losing. Everyone else is afraid of winning." : "Billie Jean King",
        "Excellence is not a singular act but a habit. You are what you do repeatedly." : "Shaquille O’Neal",
        "Success is not measured by money or power or social rank. Success is measured by your discipline and inner peace." : "Mike Ditka",
        "Don’t practice until you get it right. Practice until you can’t get it wrong." : "Unknown",
        "Sports serve society by providing vivid examples of excellence." : "George F. Will",
        "If you can believe it, the mind can achieve it." : "Ronnie Lott",
        "You can’t put a limit on anything. The more you dream, the farther you get." : "Michael Phelps",
        "Adversity causes some men to break; others to break records." : "William Arthur Ward",
        "Always make a total effort, even when the odds are against you." : "Arnold Palmer",
        "You have to do something in your life that is honorable and not cowardly if you are to live in peace with yourself." : "Larry Brown",
        "Today I will do what others won’t, so tomorrow I can accomplish what others can’t." : "Jerry Rice",
        "Success is no accident. It is hard work, perseverance, learning, studying, sacrifice, and most of all, love of what you are doing." : "Pelé",
        "In sports, you are more in control of your destiny than you are in other aspects of life." : "Billie Jean King",
        "The strength of the team is each individual member. The strength of each member is the team." : "Phil Jackson",
        "Work hard in silence. Let your success make the noise." : "Frank Ocean",
        "Victory is in having done your best. If you’ve done your best, you’ve won." : "Bill Bowerman",
        "You don’t win once in a while; you don’t do things right once in a while; you do them right all the time. Winning is a habit." : "Vince Lombardi",
        "Champions are made from something they have deep inside them—a desire, a dream, a vision." : "Muhammad Ali",
        "What you lack in talent can be made up with desire, hustle, and giving 110% all the time." : "Don Zimmer",
        "When you win, say nothing. When you lose, say less." : "Paul Brown",
        "It never gets easier. You just get better." : "Unknown"
    ]
    
    @State var timer: Timer?
    @State var selectedQuote: Dictionary<String, String>.Element? = ("", "")
    
    var name: String = "Default Name"
    var age: Int = 0
    var isActive: Bool = false
    var scores: [Int] = [10, 20, 30]
    var createdDate: Date = Date()
    
    // Функції
    func printDetails() {
        print("Name: \(name), Age: \(age), Active: \(isActive)")
    }
    
    mutating func incrementAge(by years: Int) {
        age += years
    }
    
    func averageScore() -> Double {
        guard !scores.isEmpty else { return 0.0 }
        let total = scores.reduce(0, +)
        return Double(total) / Double(scores.count)
    }
    
    mutating func toggleActiveState() {
        isActive.toggle()
    }
    
    func isAdult() -> Bool {
        return age >= 18
    }
    
    func greeting() -> String {
        return "Hello, \(name)! Welcome back!"
    }
    
    mutating func addScore(_ newScore: Int) {
        scores.append(newScore)
    }
    
    func formatCreatedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: createdDate)
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            Spacer()
            
            if let selectedQuote = selectedQuote {
                HStack {
                    Text("\"\(selectedQuote.key)\"")
                        .withFontWWinsport(size: 22, weight: .semibold)
                        .padding(.bottom, 40)
                    
                    Spacer()
                }.padding(.horizontal)
                Text("- \(selectedQuote.value)")
                    .withFontWWinsport(size: 16.5, weight: .semibold, color: .hex("FEE600"))
                    .padding(.trailing, 20)
            }
            
            Spacer()
            
            NavigationLink {
                PrivacyViewWinersport43(showLoading: .constant(true), fromMainView: true)
            } label: {
                Text("Privacy Policy")
                    .withFontWWinsport(size: 18, weight: .light, color: .white)
            }.frame(maxWidth: .infinity)
                .padding(.bottom)
        }.onAppear {
            selectedQuote = quotes.randomElement()!
            timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { _ in
                withAnimation(.easeInOut(duration: 0.6)) {
                    selectedQuote = nil
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    withAnimation(.easeInOut(duration: 1)) {
                        selectedQuote = quotes.randomElement()!
                    }
                }
            })
        }
        .onDisappear {
            timer?.invalidate()
            timer = nil
        }
    }
}

#Preview {
    ContentViewWinersport43(showLoading: false, selectedTab: .quotes)
}

