//
//  Session.swift
//  LRA Reminder
//
//  Created by Hubert Wojtowicz on 27/09/2025.
//

import Foundation
import SwiftData

@Model
class Session {
    var id: UUID = UUID()
    var startDate: Date?
    var endDate: Date?
    var duration: Int?
    var reminder: Reminder
    var status: SessionStatus
    
    init(
        startDate: Date?,
        endDate: Date? = nil,
        duration: Int? = nil,
        reminder: Reminder,
        status: SessionStatus
    ) {
        self.startDate = startDate
        self.endDate = endDate
        self.duration = duration
        self.reminder = reminder
        self.status = status
    }
}

enum SessionStatus: String, Codable {
    case completed
    case missed
    case inProgress
}
