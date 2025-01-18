
import SwiftUI

struct ProfileViewWinersport43: View {
    @Environment(\.dismiss) var dismiss
    @State var userPhoto = ""
    @State var userName = ""
    @State var userAge = ""
    @State var userWeight = ""
    
    @State var showActionSheetBB = false
    @State private var showImagePickerBB = false
    @State private var showCameraPickerBB = false
    @State var ev = false
    @FocusState var textfield
    @State var showAlert = false
    
    let fieldsColor = Color.hex("B35C5C")
    
    @State private var showList = false
    
    let listOfSports = ["football", "volleyball", "basketball", "golf", "swimming", "volleyball", "cycling", "gym", "boxing", "fencing", "cricket"]
    
    @AppStorage("secondsWaste") var secondsWaste = 0
    @AppStorage("wasTrained") var wasTrained = false
    @AppStorage("favourite") var favourite = ""
    @AppStorage("kkcal") var kkcal = 0
    @AppStorage("selectedSport") var selectedSport = "golf"
    
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
                HStack(alignment: .bottom) {
                    Button {
                        showActionSheetBB = true
                    } label: {
                        Group {
                            if userPhoto.isEmpty {
                                Image("user.label")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 120, maxHeight: 120)
                            } else {
                                Image(uiImage: UIImage(data: Data(base64Encoded: userPhoto)!)!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(Circle())
                                    .frame(maxWidth: 160, maxHeight: 160)
                            }
                        }.padding(.top)
                    }.onAppear {
                        userPhoto = UserDefaults.standard.string(forKey: "userPhoto") ?? ""
                        userName = UserDefaults.standard.string(forKey: "userName") ?? ""
                        userAge = UserDefaults.standard.string(forKey: "userAge") ?? ""
                        
                        userWeight = UserDefaults.standard.string(forKey: "userWeight") ?? ""
                    }.padding(.top, isSEWinsport ? 0: 30)
                    
                    Spacer()
                    
                        HStack(spacing: 8) {
                            
                            Image("textfield")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 40)
                                .overlay {
                                    TextField("Name", text: $userName)
                                        .padding(.horizontal, 15)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 6)
                                }
                                .padding(.trailing, 30)
                        }.padding(.bottom)
                }
                
                selectSportView
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("Age")
                        .withFontWWinsport(size: 22, weight: .regular)
                        .padding(.horizontal)
                    TextField("Your Age...", text: $userAge)
                        .padding(.horizontal)
                        .padding(.vertical, 14)
                        .background {
                            Color.hex("331E49")
                        }
                        .cornerRadius(12)
                        .foregroundColor(.white)
                }
                
                VStack(alignment: .leading) {
                    Text("Weight")
                        .withFontWWinsport(size: 22, weight: .regular)
                        .padding(.horizontal)
                    
                    TextField("Your Weight...", text: $userWeight)
                        .padding(.horizontal)
                        .padding(.vertical, 14)
                        .background {
                            Color.hex("331E49")
                        }
                        .cornerRadius(12)
                        .foregroundColor(.white)
                }.padding(.top)
                
                HStack {
                    Button {
                        guard isValidWeightAndAge(), !userPhoto.isEmpty else { showAlert = true; return }
                        UserDefaults.standard.set(userPhoto, forKey: "userPhoto")
                        UserDefaults.standard.set(userName, forKey: "userName")
                        UserDefaults.standard.set(userAge, forKey: "userAge")
                        UserDefaults.standard.set(userWeight, forKey: "userWeight")
                        showAlert = true
                    } label: {
                        Image("profile.save")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay {
                                Text("Save")
                                    .withFontWWinsport(size: 18, weight: .medium, color: .hex("2E023F"))
                            }
                    }
                    
                    Button {
                        UserDefaults.standard.set("", forKey: "userPhoto")
                        UserDefaults.standard.set("", forKey: "userName")
                        UserDefaults.standard.set("", forKey: "userAge")
                        UserDefaults.standard.set("", forKey: "userWeight")
                        userName = ""
                        userAge = ""
                        userPhoto = ""
                        userWeight = ""
                        selectedSport = "cricket"
                        secondsWaste = 0
                        wasTrained = false
                        favourite = ""
                        kkcal = 0
                    } label: {
                        Image("profile.save")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay {
                                Text("Delete")
                                    .withFontWWinsport(size: 18, weight: .medium, color: .hex("2E023F"))
                            }
                    }
                }
                .padding(.top)
            }.padding(.horizontal)
                .padding(.bottom)
            
        }.gradientTopAndBottom()
            .backgroundWinsport(3)
        .animation(.easeInOut, value: textfield)
        .actionSheet(isPresented: $showActionSheetBB) {
            ActionSheet(title: Text(""), buttons: [
                .default(Text("Camera")) {
                    showCameraPickerBB = true
                },
                .default(Text("Photo Library")) {
                    showImagePickerBB = true
                },
                .cancel() // Кнопка скасування
            ])
        }
        .overlay(alignment: .topLeading) {
            Button {
                dismiss()
            } label: {
                Image("arrow.back")
            }.padding(.leading, 5)
        }
        .sheet(isPresented: $showImagePickerBB) {
            ImagePickerViewBB(showImagePicker: self.$showImagePickerBB) { image in
                if let image = image {
                    if let compressedData = image.jpegData(compressionQuality: 0.01) {
                        self.userPhoto = compressedData.base64EncodedString()
                    }
                }
            }.edgesIgnoringSafeArea(.all)
        }
        .sheet(isPresented: $showCameraPickerBB) {
            CameraPickerView(showImagePicker: self.$showCameraPickerBB) { image in
                if let image = image {
                    if let compressedData = image.jpegData(compressionQuality: 0.01) {
                        self.userPhoto = compressedData.base64EncodedString()
                    }
                }
            }.edgesIgnoringSafeArea(.all)
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(isValidWeightAndAge() ? "Saved!": "Oops!"),
                message: Text(isValidWeightAndAge() ? "Successful data saving":  "Please enter a valid age or weight (photo)."),
                dismissButton: .default(Text("OK"))
            )
        }
        
    }
    
    private var selectSportView: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Favorite Sport")
                .withFontWWinsport(size: 22, weight: .regular)
                .padding(.horizontal)
            
            VStack(spacing: 25) {
                Text(selectedSport.capitalized)
                    .withFontWWinsport(size: 16, weight: .regular)
                    .frame(maxWidth: .infinity)
                    .overlay {
                        HStack {
                            Image("\(selectedSport).image")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 25)
                            Spacer()
                            
                            Image("triangle")
                                .rotationEffect(.degrees(showList ? 180: 0))
                        }
                    }
                
                if showList {
                    ForEach(listOfSports.filter { $0 != selectedSport }, id: \.self) { sport in
                        Text(sport)
                            .withFontWWinsport(size: 16, weight: .regular)
                            .frame(maxWidth: .infinity)
                            .overlay {
                                HStack {
                                    Image("\(sport).image")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 25)
                                    Spacer()
                                }
                            }
                            .onTapGesture {
                                withAnimation {
                                    selectedSport = sport
                                    showList = false
                                }
                            }
                    }
                }
            }.padding()
                .background {
                    Color.hex("331E49")
                }
                .cornerRadius(12)
                .onTapGesture {
                    withAnimation {
                        showList.toggle()
                    }
                }
        }.padding(.top)
    }
    
    private func isValidWeightAndAge() -> Bool {
        guard let weigt = Int(userWeight), Array(1...300).contains(weigt) else { return false }
        guard let age = Int(userAge), Array(1...100).contains(age) else { return false }
        return true
    }
}

#Preview {
    ContentViewWinersport43(showLoading: false, selectedTab: .profile)
}


