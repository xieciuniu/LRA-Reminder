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
    var reminderMode: mode
    var createdAt: Date
    var updatedAt: Date
    var nextReviewDate: Date?
    var sessions: [Session] = []
    
    init(
        title: String,
        details: String? = nil,
        estimatedDuration: Int,
        mode: mode,
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

enum mode: String, Codable {
    case manual
    case smart
}
