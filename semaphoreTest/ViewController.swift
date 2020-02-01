//
//  ViewController.swift
//  semaphoreTest
//
//  Created by Ethan on 2020/1/4.
//  Copyright © 2020 playplay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let semaphore = DispatchSemaphore(value: 1)
        let queue = DispatchQueue.global()
        var arr = [Int]()
        for i in 0..<10000 {
            queue.async {
                if semaphore.wait(timeout: .distantFuture) == .success {
                    print("add \(i)")
                    arr.append(i)
                    semaphore.signal()
                }
            }
        }    }


}

