//
//  DayliStrerchView.swift
//  Sumo sport
//
//  Created by Improve on 11.12.2024.
//

import SwiftUI

struct DayliStrerchView: View {
    @AppStorage("wasTrained") var wasTrained = false
    
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
        VStack {
            Image("stretch.start")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                NavigationLink {
                    TrainingViewWinersport(sportType: .stretch)
                } label: {
                    Text("Start")
                        .withFont(size: 18, weight: .medium, color: .hex("2E023F"))
                        .padding(.vertical, 11)
                        .padding(.horizontal, 30)
                        .background(Color.hex("FEE600"))
                        .cornerRadius(13.17)
                }.grayscale(wasTrained ? 1: 0)
                    .disabled(wasTrained)
                
                if wasTrained {
                    Text("Come back tomorrow")
                        .withFont(size: 15, weight: .bold)
                }
            }
        }
    }
}

#Preview {
    ContentViewWinersport(showLoading: false, selectedTab: .stretch)
}
