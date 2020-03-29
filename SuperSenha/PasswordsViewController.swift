//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by Glayce on 28/03/20.
//  Copyright © 2020 Glayce. All rights reserved.
//

import UIKit

class PasswordsViewController: UIViewController {
    //Controles da view
    @IBOutlet weak var tvPasswords: UITextView!
    
    //Variaveis da classe
    var numberOfCharacters: Int = 10
    var numberOfPasswords: Int = 1
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacteres: Bool!
    
    var passwordGeneretor: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Total de senhas: \(numberOfPasswords)"
        
        passwordGeneretor = PasswordGenerator(numberOfCharacters: numberOfCharacters, useLetters: useLetters, useNumbers: useNumbers, useCapitalLetters: useCapitalLetters, useSpecialCharacters: useSpecialCharacteres)
        
        generatePassword()
    }
    
    func generatePassword() {
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        tvPasswords.text = ""
        
        let passwords = passwordGeneretor.generate(total: numberOfPasswords)
        
        //Percorre as senhas e adiciona na text view
        for password in passwords {
            tvPasswords.text.append(password + "\n\n")
        }
    }
    
    
    @IBAction func generete(_ sender: UIButton) {
        generatePassword()
    }
    
}
