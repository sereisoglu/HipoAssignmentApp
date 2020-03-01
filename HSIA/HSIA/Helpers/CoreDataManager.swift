//
//  CoreDataManager.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 1.03.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit
import CoreData

enum Teams: CaseIterable {
    case iOS
    case hardware
    case android
    case qaAutomation
    case webFrontend
    case backend
    
    var id: Int {
        switch self {
        case .iOS:
            return 1
        case .hardware:
            return 2
        case .android:
            return 3
        case .qaAutomation:
            return 4
        case .webFrontend:
            return 5
        case .backend:
            return 6
        }
    }
    
    var name: String {
        switch self {
        case .iOS:
            return "iOS Team"
        case .hardware:
            return "Hardware Team"
        case .android:
            return "Android Team"
        case .qaAutomation:
            return "QA Automation Team"
        case .webFrontend:
            return "Web Frontend Team"
        case .backend:
            return "Backend Team"
        }
    }
    
    static var allCasesNameArr: [String] {
        var arr = [String]()
        self.allCases.forEach {
            arr.append($0.name)
        }
        return arr
    }
}

struct CoreDataManager {
    
    static let shared = CoreDataManager()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "HSIACDModels")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - CRUD
    
    // Create
    func createMember(image: UIImage?, teamId: Int, name: String, github: String, age: Int, location: String, position: String, yearsInHipo: Int) {
        let member = MemberCDModel(context: context)
        
        if let image = image {
            let imageData = image.jpegData(compressionQuality: 0.5)
            member.imageData = imageData
        }
        member.team = fetchTeam(id: teamId)
        member.name = name
        member.github = github
        member.age = Int16(age)
        member.location = location
        
        let hipo = HipoCDModel(context: context)
        hipo.position = position
        hipo.yearsInHipo = Int16(yearsInHipo)
        
        member.hipo = hipo
        
        saveContext()
    }
    
    // Read
    func fetchMembers() -> [MemberCDModel] {
        let fetchRequest: NSFetchRequest<MemberCDModel> = MemberCDModel.fetchRequest()
        
        do {
            let members = try context.fetch(fetchRequest)
            return members
        } catch let fetchErr {
            print("Failed to fetch:", fetchErr)
            return []
        }
    }
    
    func fetchTeam(id: Int)  -> TeamCDModel? {
        let fetchRequest: NSFetchRequest<TeamCDModel> = TeamCDModel.fetchRequest()
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "id = %@", "\(id)")
        
        do {
            let teams = try context.fetch(fetchRequest)
            return teams.first
        } catch let fetchErr {
            print("Failed to fetch:", fetchErr)
            return nil
        }
    }
    
    func fetchTeams() -> [TeamCDModel] {
        let fetchRequest: NSFetchRequest<TeamCDModel> = TeamCDModel.fetchRequest()
        
        do {
            let teams = try context.fetch(fetchRequest)
            return teams
        } catch let fetchErr {
            print("Failed to fetch:", fetchErr)
            return []
        }
    }
    
    // Update
    func updateMember() {
        
    }
    
    // Delete
    func deleteMember(member: MemberCDModel) {
        context.delete(member)
        saveContext()
    }
    
    // MARK: - Only Work Once
    
    func controlDidAppOpened() {
        let didAppOpened = UserDefaults.standard.bool(forKey: "didAppOpened")
        
        if !didAppOpened {
            UserDefaults.standard.set(true, forKey: "didAppOpened")
        } else {
            return
        }
        
        createTeams()
        decodeJSONFile()
    }
    
    fileprivate func createTeams() {
        let teams = Teams.allCasesNameArr
        teams.enumerated().forEach { (index, item) in
            let team = TeamCDModel(context: context)
            team.id = Int16(index + 1)
            team.name = item
        }
        saveContext()
    }
    
    // For JSON File
    
    fileprivate func decodeJSONFile() {
        if let path = Bundle.main.path(forResource: "hipo", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                decodeJSONData(data: data) { (res: HipoModel?, err) in
                    if let err = err {
                        print("Failed to decode:", err)
                        return
                    }
                    
                    if let members = res?.members {
                        members.forEach {
                            self.createMember(image: nil, teamId: Teams.iOS.id, name: $0.name, github: $0.github, age: $0.age, location: $0.location, position: $0.hipo.position, yearsInHipo: $0.hipo.yearsInHipo)
                        }
                        // I added myself.
                        self.createMember(image: nil, teamId: Teams.iOS.id, name: "Saffet Emin Reisoğlu", github: "sereisoglu", age: 21, location: "Sakarya", position: "Stajyer", yearsInHipo: 0)
                    }
                }
            } catch {
                print(error)
            }
        }
    }
    
    fileprivate func decodeJSONData<U: Decodable>(data: Data?, completion: @escaping (U?, Error?) -> ()) {
        guard let data = data else { return }
        do {
            let objects = try JSONDecoder().decode(U.self, from: data)
            completion(objects, nil)
        } catch {
            completion(nil, error)
        }
    }
}
