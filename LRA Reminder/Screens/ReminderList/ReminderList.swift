//
//  ReminderList.swift
//  LRA Reminder
//
//  Created by Hubert Wojtowicz on 05/10/2025.
//

import SwiftData
import SwiftUI

struct ReminderList: View {
    @Environment(\.modelContext) var modelContext
    @State private var viewModel: ReminderListViewModel = ReminderListViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                if !viewModel.loading {
                    List {
                        ForEach(viewModel.reminders) { reminder in
                            NavigationLink(destination: {}) {
                                ReminderListItem(reminder: reminder)
                            }
                        }
                        .onDelete(perform: { indexSet in
                            viewModel.reminderDelete(at: indexSet)
                        })
                    }
                } else {
                    ProgressView()
                }
            }
            .navigationTitle("Reminder List")
            .toolbar {
                Button("Add") {
                    viewModel.addReminder()
                }
            }
            .sheet(
                isPresented: $viewModel.addReminderSheet,
                onDismiss: { viewModel.loadReminders() },
                content: {
                    AddReminderSheet(
                        viewModel: AddReminderSheetViewModel(
                            repository: viewModel.repository!
                        )
                    )
                }
            )
        }
        .task {
            viewModel
                .attachRepository(
                    ReminderRepository(context: modelContext)
                )
            viewModel.loadReminders()
        }
    }
}

#Preview {
    ReminderList()
}
