//
//  ReminderFactory.swift
//  LRA Reminder
//
//  Created by Hubert Wojtowicz on 29/09/2025.
//

import Foundation

class ReminderFactory {
    static func createReminder(
        title: String,
        details: String?,
        estimatedDuration: Int,
        mode: Mode,
        nextReviewDate: Date?
    ) -> Reminder {
        let now = Date()
        let reminder = Reminder(
            title: title,
            details: details,
            estimatedDuration: estimatedDuration,
            mode: mode,
            createdAt: now,
            nextReviewDate: nextReviewDate
        )
        
        return reminder
    }
}
