//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by Glayce on 28/03/20.
//  Copyright © 2020 Glayce. All rights reserved.
//

import Foundation

class PasswordGenerator {
    var numberOfCharacters: Int
    var useLetters: Bool
    var useNumbers: Bool
    var useCapitalLetters: Bool
    var useSpecialCharacters: Bool
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let specialCharacters = "!@#$%ˆ&*()_-+=~'|]}[{`:;?/<>.,"
    private let numbers = "0123456789"
    
    init(numberOfCharacters: Int, useLetters: Bool, useNumbers: Bool, useCapitalLetters: Bool, useSpecialCharacters: Bool) {
        
        var numChars = min(numberOfCharacters, 16)
        numChars = max(numChars, 1)
        
        self.numberOfCharacters = numChars
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialCharacters = useSpecialCharacters
    }
    
    func generate(total: Int) -> [String] {
        //Limpa o array
        passwords.removeAll()
        
        var universe: String = ""
        
        if useLetters {
            universe += letters
        }
        
        if useNumbers {
            universe += numbers
        }
        
        if useSpecialCharacters {
            universe += specialCharacters
        }
        
        if useCapitalLetters {
            universe += letters.uppercased()
        }
        
        //Contem todas os caracteres para gerar a senha convertendo para array
        let universeArray = Array(universe)
        
        //Loop pela quantidade de senhas que foi passada
        while passwords.count < total {
            var password = ""
            
            //Loop pelo numero de caracteres que pode ter na senha
            for _ in 1...numberOfCharacters {
                //Obtem um indice aleatorio dentro do array
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                
                //Adiciona na string o caracter obtido
                password += (String(universeArray[index]))
            }
            
            //Adiciona na array de passwords os caracteres adicionados na string
            passwords.append(password)
        }
        
        return passwords
    }
}
