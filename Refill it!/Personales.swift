//
//  Personales.swift
//  Refill it!
//
//  Created by Tomas Requena Briceño on 12/03/16.
//  Copyright © 2016 Tomas Requena Briceño. All rights reserved.
//

import Foundation
import UIKit

class Personas {
    var nombre: String
    var indicacion: String
    var opciones: [String]
    
    init(nombre: String, indicacion: String, opciones: [String]) {
        self.nombre = nombre
        self.indicacion = indicacion
        self.opciones = opciones
    }
}

let Jefe = Personas(nombre: "El Jefe", indicacion: "Tu decides quien toma", opciones: [""])

let Compadre = Personas(nombre: "El Compadre", indicacion:"Tu decides quien toma contigo", opciones: [""])

let Mesero = Personas(nombre: "El Mesero", indicacion: "Sirvele a cada jugador un trago, incluyete en la ronda", opciones: [""])

let Senado = Personas(nombre: "El Senado", indicacion:"Somete a votación con los demas jugadores quien es:", opciones: ["\"La profesional\"","\"El loco\"","\"La Santa\"","\"El Borracho\"","\"El Cuadrao'\"", "\"El Bom Bom\"", "\"El Geek\"", "\"El Despechao'\"", "\"El Infiel\"", "\"El Pelao'\"", "\"El TMT\"", "\"El Atleta\"", "\"El papá\"", "\"La mamá\""])

let AlarmaBoom = Personas(nombre: "Alarma Boom", indicacion: "Dale start y termina tu turno, el jugador que tenga el telefono al sonar la alarma bebe", opciones: ["60", "30", "45"])

let VocalesNombre = Personas(nombre:"Vocales en Nombre", indicacion: "Toma el numero de veces que tu nombre tenga:", opciones: ["A","E","I","O", "U"])

let Cedula = Personas(nombre: "Cedula", indicacion:"Toman las personas cuya cedula termine en:", opciones: ["0 - 3", "4 - 6", "7 - 9"])

let MesNacimiento = Personas(nombre: "Mes de Nacimiento", indicacion: "Toman las personas nacidas entre los meses:", opciones: ["Enero - Marzo", "Abril - Junio", "Julio - Septiembre", "Octubre - Diciembre"])

var personales: [Personas] = [Jefe, Compadre, Mesero, Senado, AlarmaBoom, VocalesNombre, Cedula, MesNacimiento]

var personalesDescubiertas = [Personas]()

var opcionesSenadoDescubiertas = [String]()

