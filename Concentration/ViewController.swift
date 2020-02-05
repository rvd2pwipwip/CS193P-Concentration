//
//  ViewController.swift
//  Concentration
//
//  Created by Herve Desrosiers on 2020-02-02.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let borderWidth: CGFloat = 1
    private let listOfCards = ["👻", "🎃"]
    
    
    
    private var flipCount = 0 {
        didSet { // property observer
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        setCardButton()
        setCardButton1()
        setFlipCount()
    }
    
    private func setCardButton() {
        view.addSubview(cardButton)
        NSLayoutConstraint.activate([
            cardButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            cardButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            cardButton.widthAnchor.constraint(equalToConstant: 120),
            cardButton.heightAnchor.constraint(equalToConstant: 160),
        ])
    }

    private func setCardButton1() {
        view.addSubview(cardButton1)
        NSLayoutConstraint.activate([
            cardButton1.leadingAnchor.constraint(equalTo: cardButton.trailingAnchor, constant: 20),
            cardButton1.topAnchor.constraint(equalTo: cardButton.topAnchor, constant: 0),
            cardButton1.widthAnchor.constraint(equalToConstant: 120),
            cardButton1.heightAnchor.constraint(equalToConstant: 160),
        ])
    }
    
    private func setFlipCount() {
        view.addSubview(flipCountLabel)
        NSLayoutConstraint.activate([
            flipCountLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            flipCountLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            flipCountLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private let cardButton: UIButton = {
        let cb = UIButton()
        cb.translatesAutoresizingMaskIntoConstraints = false
        cb.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        cb.setTitle("", for: .normal)
        cb.titleLabel?.font = cb.titleLabel?.font.withSize(54)
        cb.addTarget(self, action: #selector(touchCard), for: .touchUpInside)
        return cb
    }()
    
    private let cardButton1: UIButton = {
        let cb = UIButton()
        cb.translatesAutoresizingMaskIntoConstraints = false
        cb.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        cb.setTitle("", for: .normal)
        cb.titleLabel?.font = cb.titleLabel?.font.withSize(54)
        cb.addTarget(self, action: #selector(touchCard1), for: .touchUpInside)
        return cb
    }()
    
    private var flipCountLabel: UILabel = {
        let fl = UILabel()
        fl.translatesAutoresizingMaskIntoConstraints = false
        fl.textAlignment = .center
        fl.textColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        fl.font = fl.font.withSize(48)
        fl.text = "Flips: 0"
        return fl
    }()
    
    @objc private func touchCard(_ sender: UIButton){ //_ because objc doesn't have external/internal parameter names
        flipCount += 1
        flipCard(withEmoji: "👻", on: sender)
        //        let cardNumber = cardButtons.firstIndex(of: sender)
        //        print("Card number = \(cardNumber)")
        //        for card in listOfCards {
        //            print(card)
        //        }
    }
    
    @objc private func touchCard1(_ sender: UIButton){
        flipCount += 1
        flipCard(withEmoji: "🎃", on: sender)
    }
    
    private func flipCard(withEmoji emoji: String, on button: UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}

