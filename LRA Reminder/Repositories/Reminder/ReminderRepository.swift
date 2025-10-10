//
//  ReminderRepository.swift
//  LRA Reminder
//
//  Created by Hubert Wojtowicz on 29/09/2025.
//

import Foundation
import SwiftData

class ReminderRepository: ReminderRepositoryProtocol {
    let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func fetchReminders() -> [Reminder] {
        let sort: [SortDescriptor<Reminder>] = [
            SortDescriptor(\.createdAt, order: .forward)
        ]
        let descriptor = FetchDescriptor<Reminder>(sortBy: sort)
        var reminders: [Reminder] = []
        do {
            reminders = try context.fetch(descriptor)
        } catch {
            print("Failed to fetch reminders: \(error.localizedDescription)")
        }
        return reminders
    }

    func addReminder(
        title: String,
        details: String?,
        estimationDuration: Int,
        mode: Mode,
        nextReviewDate: Date?
    ) {
        let reminder = ReminderFactory.createReminder(
            title: title,
            details: details,
            estimatedDuration: estimationDuration,
            mode: mode,
            nextReviewDate: nextReviewDate
        )

        do {
            context.insert(reminder)
            try context.save()
        } catch {
            print("Failed to save: \(error.localizedDescription)")
        }
    }

    func deleteReminder(_ reminder: Reminder) {
        do {
            context.delete(reminder)
            try context.save()
        } catch {
            print("Failed to delete: \(error.localizedDescription)")
        }
    }

    func editReminder(
        _ reminder: Reminder,
        newTitle: String?,
        newDetails: String?,
        newEstimationDuration: Int?,
        newMode: Mode?,
        newNextReviewDate: Date?
    ) {
        if let newTitle {
            reminder.title = newTitle
        }
        if let newDetails {
            reminder.details = newDetails
        }
        if let newEstimationDuration {
            reminder.estimatedDuration = newEstimationDuration
        }
        if let newMode {
            reminder.reminderMode = newMode
        }
        if let newNextReviewDate {
            reminder.nextReviewDate = newNextReviewDate
        }
        reminder.updatedAt = .now

        do {
            try context.save()
        } catch {
            print("Failed to edit reminder (\(reminder.title)): \(error.localizedDescription)")
        }
    }
}
