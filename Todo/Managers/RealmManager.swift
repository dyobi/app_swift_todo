//
//  RealmManager.swift
//  Todo
//
//  Created by Dyobi on 4/11/22.
//

import Foundation
import RealmSwift
import SwiftUI

class RealmManager: ObservableObject {
    
    private(set) var localRealm: Realm?
    @Published private(set) var tasks: [Task] = []
    
    init() {
        openRealm()
        getTask()
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
        } catch {
            print("Error opening Realm: \(error)")
        }
    } // openRealm
    
    func addTask(taskTitle: String) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newTask = Task(value: ["title": taskTitle, "completed": false])
                    localRealm.add(newTask)
                    getTask()
                    print("Added a new task to Realm: \(newTask)")
                }
            } catch {
                print("Error adding a task to Realm: \(error)")
            }
        }
    } // addTask
    
    func getTask() {
        if let localRealm = localRealm {
            let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            allTasks.forEach {
                task in
                tasks.append(task)
            }
        }
    } // getTask
    
    func updateTask(id: ObjectId, completed: Bool) {
        if let localRealm = localRealm {
            do {
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id==%@", id))
                
                guard !taskToUpdate.isEmpty else { return }
                
                try localRealm.write {
                    taskToUpdate[0].completed = completed
                    getTask()
                    print("Updated a task with id: \(id)! Completed status: \(completed)")
                }
            } catch {
                print("Error updating a task \(id) to Realm: \(error)")
            }
        }
    } // updateTask
    
    func deleteTask(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let taskDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id==%@", id))
                
                guard !taskDelete.isEmpty else { return }
                
                try localRealm.write {
                    localRealm.delete(taskDelete)
                    getTask()
                    print("Deleted a task with id: \(id)")
                }
            } catch {
                print("Error deleting a task \(id) to Realm: \(error)")
            }
        }
    }
    
}
