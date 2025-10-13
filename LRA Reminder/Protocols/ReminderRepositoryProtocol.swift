//
//  ReminderRepositoryProtocol.swift
//  LRA Reminder
//
//  Created by Hubert Wojtowicz on 27/09/2025.
//

import Foundation

protocol ReminderRepositoryProtocol {
    func fetchReminders() -> [Reminder]
    func addReminder(title: String, details: String?, estimationDuration: Int, mode: Mode, nextReviewDate: Date?)
    
    func deleteReminder(_ reminder: Reminder)
    
    func editReminder(_ reminder: Reminder, newTitle: String?, newDetails: String?, newEstimationDuration: Int?, newMode: Mode?, newNextReviewDate: Date?)
}
