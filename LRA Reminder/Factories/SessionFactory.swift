//
//  SessionFactory.swift
//  LRA Reminder
//
//  Created by Hubert Wojtowicz on 29/09/2025.
//

import Foundation

class SessionFactory {
    static func createSession(for reminder: Reminder) -> Session {
        let now = Date()
        let session = Session(
            startDate: Date(),
            reminder: reminder,
            status: .inProgress
        )
        
        return session
    }
    
    static func createMissedSession(for reminder: Reminder) -> Session {
        let session: Session = Session(
            startDate: nil,
            endDate: nil,
            duration: nil,
            reminder: reminder,
            status: .missed
        )
        
        return session
    }
}
