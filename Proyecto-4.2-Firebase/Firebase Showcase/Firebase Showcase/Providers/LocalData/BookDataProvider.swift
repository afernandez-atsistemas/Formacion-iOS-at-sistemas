//
//  BookDataProvider.swift
//  Firebase Showcase
//
//  Created by Abrahán Fernández on 15/3/21.
//

import Foundation
import PromiseKit
import UIKit
import CoreData

class BookDataProvider: BookProviderContract {

    private var managedObjectContext: NSManagedObjectContext?

    init() {
        self.managedObjectContext = delegate.persistentContainer.viewContext//UIAplication
    }

    func getBooks() -> Promise<[BookModel]> {
        return Promise<[BookModel]> { promise in
            promise.fulfill([])
        }
    }

    private func saveContext () {
        guard let managedObjectContext = managedObjectContext else {
            return
        }

        if managedObjectContext.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    func fecthBooks() -> Promise<> {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BookData")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "title", ascending: false)]
        fetchRequest.fetchLimit = 5
        fetchRequest.fetchOffset = 0
        let predicate = NSPredicate(format: "title contains[cd] %@", "Fulanito de tal")
        let perdicado2
        []
        fetchRequest.predicate = NSCompoundPredicate(type: .and, subpredicates: subpredicates)

        do {
            let fetchedRecipes = try managedObjectContext?.fetch(fetchRequest) as! [BookData]


        } catch {
            fatalError("Failed to fetch recipes: \(error)")
        }

    }

    func createNewBookData() {


        let bookData = NSEntityDescription.insertNewObject(forEntityName: "BookData", into: managedObjectContext?) as! BookData
        bookData.setValue("Mengano", forKey: "author")
        self.saveContext()

    }


}
