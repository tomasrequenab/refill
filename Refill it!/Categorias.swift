//
//  Categorias.swift
//  Refill it!
//
//  Created by Tomas Requena Briceño on 11/27/16.
//  Copyright © 2016 Tomas Requena Briceño. All rights reserved.
//

import Foundation
import UIKit

class Categoria {
    var nombre: String
    var indicacion: String
    var opciones: [String]
    
    
    init(nombre: String, indicacion: String, opciones: [String]) {
        self.nombre = nombre
        self.indicacion = indicacion
        self.opciones = opciones
    }
}

let genero = Categoria(nombre: "Sexo", indicacion:"Beben", opciones: ["los Hombres","las Mujeres"])

let preferenciaSexual = Categoria(nombre: "Preferencia Sexual", indicacion:"Las personas que sean", opciones: ["Heterosexual", "Homosexual", "Bisexual"])

let prendas = Categoria(nombre: "Prendas", indicacion:"Las personas que lleven puesto", opciones: ["BlueJean","Franela","Medias Blancas","Lentes","Reloj", "Llaves", "Camisa"])

let colorPrendas = Categoria(nombre: "Color de Prendas", indicacion:"Las personas que lleven puesto prendas", opciones: ["Negras", "Blancas", "Rojas", "Azules", "Verdes", "Marrones"])

let relaciones = Categoria(nombre: "Relaciones", indicacion:"Beben", opciones: ["los Solteros","los Novios","los Ex's","los que se dieron"])

let años = Categoria(nombre: "Años", indicacion:"Las personas entre", opciones: ["18 - 22", "23 - 27", "28 - 32", "< 33"])

let profesion = Categoria(nombre: "Profesión", indicacion:"Las personas que sean", opciones: ["Estudiantes", "Ingenieros", "Licenciados", "Abogados", "Arquitectos", "Medicos"])

let estatura = Categoria(nombre: "Estatura", indicacion:"Bebe", opciones: ["el más Alto", "el más Bajo", "el de la Mitad"])

let fumador = Categoria(nombre: "Chill", indicacion:"Beben los", opciones: ["Fumadores", "Tatuados"])

let hermanos = Categoria(nombre: "Hermanos", indicacion:"Bebe", opciones: ["el que tenga Hermanos", "el que tenga Hermanas", "el que no tenga Herman@s"])

let sistemaOperativo = Categoria(nombre: "Sistema Operativo", indicacion:"Las personas que tengan", opciones: ["iOS", "Android"])

let mascotas = Categoria(nombre: "Mascotas", indicacion:"Beben las personas", opciones: ["con Mascota", "sin Mascota"])

let bilingue = Categoria(nombre: "Bilingue", indicacion:"Bebe si eres", opciones: ["Bilingüe", "Nativo"])

var categorias: [Categoria] = [genero, preferenciaSexual, prendas, colorPrendas, relaciones, años, profesion, estatura, fumador, hermanos, sistemaOperativo, mascotas, bilingue]

var categoriasDescubiertas = [Categoria]()
