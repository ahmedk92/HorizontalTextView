//
//  ViewController.swift
//  HorizontalTextView
//
//  Created by ahmedk92 on 03/16/2019.
//  Copyright (c) 2019 ahmedk92. All rights reserved.
//

import UIKit
import HorizontalTextView

fileprivate let font = UIFont.systemFont(ofSize: 30)

class ViewController: UIViewController {

    @IBOutlet private var textView: HorizontalTextView!
    private lazy var attrStr = NSMutableAttributedString(
        string: try! String(contentsOf: Bundle.main.url(forResource: "text", withExtension: "txt")!),
        attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.darkText,
            NSAttributedString.Key.font: font
        ]
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        textView.attributedString = attrStr
        textView.isPagingEnabled = true
    }
}

extension ViewController {
    @IBAction private func fontSizeSliderValueChanged(_ sender: UISlider) {
        attrStr.setAttributes([
            NSAttributedString.Key.font: font.withSize(CGFloat(sender.value))
        ], range: NSMakeRange(0, attrStr.length))
        
        textView.attributedString = attrStr
    }
}

