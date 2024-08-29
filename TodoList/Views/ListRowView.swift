//
//  ListRowView.swift
//  TodoList
//
//  Created by Sid on 16/08/24.
//

import SwiftUI

struct ListRowView: View {
    
    let item : ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle" )
                .foregroundStyle(item.isCompleted ? Color.green : Color.red )
            Text(item.title)
            Spacer()
        }
        .font(.title2)
    }
}

#Preview("First"){
    Group {
        ListRowView(item: ItemModel(title: "First Title", isCompleted: false))
    }
    .previewLayout(.sizeThatFits)
}
#Preview("Second") {
    Group {
        ListRowView(item: ItemModel(title: "Second Title", isCompleted: true))
    }
    .previewLayout(.sizeThatFits)
}
