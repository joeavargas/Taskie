//
//  TaskCellViewModel.swift
//  Taskie
//
//  Created by Joe Vargas on 8/5/20.
//  Copyright © 2020 Joe Vargas. All rights reserved.
//

import Foundation
import Combine

class TaskCellViewModel: ObservableObject, Identifiable{
    
    @Published var task: Task
    
    var id = ""
    @Published var completionStateIconName: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(task: Task) {
        self.task = task
        
        $task
            .map { task in
                task.completed ? "checkmark.circle.fill" : "circle"
        }
        .assign(to: \.completionStateIconName, on: self)
        .store(in: &cancellables)
        
        $task
            .map { task in
                task.id
        }
        .assign(to: \.id, on: self)
        .store(in: &cancellables)
    }
}
