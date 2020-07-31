//
//  ObserverViewController.swift
//  FZObserver_Example
//
//  Created by FranZhou on 2020/7/31.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class ObserverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
                
        Singleton.singleton.storeObserver.addObserver(key: "addObserver", target: nil) { (change) in
            print("addObserver = old: \(String(describing: change.old)) -> new: \(String(describing: change.new))")
        }
        
        Singleton.singleton.storeObserver.addAndFireObserver(key: "addAndFireObserver", target: self, count: 4) { (change, fireAtOnce) in
             print("addAndFireObserver = old: \(String(describing: change.old)) -> new: \(String(describing: change.new)) -> fireAtOnce: \(fireAtOnce)")
        }

        Singleton.singleton.storeObserver.fireUntilCompleted(key: "fireUntilCompleted1", target: self, immediately: true) { (change, finish) in
            print("fireUntilCompleted1 = old: \(String(describing: change.old)) -> new: \(String(describing: change.new))")
            if let v = change.new,
                v > arc4random() {
                finish()
                print("fireUntilCompleted1 finish")
            }
        }

        Singleton.singleton.storeObserver.fireUntilCompleted(key: "fireUntilCompleted2", target: self) { (change, finish) in
            print("fireUntilCompleted2 = old: \(String(describing: change.old)) -> new: \(String(describing: change.new))")
            if let v = change.new,
                v > arc4random() {
                finish()
                print("fireUntilCompleted2 finish")
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func observerBtbClick(_ sender: Any) {
        
        Singleton.singleton.store = arc4random()
        
    }
    
    deinit {
        print("ObserverViewController deinit")
    }
    
}
