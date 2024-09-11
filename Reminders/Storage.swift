//
//  Storage.swift
//  Reminders
//
//  Created by Alberto Almeida on 10/09/24.
//

import SwiftUI

@Observable final class Storage {
    var reminders: [Reminder]
    
    init(reminders: [Reminder] = []){
        self.reminders = reminders
    }
    
    func add(reminder: Reminder) {
        reminders += [reminder]
    }
    
    func remove(reminder: Reminder) {
        reminders.removeAll { $0 === reminder }
    }
    
    func purgeEmptyReminders() {
        reminders.removeAll { $0.isEmpty }
    }
    
    func flaggedReminders() -> [Reminder] {
        reminders.filter { $0.flag }
    }
    
    func reminders(withPriority priority: Priority) -> [Reminder] {
            reminders.filter { $0.priority == priority }
    }
}

private struct StorageKey: EnvironmentKey {
    static var defaultValue: Storage = Storage()
}

extension EnvironmentValues {
    var storage: Storage {
        get { self[StorageKey.self] }
        set { self[StorageKey.self] = newValue }
    }
}
