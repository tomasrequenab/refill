//  Dominoes.swift
//  Refill it!
//
//  Created by Tomas Requena Briceño on 11/15/16.
//  Copyright © 2016 Tomas Requena Briceño. All rights reserved.
//

import Foundation
import UIKit

//Clase Domino
class Domino {
    var pintaArriba: Int
    var pintaAbajo: Int
    
    init(pintaArriba: Int, pintaAbajo: Int) {
        self.pintaArriba = pintaArriba
        self.pintaAbajo = pintaAbajo
    }
}

//Instancias de Domino
let dobleBlanco = Domino(pintaArriba: 0, pintaAbajo: 0)
let blancoUno = Domino(pintaArriba: 0, pintaAbajo: 1)
let blancoDos = Domino(pintaArriba: 0, pintaAbajo: 2)
let blancoTres = Domino(pintaArriba: 0, pintaAbajo: 3)
let blancoCuatro = Domino(pintaArriba: 0, pintaAbajo: 4)
let blancoCinco = Domino(pintaArriba: 0, pintaAbajo: 5)
let blancoSeis = Domino(pintaArriba: 0, pintaAbajo: 6)

let dobleUno = Domino(pintaArriba: 1, pintaAbajo: 1)
let unoDos = Domino(pintaArriba: 1, pintaAbajo: 2)
let unoTres = Domino(pintaArriba: 1, pintaAbajo: 3)
let unoCuatro = Domino(pintaArriba: 1, pintaAbajo: 4)
let unoCinco = Domino(pintaArriba: 1, pintaAbajo: 5)
let unoSeis = Domino(pintaArriba: 1, pintaAbajo: 6)

let dobleDos = Domino(pintaArriba: 2, pintaAbajo: 2)
let dosTres = Domino(pintaArriba: 2, pintaAbajo: 3)
let dosCuarto = Domino(pintaArriba: 2, pintaAbajo: 4)
let dosCinco = Domino(pintaArriba: 2, pintaAbajo: 5)
let dosSeis = Domino(pintaArriba: 2, pintaAbajo: 6)

let dobleTres = Domino(pintaArriba: 3, pintaAbajo: 3)
let tresCuatro = Domino(pintaArriba: 3, pintaAbajo: 4)
let tresCinco = Domino(pintaArriba: 3, pintaAbajo: 5)
let tresSeis = Domino(pintaArriba: 3, pintaAbajo: 6)

let dobleCuatro = Domino(pintaArriba: 4, pintaAbajo: 4)
let cuatroCinco = Domino(pintaArriba: 4, pintaAbajo: 5)
let cuatroSeis = Domino(pintaArriba: 4, pintaAbajo: 6)

let dobleCinco = Domino(pintaArriba: 5, pintaAbajo: 5)
let cincoSeis = Domino(pintaArriba: 5, pintaAbajo: 6)

let dobleSeis = Domino(pintaArriba: 6, pintaAbajo: 6)


//Coleccion de Dominoes
var Dominoes: [Domino] = [dobleBlanco, blancoUno, blancoDos, blancoTres, blancoCuatro, blancoCinco, blancoSeis, dobleUno, unoDos, unoTres, unoCuatro, unoCinco, unoSeis, dobleDos, dosTres, dosCuarto, dosCinco, dosSeis, dobleTres, tresCuatro, tresCinco, tresSeis, dobleCuatro, cuatroCinco, cuatroSeis, dobleCinco, cincoSeis, dobleSeis]
var DominoesDescubiertos = [Domino]()

