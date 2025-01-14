


import SwiftUI

struct HomeViewWinersport: View {
    @AppStorage("secondsWaste") var secondsWaste = 0
    @AppStorage("wasTrained") var wasTrained = false
    
    @AppStorage("favourite") var favourite = ""
    
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
        ScrollView {
                VStack {
                    NavigationLink {
                        TrainingViewWinersport(sportType: .cricket)
                    } label: {
                        Image("cricket.label")
                            .overlay {
                                Image("block.label")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .opacity(wasTrained ? 1: 0)
                            }
                    }.disabled(wasTrained)
                    
                    NavigationLink {
                        TrainingViewWinersport(sportType: .golf)
                    } label: {
                        Image("golf.label")
                            .overlay {
                                Image("block.label")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .opacity(wasTrained ? 1: 0)
                            }
                    }.disabled(wasTrained)
                    
                    NavigationLink {
                        TrainingViewWinersport(sportType: .basketball)
                    } label: {
                        Image("basketball.label")
                            .overlay {
                                Image("block.label")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .opacity(wasTrained ? 1: 0)
                            }
                    }.disabled(wasTrained)
                    
                    NavigationLink {
                        TrainingViewWinersport(sportType: .handball)
                    } label: {
                        Image("handball.label")
                            .overlay {
                                Image("block.label")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .opacity(wasTrained ? 1: 0)
                            }
                    }.disabled(wasTrained)
                    
                    NavigationLink {
                        TrainingViewWinersport(sportType: .tennis)
                    } label: {
                        Image("tennis.label")
                            .overlay {
                                Image("block.label")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .opacity(wasTrained ? 1: 0)
                            }
                    }.disabled(wasTrained)
                }.padding(.horizontal, 8)
                    .padding(.top)
                    .padding(.horizontal, -12)
            
                NavigationLink {
                    TrainingViewWinersport(sportType: SportTypes(rawValue: favourite) ?? .basketball
                    )
                } label: {
                    Image("favourite.workout")
                }.padding(.vertical)
                    .disabled(favourite == "")
                    .grayscale(favourite == "" ? 1 : 0)
                
                statsView
                    .padding(.bottom)
                Spacer()
        }.scrollIndicators(.hidden)
    }
    
    private var statsView: some View {
        VStack(spacing: isSEWinsport ? 12: 20) {
            HStack {
                Spacer()
                
                VStack {
                    Image("workouts.label")
                    Image("homefield.label")
                        .overlay {
                            Text(wasTrained ? "1": "0")
                                .withFontWWinsport(size: 22.66, weight: .regular)
                        }
                }
                
                Spacer()
                
                VStack {
                    Image("workouttime.label")
                    Image("homefield.label")
                        .overlay {
                            Text("\(secondsWaste / 60) min")
                                .withFontWWinsport(size: 22.66, weight: .regular)
                        }
                }
                
                Spacer()
            }
            
            HStack {
                Spacer()
                
                VStack {
                    Image("lastworkout.label")
                    Image("homefield.label")
                        .overlay {
                            Text(wasTrained ? formattedDateString(): "-")
                                .withFontWWinsport(size: 22.66, weight: .regular)
                        }
                }
                
                Spacer()
                
                VStack {
                    Image("rating.label")
                    Image("homefield.label")
                        .overlay {
                            Text(wasTrained ? "976/1000": "-/1000")
                                .withFontWWinsport(size: 22.66, weight: .regular)
                        }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentViewWinersport(showLoading: false, selectedTab: .home)
}


enum Sports: String {
    case cricket = "Cricket"
    case golf = "golf"
    case tennis = "tennis"
    case basketball = "Basketball"
    case handball = "handball"
    case pilates = "Pilates"
    case stretch = "Stretch"
}
