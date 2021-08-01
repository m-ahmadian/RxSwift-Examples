//
//  ViewController.swift
//  RxSwiftProject
//
//  Created by Mehrdad Ahmadian on 2021-07-27.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    // Test
    let sequence = 0..<3

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Test: Code to add observer to notification center
    let observer = NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidChangeFrameNotification, object: nil, queue: nil) { notification in
        // Handle receiving notification
    }
    
    func addIterator() {
        var iterator = sequence.makeIterator()
        
        while let n = iterator.next() {
            print(n)
        }
    }
}

