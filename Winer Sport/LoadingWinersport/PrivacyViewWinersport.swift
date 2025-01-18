

import SwiftUI

struct PrivacyViewWinersport43: View {
    @AppStorage("firstInApp") var firstInApp = true
    @Environment(\.dismiss) var dismiss
    @Binding var showLoading: Bool
    var fromMainView: Bool = false
    var jnir = 235
    @AppStorage("urlString") var urlString = ""
    
    var bg: Color {
        urlString.isEmpty ? Color.hex("#331E49"): .black
    }
    
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
        VStack {
            if urlString.isEmpty && fromMainView {
                HStack(spacing: 25) {
                    Button {
                        AppDelegate.orientationLock = .portrait
                        showLoading = false
                        dismiss()
                    } label: {
                        Image(systemName: "return.left")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 30)
                            .foregroundColor(.white)
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .overlay {
                        Text("Privacy Policy")
                            .withFontWWinsport(size: 33, weight: .bold)
                    }
                    .padding([.top, .leading])
                    
            }
            
            WebViewContainer(urlString: urlString)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
                .padding(.top, 7)
                .padding(.bottom,  1)
                .background(bg)
            
            if urlString.isEmpty && !fromMainView {
                HStack {
                    Button {
                        AppDelegate.orientationLock = .portrait
                        showLoading = false
                        firstInApp = false
                        dismiss()
                    } label: {
                        Image("profile.save")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay {
                                Text("Accept")
                                    .withFontWWinsport(size: 23, weight: .regular, color: .hex("3B0551"))
                            }
                    }
                   
                    Spacer()
                    
                    Button {
                        AppDelegate.orientationLock = .portrait
                        showLoading = false
                        firstInApp = false
                        dismiss()
                    } label: {
                        Image("profile.save")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay {
                                Text("Reject")
                                    .withFontWWinsport(size: 23, weight: .regular, color: .hex("3B0551"))
                            }
                    }
                    
                }.padding([.horizontal, .bottom])
            }
        }
        .background(bg)
        .onChange(of: urlString) { new in
            if urlString == "error" {
                showLoading = false
                dismiss()
            }
        }
        .navigationBarBackButtonHidden()
            .navigationTitle("")
                    .navigationBarHidden(true)
    }
}

#Preview {
    PrivacyViewWinersport43(showLoading: .constant(true), fromMainView: false)
}
