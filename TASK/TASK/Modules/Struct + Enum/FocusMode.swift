//
//  FocusMode.swift
//  TASK
//
//  Created by Monish Kumar on 12/04/25.
//

import Combine
import Foundation

enum FocusMode: String, CaseIterable, Codable, Identifiable {
    case work = "Work"
    case play = "Play"
    case rest = "Rest"
    case sleep = "Sleep"

    var id: String { rawValue }
}

struct Badge: Identifiable, Codable, Hashable {
    var id = UUID()
    let symbol: String
}

struct Session: Identifiable, Codable {
    var id = UUID()
    let mode: FocusMode
    let startTime: Date
    let duration: TimeInterval
    let points: Int
    let badges: [Badge]
}
