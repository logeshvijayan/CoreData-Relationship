//
//  CoreStore.swift
//  CoreRelationship
//
//  Created by logesh on 12/30/19.
//  Copyright © 2019 logesh. All rights reserved.
//

import Foundation
import CoreData

//MARK: - Class
class CoreStore: NSObject {
    
    //MARK: - Variables
    var personalData : [Personal] = []
    var contactData : [Contact] = []
    
    
    static let shared = CoreStore()
    
    var context:NSManagedObjectContext {
          return self.container.viewContext
      }

    private var container: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "CoreRelationship")
        persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError?
            {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return persistentContainer
    }()
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("Sucess")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func readData() -> [Personal] {

        let context = container.viewContext
        let request : NSFetchRequest<Personal> = Personal.fetchRequest()
        do{
         personalData = try context.fetch(request)

        }
        catch{
            print(error)
        }

         return personalData
    }
    
    
    
    func readcontactData() -> [Contact] {

        let context = container.viewContext
        let request : NSFetchRequest<Contact> = Contact.fetchRequest()
        do{
         contactData = try context.fetch(request)

        }
        catch{
            print(error)
        }

         return contactData
    }

    func savePersonalData(name : String,mobilenumber : Int64)  {
        
        let personalContext = Personal(context : container.viewContext)
        personalContext.name = name
        self.saveContactData(personal: personalContext, contact: mobilenumber)
        self.saveContext()
    }
    
    func saveContactData(personal : Personal , contact : Int64)  {
        let contactContext = Contact(context: container.viewContext)
        contactContext.mobileNumber = contact
        personal.addToContact(contactContext)
    }
    
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

