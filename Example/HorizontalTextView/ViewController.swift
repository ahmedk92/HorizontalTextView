//
//  ViewController.swift
//  HorizontalTextView
//
//  Created by ahmedk92 on 03/16/2019.
//  Copyright (c) 2019 ahmedk92. All rights reserved.
//

import UIKit
import HorizontalTextView

class ViewController: UIViewController {

    @IBOutlet private var textView: HorizontalTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let attrStr = NSAttributedString(
            string: try! String(contentsOf: Bundle.main.url(forResource: "text", withExtension: "txt")!),
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.darkText,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30)
            ]
        )
        
        
        textView.attributedString = attrStr
        textView.isPagingEnabled = true
    }
}

