//
//  BucketListVC.swift
//  bucketList
//
//  Created by Gurpal Bhoot on 11/1/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit
import CoreData

class BucketListVC: UIViewController {

    // Outlets
    @IBOutlet weak var bucketListTableView: UITableView!
    
    // Variables
    var missions: [Mission]?
    var editMissionIdx : Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        setupTable()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupView()
    }
    
    // Functions
    func setupView() {
        missions = DataService.instance.returnMissions()
        bucketListTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segue_id = segue.identifier else { return }
        if segue_id == ID_SEGUE_TO_MISSION {
            if let destination = segue.destination as? MissionVC {
                if let _ = sender as? UIBarButtonItem {
                    print("Button was the sender not the edit item")
                    self.editMissionIdx = nil
                    
                }
                
                guard let index = editMissionIdx else {
                    print("Don't have the edit index from BucketListVC")
                    return
                }
                destination.editMissionIdx = index
            }
        }
    }
    
    func setupTable() {
        bucketListTableView.delegate = self
        bucketListTableView.dataSource = self
        bucketListTableView.reloadData()
    }
}

extension BucketListVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let list = missions else {
            return 0
        }
        
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let missions = missions, let cell = tableView.dequeueReusableCell(withIdentifier: ID_REUSE_BUCKET_CELL) as? BucketCell else { return UITableViewCell() }
        
        let idx = indexPath.row
        guard let missionStr = missions[idx].mission else { return UITableViewCell() }
        
        cell.configureCell(index: idx+1, content: missionStr)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        self.editMissionIdx = indexPath.row
        performSegue(withIdentifier: ID_SEGUE_TO_MISSION, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        DataService.instance.removeMission(index: indexPath.row)
        setupView()
    }
}
