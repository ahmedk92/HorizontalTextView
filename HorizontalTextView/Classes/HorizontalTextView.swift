//
//  HorizontalTextView.swift
//  HorizontalTextView
//
//  Created by Ahmed Khalaf on 3/15/19.
//  Copyright © 2019 Ahmed Khalaf. All rights reserved.
//

import UIKit

open class HorizontalTextView: UIView {
    open var attributedString = NSAttributedString(string: "") {
        didSet {
            textStorage = NSTextStorage(attributedString: attributedString)
            relayout()
        }
    }
    open var isPagingEnabled: Bool {
        set {
            scrollView.isPagingEnabled = newValue
        }
        
        get {
            return scrollView.isPagingEnabled
        }
    }
    private var textStorage = NSTextStorage(string: "")
    private lazy var layoutManager = NSLayoutManager()
    private var textContainers: [NSTextContainer] = []
    private var textViews: [UITextView] {
        return scrollView.subviews.compactMap({ $0 as? UITextView })
    }
    private var lastSize = CGSize.zero
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView(frame: .zero)
        addSubview(sv)
        return sv
    }()
    
    open override var bounds: CGRect {
        didSet {
            relayout()
        }
    }
    
    open override var frame: CGRect {
        didSet {
            relayout()
        }
    }
    
    open override func layoutSubviews() {
        scrollView.frame = bounds
    }
}

extension HorizontalTextView {
    private var size: CGSize {
        return CGSize(width: bounds.size.width, height: bounds.size.height - 10)
    }
    
    private func relayout() {
        guard lastSize != size else {
            return
        }
        defer {
            lastSize = size
        }
        
        for tv in textViews {
            tv.removeFromSuperview()
        }
        textContainers.removeAll()
        for lm in textStorage.layoutManagers {
            textStorage.removeLayoutManager(lm)
        }
        textStorage.addLayoutManager(layoutManager)
        
        for i in (0..<layoutManager.textContainers.count).reversed() {
            layoutManager.removeTextContainer(at: i)
        }
        
        addPage()
    }
    
    private func addPage() {
        let textContainer = NSTextContainer(size: size)
        textContainers.append(textContainer)
        layoutManager.addTextContainer(textContainer)
        
        // Credits for end of page check:
        // https://stackoverflow.com/a/21567835/715593
        if layoutManager.glyphRange(for: textContainer).length > 0 {
            let x = CGFloat(textContainers.count - 1) * size.width
            let textView = UITextView(frame: CGRect(origin: CGPoint(x: x, y: 0), size: size), textContainer: textContainer)
            scrollView.contentSize = CGSize(width: x + size.width, height: size.height)
            scrollView.addSubview(textView)
            addPage()
        }
    }
}