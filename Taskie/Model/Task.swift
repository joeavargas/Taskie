//
//  Task.swift
//  Taskie
//
//  Created by Joe Vargas on 8/5/20.
//  Copyright © 2020 Joe Vargas. All rights reserved.
//

import Foundation

struct Task: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var completed: Bool
}

#if DEBUG
let testDataTasks=[
    Task(title: "Implement UI", completed: true),
    Task(title: "Connect to Firebase", completed: false),
    Task(title: "????", completed: false),
    Task(title: "Profit", completed: false)
]
#endif
