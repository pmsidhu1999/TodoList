//
//  ListView.swift
//  TodoList
//
//  Created by Sid on 16/08/24.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel : ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }else{
                List {
                    ForEach(listViewModel.items){item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem(indexSet:))
                    .onMove(perform: listViewModel.moveItem(from:to:) )
                }
                .listStyle(.plain)  
            }
        }
        .navigationTitle("Todo List  📝")
        .toolbar {
            ToolbarItem(id: "edit",placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationStack {
            ListView()
                .environmentObject(ListViewModel())
        }
    }
}

