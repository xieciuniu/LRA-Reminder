//
//  Reminder.swift
//  LRA Reminder
//
//  Created by Hubert Wojtowicz on 27/09/2025.
//

import Foundation
import SwiftData

@Model
class Reminder {
    var id: UUID = UUID()
    var title: String
    var details: String?
    var estimatedDuration: Int
    var reminderMode: Mode
    var createdAt: Date
    var updatedAt: Date
    var nextReviewDate: Date?
    var sessions: [Session] = []
    var missedCount: Int = 0
    var completedCount: Int = 0
    
    init(
        title: String,
        details: String? = nil,
        estimatedDuration: Int,
        mode: Mode,
        createdAt: Date,
        nextReviewDate: Date? = nil
    ) {
        self.title = title
        self.details = details
        self.estimatedDuration = estimatedDuration
        self.reminderMode = mode
        self.createdAt = createdAt
        self.updatedAt = createdAt
        self.nextReviewDate = nextReviewDate
    }
}

enum Mode: String, Codable {
    case manual
    case smart
}
