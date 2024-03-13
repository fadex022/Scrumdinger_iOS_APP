//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Gauss on 12/03/2024.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailing_icon : Self {
        Self()
    }
}
