//
//  TodoListApp.swift
//  TodoList
//
//  Created by Sid on 16/08/24.
//

import SwiftUI

@main
 struct TodoListApp: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
            }
            .environmentObject(listViewModel )
        }
    }
}
