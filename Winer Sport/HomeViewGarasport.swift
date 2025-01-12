


import SwiftUI

struct HomeViewGarasport: View {
    @AppStorage("secondsWaste") var secondsWaste = 0
    @AppStorage("wasTrained") var wasTrained = false
    
    @AppStorage("favourite") var favourite = ""
    
    var erverv = 134134
    var ceqfcwrefc = 13413.13413
    func qrevqrvrg() -> CGFloat {
        return 314134.1343
    }
    func vwrwrqrf() {
        print("wrv")
        print(134)
    }
    var wtywtyw = [24524:"wrvwr"]
    var twtyw5gw5tgw = 4524
    
    
    var body: some View {
        ScrollView {
                VStack {
                    NavigationLink {
                        TrainingViewGarasport(sportType: .cricket)
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
                        TrainingViewGarasport(sportType: .golf)
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
                        TrainingViewGarasport(sportType: .basketball)
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
                        TrainingViewGarasport(sportType: .handball)
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
                        TrainingViewGarasport(sportType: .tennis)
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
                    TrainingViewGarasport(sportType: SportTypes(rawValue: favourite) ?? .basketball
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
        VStack(spacing: isSE ? 12: 20) {
            HStack {
                Spacer()
                
                VStack {
                    Image("workouts.label")
                    Image("homefield.label")
                        .overlay {
                            Text(wasTrained ? "1": "0")
                                .withFont(size: 22.66, weight: .regular)
                        }
                }
                
                Spacer()
                
                VStack {
                    Image("workouttime.label")
                    Image("homefield.label")
                        .overlay {
                            Text("\(secondsWaste / 60) min")
                                .withFont(size: 22.66, weight: .regular)
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
                                .withFont(size: 22.66, weight: .regular)
                        }
                }
                
                Spacer()
                
                VStack {
                    Image("rating.label")
                    Image("homefield.label")
                        .overlay {
                            Text(wasTrained ? "976/1000": "-/1000")
                                .withFont(size: 22.66, weight: .regular)
                        }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentViewGarasport(showLoading: false, selectedTab: .home)
}


enum Sports: String {
    case cricket = "Cricket"
    case golf = "golf"
    case tennis = "tennis"
    case basketball = "Basketball"
    case handball = "handball"
    case fitneGarasport = "FitneGarasport"
    case yoga = "Yoga"
    case pilates = "Pilates"
    case stretch = "Stretch"
}
