//
//  DataService.swift
//  bucketList
//
//  Created by Gurpal Bhoot on 11/1/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import Foundation
import CoreData

class DataService {
    static let instance = DataService()
    
    private var missions = [Mission]()
    
    func addMission(missionStr: String) {
        self.save(addNew: true, withMissionString: missionStr) { (success) in
            if success {
                print("Created and saved")
            }
        }
    }
    
    func getMission(index: Int) -> String {
        guard let missionStr = missions[index].mission else {
            print("Can't get mission")
            return "false"
        }
        
        return missionStr
    }
    
    func editMission(index: Int, missionStr: String) {
        let mission = missions[index]
        mission.mission = missionStr
        self.save(addNew: false, withMissionString: nil) { (success) in
            if success {
                print("Edited and saved")
            }
        }
    }
    
    func removeMission(index: Int) {
        delete(index: index) { (success) in
            if success {
                print("Removed and saved")
            }
        }
    }
    
    func returnMissions() -> [Mission] {
        fetchCoreDataObjects()

        return missions
    }
    
    func fetchCoreDataObjects() {
        self.fetch { (success) in
            if success {
                print("Stored the data")
            }
        }
    }
    
    func fetch(completion: CompletionHandler) {
        guard let managedContext = appDelegate?.persistentController.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<Mission>(entityName: "Mission")
        
        do {
            missions = try managedContext.fetch(fetchRequest)
            print("Successfully fetched all data")
            completion(true)
        } catch {
            debugPrint("Could not fetch: \(error.localizedDescription)")
            completion(false)
        }
    }
    
    func save(addNew: Bool, withMissionString: String?, completion: CompletionHandler) {
        guard let managedContext = appDelegate?.persistentController.viewContext else { return }
        
        if addNew {
            let mission = Mission(context: managedContext)
            
            if let missionStr = withMissionString {
                mission.mission = missionStr
            }
        }
        
        do {
            try managedContext.save()
            print("Successfully saved data")
            fetchCoreDataObjects()
            completion(true)
        } catch {
            debugPrint("Could not save: \(error)")
            completion(false)
        }
    }
    
    func delete(index: Int, completion: CompletionHandler) {
        guard let managedContext = appDelegate?.persistentController.viewContext else { return }
        
        managedContext.delete(missions[index])
        
        do {
            try managedContext.save()
            print("Successfully saved")
            completion(true)
        } catch {
            debugPrint("Could not remove: \(error.localizedDescription)")
            completion(false)
        }
    }
}
