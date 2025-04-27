//
//  EditFriendView.swift
//  Data Practice
//
//  Created by Jessica Cooper on 4/27/25.
//

import Foundation
import SwiftUI
import SwiftData

struct EditFriendView: View {
    var friend: Friend
    @State private var newName: String
    @State private var newBirthday: Date
    @Environment(\.dismiss) private var dismiss
    
    init(friend: Friend) {
        self.friend = friend
        _newName = State(initialValue: friend.name)
        _newBirthday = State(initialValue: friend.birthday)
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $newName) // new
            DatePicker("Birthday", selection: $newBirthday, displayedComponents: .date)
        }
        .navigationTitle("Edit Friend")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") { dismiss ()}
            }
        ToolbarItem(placement: .confirmationAction) { // new
            Button("Save") { // new
                friend.name = newName
                friend.birthday = newBirthday
                dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        EditFriendView(friend: Friend(friendName: "Test", friendDay: Date.now))
    }
}
