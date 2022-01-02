//
//  Color.swift
//  DesignerGame
//
//  Created by Андрей Бучевский on 24.10.2021.
//

import Foundation
import UIKit



protocol ColorProtocol {
    var red: Int {get set}
    var green: Int {get set}
    var blue: Int {get set}
    var generator: GeneratorProtocol {get set}
    
    func getHexValue() -> String
    func getUIColor() -> UIColor
    func getValueForLabel() -> String
   
}


class Color: ColorProtocol {
    var red: Int = 0
    var green: Int = 0
    var blue: Int = 0
    var generator: GeneratorProtocol
    var stringForLabel: String = ""
    
    
    init(generator: GeneratorProtocol) {
        self.generator = generator
    }
    
    internal func getHexValue() -> String {
        red = generator.getRandomValue()
        green = generator.getRandomValue()
        blue  = generator.getRandomValue()
        let hexRed = String(red, radix: 16).uppercased()
        let hexGreen = String(green, radix: 16).uppercased()
        let hexBlue = String(blue, radix: 16).uppercased()
        //функция записывае Hex value для лейбла, который указывает нынешний цвет
        stringForLabel = "#\(hexRed)\(hexGreen)\(hexBlue)"
        return "#\(hexRed)\(hexGreen)\(hexBlue)"
    }
    
   //Функция случайным образом выдает цвет для кнопки
    func getUIColor() -> UIColor {
        let string = getHexValue()
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        if string.hasPrefix("#") {
            let start = string.index(string.startIndex, offsetBy: 1)
            let hexColor = String(string[start...])
            
            
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            
            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                b = CGFloat((hexNumber & 0x0000ff)) / 255
                
            }
        }
        return UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1)
    }
    //Выдает Hex value с цветом, который необходимо выбрать, для лейбла
    func getValueForLabel() -> String {
        return stringForLabel
    }
    

}
