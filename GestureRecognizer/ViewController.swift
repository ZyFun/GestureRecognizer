//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Дмитрий Данилин on 25.07.2020.
//  Copyright © 2020 Дмитрий Данилин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipesObservers()
        tapObservers()
    }

    
    // Метод для отслеживания жестов (свайпов)
    func swipesObservers() {
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    // Метод для отслеживания тапов
    func tapObservers() {
        
        let trippleTap = UITapGestureRecognizer(target: self, action: #selector(trippleTapAction))
        trippleTap.numberOfTapsRequired = 3
        self.view.addGestureRecognizer(trippleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapAction))
        // Игнорируем код, если было 3 тапа
        doubleTap.require(toFail: trippleTap)
        doubleTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTap)
    }
    
    // Метод, который определяет действие при определенном свайпе
    @objc func handleSwipes(gester: UISwipeGestureRecognizer) {
        
        switch gester.direction {
        case .right:
        label.text = "Правый свайп был распознан"
        case .left:
        label.text = "Левый свайп был распознан"
        case .up:
        label.text = "Свайп вверх был распознан"
        case .down:
        label.text = "Свайп вниз был распознан"
        default:
            break
        }
    }
    
    @objc func trippleTapAction() {
        label.text = "Тройной тап распознан"
    }
    
    @objc func doubleTapAction() {
        label.text = "Двойной тап распознан "
    }

}

