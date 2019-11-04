//
//  NSManagedObjectContext+.swift
//  ChuckCore
//
//  Created by Rafael Martins on 30/10/19.
//  Copyright © 2019 Rafael Martins. All rights reserved.
//

import Foundation
import CoreData
import RxDataSources
import RxCoreData
import RxSwift

public extension Reactive where Base: NSManagedObjectContext {

    func create<E: Persistable>(_ type: E.Type = E.self) -> E.T {
        return NSEntityDescription.insertNewObject(forEntityName: E.entityName, into: self.base) as! E.T
    }

    func get<P: Persistable>(_ persistable: P) throws -> P.T? {
        let fetchRequest: NSFetchRequest<P.T> = NSFetchRequest(entityName: P.entityName)
        fetchRequest.predicate = NSPredicate(format: "%K = %@", P.primaryAttributeName, persistable.identity)

        let result = (try self.base.execute(fetchRequest)) as! NSAsynchronousFetchResult<P.T>

        return result.finalResult?.first
    }

    func getOrCreateEntity<K: Persistable>(for persistable: K) -> K.T {
        if let reusedEntity = try? self.get(persistable), reusedEntity != nil {
            return reusedEntity!
        } else {
            return self.create(K.self)
        }
    }

}
