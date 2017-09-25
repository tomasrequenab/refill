//
//  Juegos.swift
//  Refill it!
//
//  Created by Tomas Requena Briceño on 01/31/17.
//  Copyright © 2017 Tomas Requena Briceño. All rights reserved.
//

import Foundation
import UIKit

class Juego {
    
    var nombre: String
    var opciones: [String]
    var versus: Bool
    
    init(name: String, options: [String], versus: Bool) {
        nombre = name
        opciones = options
        self.versus = versus
    }
}

//Juegos:
var medioLimon = Juego(name: "Limón - Medio Limón", options: [""], versus: false)

var culturaChupistica = Juego(name: "Cultura Chupistica", options: ["Capitales del Mundo", "Elementos de la Tabla Periodica", "Marcas de Carro", "Marcas de Licor", "Tipos de Licor", "Cadenas de Comida Rapida", "Ganadores del Oscar", "Series de TV", "Marcas de Celulares", "Razas de Perro", "Multiplos del Nº", "Paises de Europa", "Paises de Africa", "Paises de Asia", "Dioses Griegos", "Dioses Egipcios", "Generos de Música", "Nombres de Deportes", "Huesos del Cuerpo", "Organos del Cuerpo", "Equipos de Futbol", "Equipos de Basket", "Equipos de Baseball", "Nombres de Colores", "Posiciones del Kamasutra", "Superheroes de Marvel", "Superheroes de DC", "Pintores Famosos", "Princesas de Disney", "Verduras", "Frutas", "Peliculas con Secuela", "Cantantes Femeninas", "Estrellas del Deporte", "Nombres de Idiomas", "Genios de la Historia", "Nombres de Herramientas", "Nombres de Profesiones", "Tipos de Flores", "", "", "", "", ""], versus: false)

var pareNone = Juego(name: "Par o Impar", options: [""], versus: true)

var caraSello = Juego(name: "Cara o Sello", options: [""], versus: true)

var piedraPapelTijeras = Juego(name: "Piedra, Papel o Tijeras", options: [""], versus: true)

var dueloEtilico = Juego(name: "Duelo Etilico", options: [""], versus: true)

var mayorMenor = Juego(name: "Mayor o Menor Q\'", options: ["1", "100"], versus: false)

var miBaul = Juego(name: "En mi Baúl", options: [""], versus: false)

var abogado = Juego(name: "El Abogado", options: [""], versus: false)

var encadenados = Juego(name: "Encadenados", options: ["Albañil","Bandera", "Constelación","Destornillador", "Embarcadero", "Fuck"], versus: false)

var poeta = Juego(name: "El Poeta", options: [""], versus: false)

var charadas = Juego(name: "Charadas", options: ["Italia", "Biblioteca", "Circo", "Universidad", "Estadio", "Inglaterra", "Argentina", "Torre Eiffel", "Piramides de Egipto", "Mar Caribe", "Estatua de la Liberta", "New York", "Muralla China", "India", "Piscina", "Gimnasio", "Venecia", "Árbol", "Microfono", "Corazón", "Computadora", "Ojo", "Lampara", "Libro", "Avión", "Martillo", "Pasta", "Pizza", "Archivo", "Lego", "Bombillo", "Llave", "Harry Potter", "Homero Simpson", "Simón Bolivar", "Michael Jackson", "Morgan Freeman", "Cleopatra", "Napoleón Bonaparte", "Zeus", "Adolf Hitler", "Steve Jobs", "Jon Snow", "Timmy Turner", "Darth Vader", "Albert Einstein", "Cristóbal Colón", "Leonardo Da Vinci", "Bob Marley", "Moneda", "Palacio",  "Barack Obama", "Aeropuerto", "Mujer", "Estrella", "Rosa", "Jardin", "Cepillo de Dientes", "", "", "", "", "", "", "", ""], versus: false)

//Colecciones:
var juegos = [medioLimon, culturaChupistica, pareNone, caraSello, piedraPapelTijeras, dueloEtilico, mayorMenor, miBaul, abogado, encadenados, poeta, charadas]

var juegosDescubiertos = [Juego]()
