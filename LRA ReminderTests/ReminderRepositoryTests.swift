//
//  ReminderRepositoryTests.swift
//  LRA ReminderTests
//
//  Created by Hubert Wojtowicz on 10/10/2025.
//

@testable import LRA_Reminder
import SwiftData
import XCTest

@MainActor
final class ReminderRepositoryTests: XCTestCase {
    var container: ModelContainer?
    var context: ModelContext?
    var repository: ReminderRepository?
    
    override func setUpWithError() throws {
        container = try TestUtils.makeInMemoryContainer()
        context = container!.mainContext
        repository = ReminderRepository(context: context!)
    }
    
    override func tearDownWithError() throws {
        container = nil
        context = nil
        repository = nil
    }
    
    func testAddReminder() throws {
        // Given
        let reminder = Reminder(
            title: "Test Reminder",
            estimatedDuration: 5,
            mode: .manual,
            createdAt: Date()
        )
        
        // When
        repository!
            .addReminder(
                title: reminder.title,
                details: reminder.details,
                estimationDuration: reminder.estimatedDuration,
                mode: .manual,
                nextReviewDate: reminder.nextReviewDate
        )
        
        // Then
        let all = repository!.fetchReminders()
        XCTAssertEqual(all.count, 1)
        XCTAssertEqual(all.first?.title, "Test Reminder")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
