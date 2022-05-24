//
//  HelpPageCard.swift
//  LogicAdemy
//
//  Created by jpcm2 on 16/05/22.
//
import UIKit
import Foundation

class HelpPageCard {
    let title: String
    let description: String
    let bgColor: UIColor
    let fontColor: UIColor
    
    init(title: String, description: String, bgColor: UIColor, fontColor: UIColor){
        self.title = title
        self.description = description
        self.bgColor = bgColor
        self.fontColor = fontColor
    }
}
