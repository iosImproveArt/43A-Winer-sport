

import SwiftUI

struct KcalView: View {
    @AppStorage("kkcal") var kkcal = 0
    @State var showSheet = false
    
    @AppStorage("userAge") var userAge = 0
    @AppStorage("userWeight") var userWeight = 0
    
    @State var userAgeString = ""
    @State var userWeightString = ""
    
    @State var lifestyle = 0
    @State var sportgoal = 0
    
    @State private var showInfoSheet = false
    
    var body: some View {
    
        VStack {
            if kkcal == 0 {
                onboardView
            } else {
                HStack {
                    Text("Recommended daily calories per day:")
                        .withFont(size: 25, weight: .regular)
                        .padding(.trailing, 50)
                    
                    Spacer()
                    
                    Button {
                        showInfoSheet = true
                    } label: {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 26)
                            .foregroundColor(.red)
                            
                    }
                    
                    Spacer()
                    
                    Button {
                        showSheet = true
                    } label: {
                        Image("profile.link")
                    }
                }
                
                HStack(alignment: .bottom) {
                    Image("kcal.bg")
                        .overlay {
                            VStack {
                                Text("Calories")
                                    .withFont(size: 22, weight: .medium)
                                Spacer()
                                
                                Text(String(kkcal))
                                    .withFont(size: 23, weight: .thin, color: .black)
                                    .padding(.bottom, 25)
                            }
                        }
                    
                    Image("kcal.bg")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .overlay {
                            VStack {
                                Text("Fat")
                                    .withFont(size: 22, weight: .medium)
                                    .padding(.top, 3)
                                
                                Spacer()
                                
                                Text("\(Int(Double(kkcal / 4) * 0.2))gr")
                                    .withFont(size: 23, weight: .thin, color: .black)
                                    .padding(.bottom, 20)
                            }
                        }
                    
                    Image("kcal.bg")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .overlay {
                            VStack {
                                Text("Protein")
                                    .withFont(size: 22, weight: .medium)
                                    .padding(.top, 3)
                                Spacer()
                                
                                Text("\(Int(Double(kkcal / 4) * 0.3))gr")
                                    .withFont(size: 23, weight: .thin, color: .black)
                                    .padding(.bottom, 20)
                            }
                        }
                    
                    Image("kcal.bg")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .overlay {
                            VStack {
                                Text("Carbs")
                                    .withFont(size: 22, weight: .medium)
                                    .padding(.top, 3)
                                Spacer()
                                
                                Text("\(Int(Double(kkcal / 4) * 0.5))gr")
                                    .withFont(size: 23, weight: .thin, color: .black)
                                    .padding(.bottom, 20)
                            }
                        }
                }
                
                
                Image("kcal.table")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(alignment: .bottom) {
                        HStack {
                            Text("\(userWeight) kg")
                                .withFont(size: 23, weight: .medium)
                            
                            Spacer()
                            
                            Text("\(formattedDateString())")
                                .withFont(size: 23, weight: .regular)
                            
                            Spacer()
                            
                            Text("0%")
                                .withFont(size: 23, weight: .regular)
                        }.padding(.horizontal, 30)
                            .padding(.bottom, 10)
                    }
                
                Spacer()
            }
        }.grayscale(showInfoSheet ? 1: 0)
            .animation(.easeInOut, value: showInfoSheet)
        .sheet(isPresented: $showSheet) {
            ProfileViewWinersport()
                .presentationDetents([.fraction(0.9)])
        }
        .sheet(isPresented: $showInfoSheet) {
            infoSheet
        }
        .onChange(of: kkcal) { _ in
            showInfoSheet = true
        }
    }
    
    private var infoSheet: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Disclaimer")
                    .withFont(size: 40, weight: .bold)
                    .padding(.bottom)
                
                Text("The calorie calculation in this app is based on the Basal Metabolic Rate (BMR) formula for men:")
                    .withFont(size: 18, weight: .regular)
                
                Text("BMR = 66.4730 + (13.7516 × weight in kg) + (5.0033 × height in cm) – (6.7550 × age in years).")
                    .withFont(size: 18, weight: .semibold)
                    .padding(.vertical, 8)
                
                Text("This formula provides an estimate of daily caloric needs and may not be suitable for everyone. Please consult a healthcare professional before relying on these calculations to ensure they are appropriate for your individual health needs.")
                    .withFont(size: 18, weight: .regular)
                
                Text("This formula is derived from recognized medical and nutritional research:")
                    .withFont(size: 18, weight: .regular)
                    .padding(.bottom)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("- Harris JA, Benedict FG. \"A Biometric Study of Basal Metabolism in Man,\" Proceedings of the National Academy of Sciences, 1918.")
                        .withFont(size: 18, weight: .regular)
                    Link("Read Online (PDF)", destination: URL(string: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1680745/")!)
                    
                    Text("- Roza AM, Shizgal HM. \"The Harris Benedict equation reevaluated: resting energy requirements and the body cell maWinersport,\" American Journal of Clinical Nutrition, 1984.")
                        .withFont(size: 18, weight: .regular)
                    Link("Source on PubMed", destination: URL(string: "https://pubmed.ncbi.nlm.nih.gov/6741850/")!)
                    
                    Text("- For further reliable medical references, visit:")
                        .withFont(size: 18, weight: .regular)
                    Link("World Health Organization (WHO)", destination: URL(string: "https://www.who.int")!)
                    Link("National Institutes of Health (NIH)", destination: URL(string: "https://www.nih.gov")!)
                }
                .withFont(size: 18, weight: .regular, color: .blue)
            }
        }.background(3)
            .presentationDetents([.fraction(0.5)])
    }
    
    private var onboardView: some View {
        ScrollView {
            VStack {
                VStack {
                    Text("Age")
                        .withFont(size: 22, weight: .regular)
                        .padding(.horizontal)
                    TextField("Your Age...", text: $userAgeString)
                        .padding(.horizontal)
                        .padding(.vertical, 14)
                        .background {
                            Color.hex("331E49")
                        }
                        .cornerRadius(12)
                        .foregroundColor(.white)
                }
                
                VStack {
                    Text("Weight")
                        .withFont(size: 22, weight: .regular)
                        .padding(.horizontal)
                    
                    TextField("Your Weight...", text: $userWeightString)
                        .padding(.horizontal)
                        .padding(.vertical, 14)
                        .background {
                            Color.hex("331E49")
                        }
                        .cornerRadius(12)
                        .foregroundColor(.white)
                }
                
                
                
                VStack {
                    Text("Lifestyle")
                        .withFont(size: 26, weight: .light)
                    
                    VStack {
                        Button {
                            lifestyle = 1
                        } label: {
                            Image("kcal.chek.field")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .overlay {
                                    Text("Moderate")
                                        .withFont(size: 22.5, weight: .thin)
                                }
                                .overlay(alignment: .leading) {
                                    Image("kcal.chek.\(lifestyle == 1 ? "on": "off")")
                                        .padding(.leading)
                                }
                        }.frame(width: screen.width * 0.7)
                        
                        Button {
                            lifestyle = 2
                        } label: {
                            Image("kcal.chek.field")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .overlay {
                                    Text("Higth")
                                        .withFont(size: 22.5, weight: .thin)
                                }
                                .overlay(alignment: .leading) {
                                    Image("kcal.chek.\(lifestyle == 2 ? "on": "off")")
                                        .padding(.leading)
                                }
                        }.frame(width: screen.width * 0.7)
                        
                        Button {
                            lifestyle = 3
                        } label: {
                            Image("kcal.chek.field")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .overlay {
                                    Text("Very Low")
                                        .withFont(size: 22.5, weight: .thin)
                                }
                                .overlay(alignment: .leading) {
                                    Image("kcal.chek.\(lifestyle == 3 ? "on": "off")")
                                        .padding(.leading)
                                }
                        }.frame(width: screen.width * 0.7)
                        
                        Button {
                            lifestyle = 4
                        } label: {
                            Image("kcal.chek.field")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .overlay {
                                    Text("Intense")
                                        .withFont(size: 22.5, weight: .thin)
                                }
                                .overlay(alignment: .leading) {
                                    Image("kcal.chek.\(lifestyle == 4 ? "on": "off")")
                                        .padding(.leading)
                                }
                        }.frame(width: screen.width * 0.7)
                    }
                }
                
                VStack {
                    Text("Spoart goal")
                        .withFont(size: 26, weight: .light)
                    
                    Button {
                        sportgoal = 1
                    } label: {
                        Image("kcal.chek.field")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay {
                                Text("Weight again")
                                    .withFont(size: 22.5, weight: .thin)
                            }
                            .overlay(alignment: .leading) {
                                Image("kcal.chek.\(sportgoal == 1 ? "on": "off")")
                                    .padding(.leading)
                            }
                    }.frame(width: screen.width * 0.7)
                        
                    Button {
                        sportgoal = 2
                    } label: {
                        Image("kcal.chek.field")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay {
                                Text("Retention")
                                    .withFont(size: 22.5, weight: .thin)
                            }
                            .overlay(alignment: .leading) {
                                Image("kcal.chek.\(sportgoal == 2 ? "on": "off")")
                                    .padding(.leading)
                            }
                    }.frame(width: screen.width * 0.7)
                    
                    Button {
                        sportgoal = 3
                    } label: {
                        Image("kcal.chek.field")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay {
                                Text("Weight loss")
                                    .withFont(size: 22.5, weight: .thin)
                            }
                            .overlay(alignment: .leading) {
                                Image("kcal.chek.\(sportgoal == 3 ? "on": "off")")
                                    .padding(.leading)
                            }
                    }.frame(width: screen.width * 0.7)
                }
                
                
                Button {
                    guard chekAnswers() else { return }
                    
                    UserDefaults.standard.set(Int(userAgeString) ?? 0, forKey: "userAge")
                    UserDefaults.standard.set(Int(userWeightString) ?? 0, forKey: "userWeight")
                    
                    calculateCalories()
                } label: {
                    Text("Next")
                        .withFont(size: 18, weight: .medium, color: .hex("2E023F"))
                        .padding(.vertical, 11)
                        .padding(.horizontal, 30)
                        .background(Color.hex("FEE600"))
                        .cornerRadius(13.17)
                }.disabled(!chekAnswers())
                    .grayscale(!chekAnswers() ? 1: 0)
                    .padding(.top)
                
                if !chekAnswers() {
                    Text("Enter valid data.")
                        .withFont(size: 15, weight: .medium)
                        .padding(.bottom)
                }
            }
        }
    }
    
    func chekAnswers() -> Bool {
        guard lifestyle != 0 else { return false }
        guard sportgoal != 0 else { return false }
        guard Array(1...99).contains(Int(userAgeString) ?? 0) else { return false }
        guard Array(1...300).contains(Int(userWeightString) ?? 0) else { return false }
        return true
    }
    
    func calculateCalories()  {
        guard let age = Int(userAgeString), let weight = Double(userWeightString) else {
            return
        }
        
        // Базова метаболічна швидкість (BMR)
        let bmr = 66.4730 + (13.7516 * weight) + (5.0033 * 175) - (6.7550 * Double(age))// Приблизна формула для чоловіка з фіксованим зростом 170 см
        
        // Коефіцієнт активності
        let activityMultiplier: Double
        switch lifestyle {
        case 1: activityMultiplier = 1.2 // Moderate
        case 2: activityMultiplier = 1.375 // High
        case 3: activityMultiplier = 1.1 // Very low
        case 4: activityMultiplier = 1.55 // Intense
        default: activityMultiplier = 1.0
        }
        
        // Корекція для спортивної цілі
        let goalMultiplier: Double
        switch sportgoal {
        case 1: goalMultiplier = 1.1 // Набір ваги
        case 2: goalMultiplier = 1.0 // Утримання ваги
        case 3: goalMultiplier = 0.9 // Схуднення
        default: goalMultiplier = 1.0
        }
        
        // Остаточний розрахунок калорій
        let dailyCalories = bmr * activityMultiplier * goalMultiplier
        kkcal = Int(dailyCalories)
    }
    
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
}

#Preview {
    ContentViewWinersport(showLoading: false, selectedTab: .profile)
}
