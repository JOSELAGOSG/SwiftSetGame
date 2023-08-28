//
//  SetModel.swift
//  SetGame
//
//  Created by José Lagos Guevara on 28-08-23.
//

import Foundation


struct SetGame<CardColor: Equatable, CardShape: Equatable, CardNumber: Equatable, CardShading: Equatable > {
    var cardDeck: Array<Card>
    var inGameCards: Array<Card>
    var selectedCards: Array<Card>
    
    // las cartas en inGameCards son removidas del cardDeck, mientras que las cartas de selectedCards son
    // una copia de algunas cartas de inGameCards (puesto que estas cartas estan seleccionadas, pero siguen en juego)
    
    // la idea es que si hay un Match de las cartas seleccionadas, tomemos el id de cada una de ellas y vayamos a removerlas del inGameCards array de alguna forma.

    init() {
        cardDeck = []
        inGameCards = []
        selectedCards = []
    }
    
    
    
    
    
    mutating func choose(_ chosenCard: Card) {
        // Primero hay que ver cuantas cartas hay ya seleccionadas
        
        if selectedCards.count == 2 {
            // Agregar la ultima carta
            selectedCards.append(chosenCard)
            
            // TODO: -Empezar a evaluar si hay match o mis-match
            var colorMatch: Bool = false
            var numberMatch: Bool = false
            var shapeMatch: Bool = false
            var shadingMatch: Bool = false
            
            
            // Evaluar Color
            if selectedCards[0].color == selectedCards[1].color && selectedCards[1].color == selectedCards[2].color {
                colorMatch = true
            } else if selectedCards[0].color != selectedCards[1].color && selectedCards[1].color != selectedCards[2].color && selectedCards[2].color != selectedCards[0].color {
                colorMatch = true
            }
            
            // Evaluar Numero
            if selectedCards[0].number == selectedCards[1].number && selectedCards[1].number == selectedCards[2].number {
                numberMatch = true
            } else if selectedCards[0].number != selectedCards[1].number && selectedCards[1].number != selectedCards[2].number && selectedCards[2].number != selectedCards[0].number {
                numberMatch = true
            }
            
            // Evaluar Forma
            if selectedCards[0].shape == selectedCards[1].shape && selectedCards[1].shape == selectedCards[2].shape {
                shapeMatch = true
            } else if selectedCards[0].shape != selectedCards[1].shape && selectedCards[1].shape != selectedCards[2].shape && selectedCards[2].shape != selectedCards[0].shape {
                shapeMatch = true
            }
            
            // Evaluar Shading
            if selectedCards[0].shading == selectedCards[1].shading && selectedCards[1].shading == selectedCards[2].shading {
                shadingMatch = true
            } else if selectedCards[0].shading != selectedCards[1].shading && selectedCards[1].shading != selectedCards[2].shading && selectedCards[2].shading != selectedCards[0].shading {
                shadingMatch = true
            }
            
            //Evaluar todo
            
            if colorMatch && numberMatch && shapeMatch && shadingMatch {
                // Las cartas conforman un SET!
            } else {
                // Las cartas no conforman un set :(
            }
                
            
            
            // Finalizar vaciando el array de cartas seleccionadas
            selectedCards = []
        } else {
            // Agregar carta al array de cartas seleccionadas
            selectedCards.append(chosenCard)
        }
    }
    
    
    
    
    struct Card: Identifiable {
        var id: Int
        
        let number: CardNumber
        let color: CardColor
        let shape: CardShape
        let shading: CardShading
    }

}


