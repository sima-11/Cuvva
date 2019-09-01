import Foundation
import CoreData

class CoreDataManager {
    
    static let `default` = CoreDataManager()
    
    init() { }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Cuvva")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // For demo purose, use default main context here
    lazy var context: NSManagedObjectContext = {
        let context = self.persistentContainer.viewContext
        return context
    }()
    
    func save() {
        context.performAndWait {
            try? self.context.save()
        }
    }
    
    func fetch<T: NSManagedObject>(usingRequest fetchRequest: NSFetchRequest<T>) -> [T]? {
        var results: [T]?
        context.performAndWait {
            results = try? context.fetch(fetchRequest)
        }
        return results
    }
    
    func delete(_ managedObject: NSManagedObject) {
        context.delete(managedObject)
    }
}

extension CoreDataManager {
    
    func fetchAll<T: NSManagedObject & TypeIdentifiable>() -> [T]? {
        let fetchRequest = NSFetchRequest<T>(entityName: T.typeIdentifier)
        return fetch(usingRequest: fetchRequest)
    }
    
    func deleteAll(entity: TypeIdentifiable.Type) throws {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity.typeIdentifier)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        let _ = try persistentContainer.persistentStoreCoordinator.execute(deleteRequest, with: context)
    }
}

extension CoreDataManager {
    
    func savePolicies(_ policies: [Policy]) {
        
        // For demo purpose, simply remove all previously stored records
        try? deleteAll(entity: PolicyMO.self)
        
        context.perform {
            policies.forEach({ policy in
                let policyMO = PolicyMO(context: self.context)
                policyMO.update(withPolicy: policy)
            })
            self.save()
        }
    }
}
