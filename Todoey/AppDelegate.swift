//
//  AppDelegate.swift
//  Todoey
//
//  Created by Macbook pro rétina on 23/07/2018.
//  Copyright © 2018 Macbook pro rétina. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //print(Realm.Configuration.defaultConfiguration.fileURL)
      
        do {
            _ = try Realm()
        } catch {
            print("error initialising new realm, \(error)")
        }
       
        return true
    }

 
   


}

