//
//  Generator.swift
//  DesignerGame
//
//  Created by Андрей Бучевский on 27.09.2021.
//

import Foundation

protocol GeneratorProtocol {
    var startPoint: Int {get set}
    var endPoint: Int {get set}
    func getRandomValue() -> Int
}


class Generator: GeneratorProtocol {
    var startPoint: Int
    var endPoint: Int
    
    init(startPoint: Int, endPoint: Int) {
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    func getRandomValue() -> Int {
        Int.random(in: startPoint...endPoint)
    }
}
