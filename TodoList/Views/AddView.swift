//
//  AddView.swift
//  TodoList
//
//  Created by Sid on 16/08/24.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textFieldText : String = ""
    @State var showAlert : Bool = false
    @State var alertTitle : String = ""
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 10 )) 
                
                Button(action: saveButtonPressed, label: {
                    Text("save".uppercased())
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .foregroundStyle(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))

                })
            }
            .padding()
        }
        .navigationTitle("Add items 🖋️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed(){
        if isTextAppropriate(){
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    
    func isTextAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "New Todo item must be atleast 3 characters long 😕"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
         return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationStack{
        AddView()
            .environmentObject(ListViewModel())
    }
}
