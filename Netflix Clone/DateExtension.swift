//
//  DateExtension.swift
//  Netflix Clone
//
//  Created by Mounir Khanouri on 31/08/2023.
//

import SwiftUI

extension Date {
    
    init?(from stringDate: String, format: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        if let date = dateFormatter.date(from: stringDate) {
            self = date
        } else {
            return nil
        }
    }
    
    func string(from format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: self)
    }
}
