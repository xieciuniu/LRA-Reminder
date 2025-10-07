//
//  ReminderListViewModel.swift
//  LRA Reminder
//
//  Created by Hubert Wojtowicz on 05/10/2025.
//

import Foundation
internal import Combine
import SwiftData

@Observable
class ReminderListViewModel {
    var repository: ReminderRepository?

    var reminders: [Reminder] = []
    var loading: Bool = true

    var deleteReminderDialog: Bool = false
    var addReminderSheet: Bool = false

    static func previewInstance() -> ReminderListViewModel {
        ReminderListViewModel()
    }

    func attachRepository(_ repo: ReminderRepository) {
        repository = repo
    }

    func loadReminders() {
        loading = true
        reminders = repository?.fetchReminders() ?? []

        if !reminders.isEmpty {
            loading = false
        }
    }

    func reminderDelete(at indexSet: IndexSet) {
        if let reminderToDelete = reminders[indexSet.first!] as Reminder? {
            reminders.removeAll(where: { $0.id == reminderToDelete.id })
            repository!.deleteReminder(reminderToDelete)
        }
    }

    func addReminder() {
        addReminderSheet = true
    }
}
