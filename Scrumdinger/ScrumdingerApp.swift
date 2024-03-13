//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Gauss on 11/03/2024.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sample_data
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
