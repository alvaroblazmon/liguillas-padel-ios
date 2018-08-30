//
//  Helpers.swift
//  LiguillasPadel
//
//  Created by Alvaro Blazquez on 30/8/18.
//  Copyright © 2018 Alvaro Blazquez Montero. All rights reserved.
//

import UIKit

extension String {
    /// Returns a new string made from the receiver by replacing all characters not in urlHostAllowed
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    /// Convert String to Data with UTF8 Encode
    /// - returns: Data UTF8 Encode
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
    
    /// - returns: First Character of String, formatted without Accents and the numbers will be #
    var formattedFirstChar: Character {
        let folding = self.folding(options: .diacriticInsensitive, locale: .current).uppercased()
        guard let char = folding.first else {
            return Character("-")
        }
        
        if Int(String(char)) != nil {
            return "#"
        }
        
        return char
    }
    
    var normalized: String {
        return self.folding(options: .diacriticInsensitive, locale: .current).uppercased()
    }
    
    func toDate(dateFormat: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "es")
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.date(from: self)
    }
    
    func bold(text: String, sizeFont: CGFloat) -> NSMutableAttributedString {
        let range = (self as NSString).range(of: text)
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(NSAttributedStringKey.font, value: UIFont.boldSystemFont(ofSize: sizeFont), range: range)
        return attributedString
    }
    
}

extension Int {
    /// - returns: Return a string with stars
    var stars: String {
        switch self {
        case 0:
            return "☆☆☆☆☆"
        case 1:
            return "★☆☆☆☆"
        case 2:
            return "★★☆☆☆"
        case 3:
            return "★★★☆☆"
        case 4:
            return "★★★★☆"
        case 5:
            return "★★★★★"
        default:
            return "☆☆☆☆☆"
        }
    }
}

extension Date {
    
    func toString(dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        return dateFormatter.string(from: self)
    }
    
}

extension UIScrollView {
    
    /// Scroll to a specific view so that it's top is at the top our scrollview
    func scrollToView(view: UIView, animated: Bool) {
        if let origin = view.superview {
            let frame = view.frame
            if self.bounds.origin.y > (frame.origin.y - frame.size.height) {
                let childStartPoint = origin.convert(view.frame.origin, to: self)
                self.setContentOffset(CGPoint(x: 0, y: childStartPoint.y - (view.frame.height/2)), animated: animated)
            }
        }
    }
}

extension UIViewController {
    
    func configureShowKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
            let value = userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue else {
                return
        }
        var keyboardFrame = value.cgRectValue
        keyboardFrame = view.convert(keyboardFrame, from: nil)
        
        var frame = view.frame
        frame.origin.y = -keyboardFrame.size.height
        view.frame = frame
        
    }
    
    @objc func keyboardHide(notification: NSNotification) {
        var frame = view.frame
        frame.origin.y = 0
        view.frame = frame
    }
}

extension Array {
    subscript(guarded idx: Int) -> Element? {
        guard (startIndex..<endIndex).contains(idx) else {
            return nil
        }
        return self[idx]
    }
}

extension Array where Element: Numeric {
    var total: Element { return reduce(0, +) }
}

extension Array where Element: BinaryInteger {
    var average: Double {
        return isEmpty ? 0 : Double(Int(total)) / Double(count)
    }
}

extension Array where Element: FloatingPoint {
    var average: Element {
        return isEmpty ? 0 : total / Element(count)
    }
}

func iterateEnum<T: Hashable>(_: T.Type) -> AnyIterator<T> {
    var byte = 0
    return AnyIterator {
        let next = withUnsafeBytes(of: &byte) { $0.load(as: T.self) }
        if next.hashValue != byte { return nil }
        byte += 1
        return next
    }
}

func += <K, V> (left: inout [K: V], right: [K: V]) {
    for (key, value) in right {
        left[key] = value
    }
}

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}
