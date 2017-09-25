//
//  Jugadores.swift
//  Refill it!
//
//  Created by Tomas Requena Briceño on 11/15/16.
//  Copyright © 2016 Tomas Requena Briceño. All rights reserved.
//

import Foundation
import UIKit

class Jugador {
    var nombre: String
    var dobleTres: Bool
    
    init(nombre:String, dobleTres:Bool) {
        self.nombre = nombre
        self.dobleTres = false
    }
}

var Jugadores = [Jugador]()
var totalDeJugadores = 0
var jugadorAleatorio = 0
var jugadorDobleTres: Jugador?

