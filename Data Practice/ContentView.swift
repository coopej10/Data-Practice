//
//  ContentView.swift
//  Data Practice
//
//  Created by Jessica Cooper on 4/27/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var friends: [Friend]
    @State private var newName = ""
    @State private var newBirthday = Date.now
    @State private var selectedFriend: Friend?
    
    @Environment(\.modelContext) private var context
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(friends) { friend in
                    HStack {
                        Text(friend.name)
                        Spacer()
                        Text(friend.birthday, style: .date)
                    }
                .onTapGesture {
                        selectedFriend = friend
                        }
                }
                .onDelete(perform: deleteFriends)
            }
            .navigationTitle("Birthdays")
            .sheet(item: $selectedFriend) { friend in
            NavigationStack {
                EditFriendView(friend: friend)
                }
            }
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    
                    DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding(.leading)
                Button("Save") {
                    let newFriend = Friend(friendName: newName, friendDay: newBirthday)
                    context.insert(newFriend)
                    newName = ""
                    newBirthday = .now
                      }
                      .bold()
                      .padding(.bottom)
                }
            }
        }
            .padding()
        }
    private func deleteFriends(at offsets: IndexSet) {
           for index in offsets {
               let friend = friends[index]
               context.delete(friend)
           }
       }
    }
    
    #Preview {
        ContentView()
            .modelContainer(for: Friend.self, inMemory: true)
    }
