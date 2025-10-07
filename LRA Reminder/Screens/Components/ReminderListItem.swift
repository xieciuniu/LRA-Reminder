//
//  ReminderListItem.swift
//  LRA Reminder
//
//  Created by Hubert Wojtowicz on 05/10/2025.
//

import SwiftUI

struct ReminderListItem: View {
    let reminder: Reminder

    // Here will be Binding to parent to create session
    @State private var checkbox: Bool = false
    var body: some View {
        HStack(spacing: 15) {
            VStack {
                HStack {
                    Text(reminder.title)
                        .font(.headline)
                    Text("|")
                    Text(
                        reminder.nextReviewDate ?? Date(),
                        style: .date
                    )
                    Spacer()
                }

                Text(reminder.details ?? "")
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    let reminder = Reminder(
        title: "Test Reminder",
        details: "Hello, this text is simply placeholder to test how it look like then you here co much text and hoow it suposed to look like",
        estimatedDuration: 5,
        mode: .manual,
        createdAt: Date()
    )

    ReminderListItem(reminder: reminder)
}
