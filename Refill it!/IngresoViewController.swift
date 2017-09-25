//
//  ViewController.swift
//  Refill it!
//
//  Created by Tomas Requena Briceño on 09/16/16.
//  Copyright © 2016 Tomas Requena Briceño. All rights reserved.
//

import UIKit


class IngresoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    //Outlets
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var indicacionLabel: UILabel!
    @IBOutlet weak var pickerNumeroJugadores: UIPickerView!
    @IBOutlet weak var stackNombreJugador: UIStackView!
    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var jugador1: UILabel!
    @IBOutlet weak var jugador2: UILabel!
    @IBOutlet weak var jugador3: UILabel!
    @IBOutlet weak var jugador4: UILabel!
    @IBOutlet weak var jugador5: UILabel!
    @IBOutlet weak var jugador6: UILabel!
    @IBOutlet weak var jugador7: UILabel!
    @IBOutlet weak var jugador8: UILabel!
    
    
    
    //Propiedades y Colecciones Internas
    var numeroJugadores = [3, 4, 5, 6, 7, 8]
    var selectedRow = 0
    
    
    
    //ViewDidLoad
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        pickerNumeroJugadores.delegate = self
        pickerNumeroJugadores.dataSource = self
        nombreTextField.delegate = self
        setColoresLabel()
        ocultarEntradaNombreJugadores()

    }
    
    
    
    //PickerView DataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numeroJugadores.count
    }
    
    //PickerView Delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(numeroJugadores[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = row
    }
    
    
    
    //Refill Button: Ingreso Numero de Jugadores y Confirmacion de Nombres --> Pase de Vista
    @IBAction func refillIt(_ sender: UIButton) {
        
        if pickerNumeroJugadores.isHidden == false {
            
            totalDeJugadores = numeroJugadores[selectedRow]
            jugadorAleatorio = Int(arc4random_uniform(UInt32(totalDeJugadores)))
            pickerNumeroJugadores.isHidden = true
            stackNombreJugador.isHidden = false
            indicacionLabel.text = "Ingresa los nombres de los Jugadores:"
            print("Numero de Jugadores: \(totalDeJugadores)")
            print("Jugador Aleatorio: \(jugadorAleatorio)")
            print("------------")
            
        } else {
    
            if Jugadores.count == totalDeJugadores {
                
                let controller: DominoesViewController
                controller = self.storyboard?.instantiateViewController(withIdentifier: "DominoesViewController") as! DominoesViewController
                present(controller, animated: true, completion: nil)
                for (index, jugador) in Jugadores.enumerated() {
                    print("\(index). \(jugador.nombre)")
                }
                print("------------")
            
            } else {
                
                let alertaFaltanJugadores = UIAlertController(title: "Faltan Jugadores", message: "Complete la lista de Jugadores", preferredStyle: .alert)
                let accionDefault = UIAlertAction(title: "De Acuerdo", style: .default, handler: nil)
                alertaFaltanJugadores.addAction(accionDefault)
                present(alertaFaltanJugadores, animated: true, completion: nil)
            }
        }
    }
    
    
    
    //Ok Button: Ingreso Nombres de Jugadores
    @IBAction func ingresarNombre(_ sender: UIButton) {
        
        let nombreEntrada = nombreTextField.text
        
        if Jugadores.count == totalDeJugadores {
            
            let alertaTotalJugadores = UIAlertController(title: "Listos para Jugar", message: "Ya ingresaste el total de Jugadores", preferredStyle: .alert)
            let accionDefault = UIAlertAction(title: "Ok", style: .cancel, handler: { (accionDefault) in
                self.stackNombreJugador.isHidden = true
                self.indicacionLabel.text = "¿Listos para Jugar?"
                })
            alertaTotalJugadores.addAction(accionDefault)
            present(alertaTotalJugadores, animated: true, completion: nil)
            
        } else {
            
            if nombreEntrada == nil || nombreEntrada == "" || nombreEntrada == " " {
                
                let alertaIngresaNombre = UIAlertController(title: "Campo Vacío", message: "Ingresa el nombre del Jugador", preferredStyle: .alert)
                let accionDefault = UIAlertAction(title: "De Acuerdo", style: .destructive, handler: nil)
                alertaIngresaNombre.addAction(accionDefault)
                present(alertaIngresaNombre, animated: true, completion: nil)
                
            } else {
                
                Jugadores.append(crearJugador(nombre: nombreTextField.text!, dobleTres: false))
                mostrarNombres()
                nombreTextField.text = nil
                
            }
        }
    }
    
    
    
    //Ocultar TextField y Nombres de Jugadores
    func ocultarEntradaNombreJugadores() {
        stackNombreJugador.isHidden = true
        jugador1.isHidden = true
        jugador2.isHidden = true
        jugador3.isHidden = true
        jugador4.isHidden = true
        jugador5.isHidden = true
        jugador6.isHidden = true
        jugador7.isHidden = true
        jugador8.isHidden = true
    }
    
    
    
    //Crear Instancias del Jugador
    func crearJugador (nombre:String, dobleTres:Bool) -> Jugador {
        let jugador = Jugador(nombre: nombreTextField.text!, dobleTres: false)
        return jugador
    }
    
    
    
    //Mostrar Nombres en Pantalla
    func mostrarNombres() {
        switch Jugadores.count {
        case 1:
            jugador1.text = Jugadores[0].nombre
            jugador1.isHidden = false
        case 2:
            jugador2.text = Jugadores[1].nombre
            jugador2.isHidden = false
        case 3:
            jugador3.text = Jugadores[2].nombre
            jugador3.isHidden = false
        case 4:
            jugador4.text = Jugadores[3].nombre
            jugador4.isHidden = false
        case 5:
            jugador5.text = Jugadores[4].nombre
            jugador5.isHidden = false
        case 6:
            jugador6.text = Jugadores[5].nombre
            jugador6.isHidden = false
        case 7:
            jugador7.text = Jugadores[6].nombre
            jugador7.isHidden = false
        case 8:
            jugador8.text = Jugadores[7].nombre
            jugador8.isHidden = false
        default:
            print("Default Switch Statement MostrarNombres IngresoView")
        }
    }
    
    
    
    //Mostrar Colores de Nombres
    func setColoresLabel() {
        jugador1.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.55, alpha: 1)
        jugador2.backgroundColor = UIColor(red: 0.65, green: 0.0, blue: 0.0, alpha: 1)
        jugador3.backgroundColor = UIColor(red: 1.0, green: 0.85, blue: 0.0, alpha: 1)
        jugador4.backgroundColor = UIColor(red: 0.0, green: 0.55, blue: 0.0, alpha: 1)
        jugador5.backgroundColor = UIColor(red: 0.25, green: 0.0, blue: 0.4, alpha: 1)
        jugador6.backgroundColor = UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1)
        jugador7.backgroundColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1)
        jugador8.backgroundColor = UIColor(red: 0.2, green: 0.15, blue: 0.0, alpha: 1)
    }
    
    
    
    //Keyboard Settings
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let nombreEntrada = textField.text
        
        if Jugadores.count == totalDeJugadores {
            
            let alertaTotalJugadores = UIAlertController(title: "Listos para Jugar", message: "Ya ingresaste el total de Jugadores", preferredStyle: .alert)
            let accionDefault = UIAlertAction(title: "Ok", style: .cancel, handler: { (accionDefault) in
                self.stackNombreJugador.isHidden = true
                self.indicacionLabel.text = "¿Listos para Jugar?"
                textField.resignFirstResponder()
            })
            alertaTotalJugadores.addAction(accionDefault)
            present(alertaTotalJugadores, animated: true, completion: nil)
            
        } else if Jugadores.count < totalDeJugadores {
            
            if nombreEntrada == nil || nombreEntrada == "" || nombreEntrada == " " {
                
                let alertaIngresaNombre = UIAlertController(title: "Campo Vacío", message: "Ingresa el nombre del Jugador", preferredStyle: .alert)
                let accionDefault = UIAlertAction(title: "De Acuerdo", style: .destructive, handler: nil)
                alertaIngresaNombre.addAction(accionDefault)
                present(alertaIngresaNombre, animated: true, completion: nil)
                
            } else {
                
                Jugadores.append(crearJugador(nombre: nombreTextField.text!, dobleTres: false))
                mostrarNombres()
                nombreTextField.text = nil
                
            }
        }
        
        return true
    }

//Final
}

