//
//  ReminderRepositoryProtocol.swift
//  LRA Reminder
//
//  Created by Hubert Wojtowicz on 27/09/2025.
//

import Foundation

protocol ReminderRepositoryProtocol {
    func addReminder(title: String, details: String, estimationDuration: Int, mode: mode, nextReviewDate: Date)
    
    func deleteReminder(_ reminder: Reminder)
    
    
}
