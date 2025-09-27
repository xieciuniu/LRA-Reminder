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
    var startDate: Date = Date()
    var endDate: Date?
    var duration: Int?
    var reminder: Reminder
    var isSessionMissed: Bool
    
    init(startDate: Date, reminder: Reminder, isSessionMissed: Bool?) {
        self.startDate = startDate
        self.reminder = reminder
        self.isSessionMissed = isSessionMissed ?? false
    }
}
