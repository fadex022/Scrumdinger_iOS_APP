//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Gauss on 12/03/2024.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var scrum: DailyScrum
    @State private var new_attendee_name: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.length_in_minutes_double, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.length_in_minutes) minutes")
                    Spacer()
                    Text("\(scrum.length_in_minutes) minutes")
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $scrum.theme)
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee", text: $new_attendee_name)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: new_attendee_name)
                            scrum.attendees.append(attendee)
                            new_attendee_name = ""
                        }
                    }){
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(new_attendee_name.isEmpty)
                }
            }
        }
    }
}


struct DetailEditView_Preview: PreviewProvider {
    static var previews: some View {
        DetailEditView(scrum: .constant(DailyScrum.sample_data[0]))
    }
}
