//
//  AddMissionVC.swift
//  bucketList
//
//  Created by Gurpal Bhoot on 11/3/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class MissionVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var missionTextField: UITextField!
    @IBOutlet weak var cancelButton: RoundedButton!
    
    // Variables
    var editMissionIdx: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    // Functions
    func setupView() {
        cancelButton.backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.4862745098, blue: 0.9647058824, alpha: 1)
        guard let index = editMissionIdx else {
            titleLabel.text = "Add New Mission"
            missionTextField.text = ""
            missionTextField.placeholder = "Add mission here"
            return
        }
        titleLabel.text = "Edit Mission"
        missionTextField.text = DataService.instance.getMission(index: index)
    }
    
    func dismissBackToBucketList() {
        dismiss(animated: true, completion: nil)
    }
    
    // IB-Actions
    @IBAction func submitButtonPressed(_ sender: Any) {
        if missionTextField.text == "" {
            let alert = UIAlertController(title: "Empty Mission", message: "Please enter a mission into the text field above", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            guard let text = missionTextField.text else { return }
            guard let index = editMissionIdx else {
                DataService.instance.addMission(missionStr: text)
                dismissBackToBucketList()
                return
            }
            DataService.instance.editMission(index: index, missionStr: text)
            dismissBackToBucketList()
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismissBackToBucketList()
    }
}
