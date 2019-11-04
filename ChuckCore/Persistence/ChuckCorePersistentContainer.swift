//
//  ChuckCorePersistentContainer.swift
//  ChuckCore
//
//  Created by Rafael Martins on 30/10/19.
//  Copyright © 2019 Rafael Martins. All rights reserved.
//

import Foundation
import CoreData

final class ChuckCorePersistentContainer: NSPersistentContainer {

    enum InitError: Error {
        case missingDataModel
        case loadFailed

        var localizedDescription: String {
            switch self {
            case .missingDataModel:
                return "Missing model from ChuckCore bundle"
            case .loadFailed:
                return "Unable to load object model"
            }
        }
    }

    let url: URL
    let readOnly: Bool

    init(url: URL, readOnly: Bool) throws {
        self.url = url
        self.readOnly = readOnly

        guard let modelURL = Bundle.chuckCore.url(forResource: "Model", withExtension: "momd") else {
            throw InitError.missingDataModel
        }

        guard let model = NSManagedObjectModel(contentsOf: modelURL) else {
            throw InitError.loadFailed
        }

        super.init(name: "Model", managedObjectModel: model)

        let store = NSPersistentStoreDescription(url: url)

        store.isReadOnly = readOnly

        persistentStoreDescriptions = [store]
    }

}
