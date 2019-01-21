//
//  Constants.swift
//  bucketList
//
//  Created by Gurpal Bhoot on 11/1/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit
import CoreData

// Completion Handler
typealias CompletionHandler = (_ completion: Bool) -> ()

// Core Data
let appDelegate                     =   UIApplication.shared.delegate as? AppDelegate

// Table Cell Resuse IDs
let ID_REUSE_BUCKET_CELL            =   "bucketCell"

// Storyboard Segue IDs
let ID_SEGUE_TO_BUCKET_LIST_NAV     =   "toBucketListNav"
let ID_SEGUE_TO_MISSION             =   "toMissionVC"
