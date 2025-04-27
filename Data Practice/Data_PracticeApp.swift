//
//  Data_PracticeApp.swift
//  Data Practice
//
//  Created by Jessica Cooper on 4/27/25.
//

import SwiftUI
import SwiftData

@main
struct Data_PracticeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            .modelContainer(for: Friend.self)
        }
    }
}
