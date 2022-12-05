//
//  ContentView.swift
//  Task 1-2
//
//  Created by Ogabek Matyakubov on 05/12/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchedResults<Student>
    @Environment(\.managedObjectContext) var moc
    @State var isModel = false
    var body: some View {
        NavigationView{
            List{
                ForEach(students, id: \.firstname) { student in
                    StudentCell(student: student)
                }
                
            }
            .listStyle(PlainListStyle())
            .navigationBarItems(trailing:
                Button(action: {
                isModel = true
            }, label: {
                Text("Add")
            }).sheet(isPresented: $isModel, content: {
                DetailsScreen().environment(\.managedObjectContext, self.moc)
            })
            )
            .navigationBarTitle("Student List", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
