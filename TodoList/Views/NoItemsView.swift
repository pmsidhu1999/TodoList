//
//  NoItemsView.swift
//  TodoList
//
//  Created by Sid on 19/08/24.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate : Bool = false
    @State var secondaryAccentColor : Color = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10 ){
                Text("No items in the list")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Click on button 'Add' to add items to your list ")
                    .padding(.bottom , 30)
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add item ✏️")
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .foregroundStyle(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.horizontal , animate ? 30 :50)
                .shadow(
                    color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/,
                    y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)

            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animate else {return} // so that animation doesnt appear twice
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            } // animation for the add item button
        })
    }
}

#Preview {
    NavigationStack{
        NoItemsView()
            .navigationTitle("Todo")
    }
}
