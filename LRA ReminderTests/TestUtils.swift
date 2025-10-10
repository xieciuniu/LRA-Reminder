//
//  TestUtils.swift
//  LRA ReminderTests
//
//  Created by Hubert Wojtowicz on 10/10/2025.
//

import XCTest
import SwiftData
@testable import LRA_Reminder

final class TestUtils {
    static func makeInMemoryContainer() throws -> ModelContainer {
        let schema = Schema([Reminder.self, Session.self])
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        return try ModelContainer(for: schema, configurations: config)
    }
}
