//
//  CardView.swift
//  Scrumdinger
//
//  Created by Gauss on 12/03/2024.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label("\(scrum.length_in_minutes)", systemImage: "clock")
                    .labelStyle(.trailing_icon)
                    .accessibilityLabel("\(scrum.length_in_minutes) minutes meeting")
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
    }
}



struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.sample_data[0]
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
