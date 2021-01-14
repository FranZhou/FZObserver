//
//  ViewController.swift
//  FZObserver
//
//  Created by FranZhou on 07/31/2020.
//  Copyright (c) 2020 FranZhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        Singleton.singleton.observer.addObserver(key: "ViewController", target: self, count: 10) { (change) in
             print("ViewController = old: \(String(describing: change.old)) -> new: \(String(describing: change.new))")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func observerBtnClick(_ sender: Any) {
        Singleton.singleton.observer.wrappedValue = arc4random()
    }

}
