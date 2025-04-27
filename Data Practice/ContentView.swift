//
//  ContentView.swift
//  Data Practice
//
//  Created by Jessica Cooper on 4/27/25.
//

import SwiftUI

struct ContentView: View {
    @State private var friends: [Friend] = [
        Friend(friendName: "Becca", friendDay: Date(timeIntervalSince1970: 942480000)),
        Friend(friendName: "Sarah", friendDay: Date(timeIntervalSince1970: 942296400)),
        Friend(friendName: "Gina", friendDay: Date(timeIntervalSince1970: 821595600))
    ]
    @State private var newName = ""
    @State private var newBirthday = Date.now
    
    var body: some View {
        
        NavigationStack {
            List(friends, id: \.name) { friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, style: .date)
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    
                    DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                Button("Save") {
                    let newFriend = Friend(friendName: newName, friendDay: newBirthday)
                          friends.append(newFriend)
                    newName = ""
                    newBirthday = .now
                      }
                      .bold()
                }
            }
        }
            .padding()
        }
    }
    
    #Preview {
        ContentView()
    }
