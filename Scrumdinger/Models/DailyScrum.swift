//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Gauss on 12/03/2024.
//

import SwiftUI

struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var length_in_minutes: Int
    var length_in_minutes_double: Double {
        get {
            Double(length_in_minutes)
        }
        set {
            length_in_minutes = Int(newValue)
        }
    }
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], length_in_minutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map {Attendee(name: $0)}
        self.length_in_minutes = length_in_minutes
        self.theme = theme
    }
}

extension DailyScrum {
    struct Attendee: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    static var empty_scrum: DailyScrum {
        DailyScrum(title: "", attendees: [], length_in_minutes: 5, theme: .sky)
    }
}

extension DailyScrum {
    static let sample_data: [DailyScrum] = [
        DailyScrum(title: "Design",
                           attendees: ["Fadel", "Noah", "Simon", "Jonathan"],
                   length_in_minutes: 10,
                           theme: .yellow),
        DailyScrum(title: "App Dev",
                   attendees: ["Enny", "Gray", "Louange", "Luis", "Darla"],
                   length_in_minutes: 5,
                   theme: .orange),
        DailyScrum(title: "Web Dev",
                   attendees: ["Confidence", "Amah", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
                   length_in_minutes: 5,
                   theme: .poppy)
    ]
}
