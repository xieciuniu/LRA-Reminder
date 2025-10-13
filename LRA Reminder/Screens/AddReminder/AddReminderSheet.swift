//
//  AddReminderSheet.swift
//  LRA Reminder
//
//  Created by Hubert Wojtowicz on 05/10/2025.
//

import SwiftUI

struct AddReminderSheet: View {
    @Environment(\.dismiss) private var dismiss
    @State var viewModel: AddReminderSheetViewModel

    var body: some View {
        NavigationStack {
            Form {
                Section("Reminder Info") {
                    TextField("Title", text: $viewModel.title)
                    TextField("Details", text: $viewModel.details)
                    Stepper("Duration: \(viewModel.estimatedDuration) min",
                            value: $viewModel.estimatedDuration, in: 1 ... 300)
                }
            }
            .navigationTitle("New Reminder")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        viewModel.saveReminder()
                        dismiss()
                    }
                }
            }
        }
    }
}

// #Preview {
//    AddReminderSheet()
// }
