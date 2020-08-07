//
//  TaskRepo.swift
//  Taskie
//
//  Created by Joe Vargas on 8/5/20.
//  Copyright © 2020 Joe Vargas. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class TaskRepo: ObservableObject{
    
    let db = Firestore.firestore()
    init() {
        loadData()
    }
    @Published var tasks = [Task]()
    
    func loadData(){
        db.collection("tasks")
        .order(by: "createdTime")
            .addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot{
                self.tasks = querySnapshot.documents.compactMap{ document in
                    do{
                       let x = try document.data(as: Task.self)
                        return x
                    }
                    catch{
                        print(error)
                    }
                    return nil
                }
            }
        }
    }
    
    func addTask(_ task: Task){
        do{
            let _ = try db.collection("tasks").addDocument(from: task)
        } catch{
            fatalError("Unable to encode task, \(error.localizedDescription)")
        }
    }
    
    func updateTask(_ task: Task){
        if let taskID = task.id{
            do{
                try db.collection("tasks").document(taskID).setData(from: task)
            }catch{
                fatalError("Error updating task: \(error.localizedDescription)")
            }
        }
    }
    
}
