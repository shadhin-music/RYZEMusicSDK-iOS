//
//  String+.swift
//  Shadhin_BL-Example
//
//  Created by Maruf on 21/8/25.
//

import Foundation
import UIKit
import LinkPresentation

extension String{
    func isStringBase64() -> Bool {
        guard Data(base64Encoded: self) != nil else {
            return false
        }
        return true
    }
}
final class ShareableImage: NSObject, UIActivityItemSource {
    private let image: UIImage?
    private let title: String
    private let subtitle: URL?
    
    init(image: UIImage?, title: String, subtitle: URL? = nil) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
        
        super.init()
    }
    
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return title
    }
    //share deeplink url here
    //for testing purpose use image url
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        return subtitle?.absoluteString
    }
    
    @available(iOS 13.0, *)
    internal func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
        let metadata = LPLinkMetadata()
        
        if let image = image{
            metadata.iconProvider = NSItemProvider(object: image)
        }
        
        metadata.title = title
        if let subtitle = subtitle {
            metadata.originalURL = subtitle //URL(fileURLWithPath: subtitle)
        }
        
        return metadata
    }
}
class PhoneNumberVerify{
    static func isBanglalink(_ number : String) -> Bool{
        let phone = number.replacingOccurrences(of: "+", with: "")
        let banglalinkRegex =  "^8801[49]\\d{8}$"
        do {
            let regex = try NSRegularExpression(pattern: banglalinkRegex)
            let nsString = phone as NSString
            let results = regex.matches(in: phone, range: NSRange(location: 0, length: nsString.length))
            return !results.isEmpty
        } catch let error {
            debugPrint(error.localizedDescription)
            return false
        }
    }
}

