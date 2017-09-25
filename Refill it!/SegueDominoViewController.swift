//
//  SegueDominoViewController.swift
//  Refill it!
//
//  Created by Tomas Requena Briceño on 11/22/16.
//  Copyright © 2016 Tomas Requena Briceño. All rights reserved.
//

import UIKit

class SegueDominoViewController: UIViewController {

    @IBOutlet weak var pintaSegueLabel: UILabel!
    @IBOutlet weak var tipoLabel: UILabel!
    @IBOutlet weak var indicacionLabel: UILabel!
    @IBOutlet weak var detalleLabel: UILabel!
    @IBOutlet weak var dissmissButton: UIButton!
    @IBOutlet weak var optionalButton: UIButton!
    
    var jugadorActivo: Jugador?
    var pinta: Int?
    
    //Timer
    var temporizador = Timer()
    var segundos: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pintaSegueLabel.text = "\(pinta!)"
        optionalButton.isHidden = true
        
        if persona?.nombre == "Alarma Boom" {
            segundos = Int(configurarPersonales())
        }
        
        if pinta == Int("5") {
            optionalButton.isHidden = false
            optionalButton.setTitle("Reto Aleatorio", for: .normal)
            optionalButton.isEnabled = true
        }
        
        configurarSegue()
    }
    
    
    //Ocultar SegueViewController:
    @IBAction func dismissSegue(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        print("Regreso al Juego")
        if dissmissButton.currentTitle == "Start" {
            print("Comienza Alarma Boom")
            temporizador = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SegueDominoViewController.alarmaCounter), userInfo: nil, repeats: true)
        }
    }
    
    //Retos Aleatorios
    @IBAction func optionalFunction(_ sender: UIButton) {
        if pinta == Int("5") {
            let retoAleatorio = Int(arc4random_uniform(UInt32(retos.count)))
            let retoSeleccionado = retos[retoAleatorio]
            retos.remove(at: retoAleatorio)
            retosDescubiertos.append(retoSeleccionado)
            optionalButton.setTitle("\(retoSeleccionado)", for: .disabled)
            optionalButton.isEnabled = false
        }
    }
    
    
    //Indicacion Pinta 0: Categorias
    var categoria: Categoria?
    func configurarCategoria() -> String {
        let opcionAleatoria = Int(arc4random_uniform(UInt32((categoria?.opciones.count)!)))
        let opcionSeleccionada = categoria?.opciones[opcionAleatoria]
        
        switch opcionSeleccionada! {
        case "Bisexual":
            detalleLabel.text = "2 tragos por ambos Sexos"
        case "Negras", "Blancas", "Azules", "Rojas", "Verdes", "Marrones":
            detalleLabel.text = "Nº de Tragos = Nº de Prendas del Color"
        case "los Ex's":
            detalleLabel.text = "Nº de Tragos = Nº de Ex's presentes"
        case "los que se dieron":
            detalleLabel.text = "Nº de Tragos = Nº de Daleras presentes"
        case "el que tenga Hermanos":
            detalleLabel.text = "Nº de Tragos = Nº de Hermanos"
        case "el que tenga Hermanas":
            detalleLabel.text = "Nº de Tragos = Nº de Hermanas"
        case "Con Mascota":
            detalleLabel.text = "Nº de Tragos = Nº de Mascotas"
        case "Bilingüe":
            detalleLabel.text = "Nº de Tragos = Nº de Idiomas"
        case "Nativo":
            detalleLabel.text = "Solo el lenguaje Natal"
        default:
            detalleLabel.text = ""
        }
        return opcionSeleccionada!
    }

    
    
    //Indicacion Pinta 1: A la Derecha
    func jugadorDerecha(posicionJugador: Int) -> Jugador {
        var posicionDerecha: Int?
        if jugadorAleatorio == Jugadores.count - 1 {
            posicionDerecha = 0
        } else {
            posicionDerecha = posicionJugador + 1
        }
        return Jugadores[posicionDerecha!]
    }
    
    
    
    //Indicacion Pinta 2: A la Izquierda
    func jugadorIzquierda(posicionJugador: Int) -> Jugador {
        var posicionIzquierda: Int?
        if jugadorAleatorio == 0 {
            posicionIzquierda = Jugadores.count - 1
        } else {
            posicionIzquierda = posicionJugador - 1
        }
        return Jugadores[posicionIzquierda!]
    }
    
    
    
    //Indicacion Pinta 6: Personales
    var persona: Personas?
    func configurarPersonales() -> String {
        let opcionAleatoria = Int(arc4random_uniform(UInt32((persona?.opciones.count)!)))
        let opcionSeleccionada = persona?.opciones[opcionAleatoria]
        return opcionSeleccionada!
    }
    
    
    @objc func alarmaCounter() {
        segundos! -= 1
        print(segundos!)
        if segundos == 0 {
            temporizador.invalidate()
            print("ALARMAAAA BOOOOOOM")
           /*let alarmaBoom = UIAlertController(title: "Alarma Boom", message: "\(jugadorActivo!.nombre) bebe", preferredStyle: .alert)
            let accionDefault = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
            alarmaBoom.addAction(accionDefault)
            present(alarmaBoom, animated: true, completion: nil)*/
        }
    }
    

    
    //SegueViewController Setting:
    func configurarSegue() {
        switch pinta! {
            
        case 0:
            self.view.backgroundColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1)
            tipoLabel.text = "Categoria: \(categoria!.nombre)"
            indicacionLabel.text = "\(categoria!.indicacion) \(configurarCategoria())"
   
        case 1:
            self.view.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.55, alpha: 1)
            tipoLabel.text = "A la Derecha"
            indicacionLabel.text = "Bebe \(jugadorDerecha(posicionJugador: jugadorAleatorio).nombre)"
            detalleLabel.text = ""

        case 2:
            self.view.backgroundColor = UIColor(red: 0.65, green: 0.0, blue: 0.0, alpha: 1)
            tipoLabel.text = "A la Izquierda"
            indicacionLabel.text = "Bebe \(jugadorIzquierda(posicionJugador: jugadorAleatorio).nombre)"
            detalleLabel.text = ""
            
        case 3:
            self.view.backgroundColor = UIColor(red: 1.0, green: 0.85, blue: 0.0, alpha: 1)
            pintaSegueLabel.textColor = UIColor.black
            tipoLabel.textColor = UIColor.black
            tipoLabel.text = "Doble Tres"
            indicacionLabel.textColor = UIColor.black
            indicacionLabel.text = "Bebe \(jugadorDobleTres!.nombre)"

        case 4:
            self.view.backgroundColor = UIColor(red: 0.0, green: 0.55, blue: 0.0, alpha: 1)
            tipoLabel.text = "Juegos"
            indicacionLabel.text = "Bebe Jugador que pierde el Juego"
 
        case 5:
            self.view.backgroundColor = UIColor(red: 0.25, green: 0.0, blue: 0.4, alpha: 1)
            tipoLabel.text = "Verdad o Reto"
            indicacionLabel.text = "Verdad : Publicala en una red social \n Reto: Definanlo o saca un aleatorio \n ¡Quien no cumpla, bebe!"
            detalleLabel.text = "Retos aleatorios publicalos en las redes"

        case 6:
            self.view.backgroundColor = UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1)
            tipoLabel.text = "Personales: \(persona!.nombre)"
            indicacionLabel.text = "\(persona!.indicacion)"
            if persona?.nombre == "Alarma Boom" {
                dissmissButton.setTitle("Start", for: .normal)
                detalleLabel.text = "\(segundos!)"
            } else {
            detalleLabel.text = "\(configurarPersonales())"
            }

        default:
            print("Default Switch Statement Configurar Segue")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
