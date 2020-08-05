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
    @Published var taskRepo = TaskRepo()
    @Published var taskCellViewModels = [TaskCellViewModel]()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        taskRepo.$tasks.map{ tasks in
            tasks.map { task in
                TaskCellViewModel(task: task)
            }
        }
        .assign(to: \.taskCellViewModels, on: self)
        .store(in: &cancellables)
    }
    
    func addTask(task: Task){
        taskRepo.addTask(task)
//        let taskViewModel = TaskCellViewModel(task: task)
//        self.taskCellViewModels.append(taskViewModel)
    }
}
