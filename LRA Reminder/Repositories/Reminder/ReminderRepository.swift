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
    
    func addReminder(
        title: String,
        details: String,
        estimationDuration: Int,
        mode: Mode,
        nextReviewDate: Date
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
            // TODO: Handle the error appropriately, e.g., log it or notify the user
        }
    }

    func deleteReminder(_ reminder: Reminder) {
        <#code#>
    }

    func editReminder(
        _ redminder: Reminder,
        newTitle: String?,
        newDetails: String?,
        newEstimationDuration: Int?,
        newMode: Mode?,
        newNextReviewDate: Date?
    ) {
        <#code#>
    }

}
