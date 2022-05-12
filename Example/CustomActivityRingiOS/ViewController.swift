//
//  ViewController.swift
//  CustomActivityRingiOS
//
//  Created by jaydev6228 on 05/12/2022.
//  Copyright (c) 2022 jaydev6228. All rights reserved.
//

import UIKit
import CustomActivityRingiOS

class ViewController: UIViewController {

    @IBOutlet weak var viewRing: ProgressRing!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewRing.trackGradientColor = [UIColor.red.cgColor, UIColor.blue.cgColor]
        viewRing.setProgress(to: 0.7, withAnimation: true)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

