//
//  Task.swift
//  Todo
//
//  Created by Dyobi on 4/11/22.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId // Auto Generated
    @Persisted var title: String = ""
    @Persisted var completed: Bool = false
    
}
