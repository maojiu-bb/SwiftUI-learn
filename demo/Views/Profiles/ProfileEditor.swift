//
//  ProfileEditor.swift
//  demo
//
//  Created by 钟钰 on 2024/6/10.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.golDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.golDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username")
                Spacer()
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            
            Toggle(isOn: $profile.prefersNotifications, label: {
                Text("Enable Notifications")
            })
            
            Picker("Seasonal Photo", selection: $profile.seasonalPhoto, content: {
                ForEach(Profile.Season.allCases) {
                    season in
                    Text(season.rawValue).tag(season)
                }
            })
            
            DatePicker(selection: $profile.golDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date")
            }
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
}
