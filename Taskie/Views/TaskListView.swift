//
//  ContentView.swift
//  Taskie
//
//  Created by Joe Vargas on 8/5/20.
//  Copyright © 2020 Joe Vargas. All rights reserved.
//

import SwiftUI

struct TaskListView: View {
    
    let tasks = testDataTasks
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                List(tasks){ task in
                    TaskCell(task: task)
                }
                Button(action: {}){
                    HStack{
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Add new task")
                    }
                }
                .padding()
            }// End of VStack
                .navigationBarTitle("Tasks")
        }// End of Navigation View
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}

struct TaskCell: View {
    let task: Task
    var body: some View {
        HStack{
            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 20, height: 20)
            Text(task.title)
        }// End of HStack
    }
}
