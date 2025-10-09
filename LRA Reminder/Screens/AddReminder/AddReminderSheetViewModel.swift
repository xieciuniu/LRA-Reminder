//
//  AddReminderSheetViewModel.swift
//  LRA Reminder
//
//  Created by Hubert Wojtowicz on 05/10/2025.
//

import Foundation

@Observable
class AddReminderSheetViewModel {
    
    private let repository: ReminderRepository

    var title = ""
    var details = ""
    var estimatedDuration = 30

    init(repository: ReminderRepository) {
        self.repository = repository
    }

    func saveReminder() {
        repository
            .addReminder(
                title: title,
                details: details,
                estimationDuration: estimatedDuration,
                mode: .manual,
                nextReviewDate: .now.addingTimeInterval(3600)
            )
    }
}
