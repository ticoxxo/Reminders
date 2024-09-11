//
//  RemindersApp.swift
//  Reminders
//
//  Created by Alberto Almeida on 09/09/24.
//

import SwiftUI

@main
struct RemindersApp: App {
    @State private var storage = Storage(reminders: Reminder.samples)
    var body: some Scene {
        WindowGroup {
            ReminderListView()
                .environment(\.storage, storage)
        }
    }
}
