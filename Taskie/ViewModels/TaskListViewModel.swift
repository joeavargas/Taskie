//
//  TaskListViewModel.swift
//  Taskie
//
//  Created by Joe Vargas on 8/5/20.
//  Copyright © 2020 Joe Vargas. All rights reserved.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject{
    
    @Published var taskCellViewModels = [TaskCellViewModel]()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.taskCellViewModels = testDataTasks.map { task in
            TaskCellViewModel(task: task)
        }
    }
    
    func addTask(task: Task){
        let taskViewModel = TaskCellViewModel(task: task)
        self.taskCellViewModels.append(taskViewModel)
    }
}
