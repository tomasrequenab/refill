//
//  JuegosViewController.swift
//  Refill it!
//
//  Created by Tomas Requena Briceño on 01/30/17.
//  Copyright © 2017 Tomas Requena Briceño. All rights reserved.
//

import UIKit

class JuegosViewController: UIViewController {
    
    @IBOutlet weak var juegoLabel: UILabel!
    @IBOutlet weak var versusLabel: UILabel!

    @IBOutlet weak var printLabel: UILabel!
    
    
    var jugadorActivo: Jugador?
    var juego: Juego?
    var jugadorAleatorio: Jugador?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        repeat {
        let jugadorJuegoAleatorio = Int(arc4random_uniform(UInt32(Jugadores.count)))
        jugadorAleatorio = Jugadores[jugadorJuegoAleatorio]
        } while jugadorAleatorio === jugadorActivo
        
        //Juego Settings:
        juegoLabel.text = "Juego: \(juego!.nombre)"
        if juego!.versus {
            versusLabel.text = "\(jugadorActivo!.nombre) vs \(jugadorAleatorio!.nombre)"
        } else {
            versusLabel.text = "Todos juegan"
        }

        //Limon/MedioLimon Settings:
        if juego?.nombre == "Limón - Medio Limón" {
            switch Jugadores.count {
                case 3:
                    printLabel.text = "1 limón = \(Jugadores[0].nombre) \n \n2 limón = \(Jugadores[1].nombre) \n \n3 limón = \(Jugadores[2].nombre)"
                case 4:
                    printLabel.text = "1 limón = \(Jugadores[0].nombre) \n \n2 limón = \(Jugadores[1].nombre) \n \n3 limón = \(Jugadores[2].nombre) \n \n4 limón = \(Jugadores[3].nombre)"
                case 5:
                    printLabel.text = "1 limón = \(Jugadores[0].nombre) \n \n2 limón = \(Jugadores[1].nombre) \n \n3 limón = \(Jugadores[2].nombre) \n \n4 limón = \(Jugadores[3].nombre) \n \n5 limón = \(Jugadores[4].nombre)"
                case 6:
                    printLabel.text = "1 limón = \(Jugadores[0].nombre) \n \n2 limón = \(Jugadores[1].nombre) \n \n3 limón = \(Jugadores[2].nombre) \n \n4 limón = \(Jugadores[3].nombre) \n \n5 limón = \(Jugadores[4].nombre) \n \n6 limón = \(Jugadores[5].nombre)"
                case 7:
                    printLabel.text = "1 limón = \(Jugadores[0].nombre) \n \n2 limón = \(Jugadores[1].nombre) \n \n3 limón = \(Jugadores[2].nombre) \n \n4 limón = \(Jugadores[3].nombre) \n \n5 limón = \(Jugadores[4].nombre) \n \n6 limón = \(Jugadores[5].nombre) \n \n7 limón = \(Jugadores[6].nombre)"
                case 8:
                    printLabel.text = "1 limón = \(Jugadores[0].nombre) \n \n2 limón = \(Jugadores[1].nombre) \n \n3 limón = \(Jugadores[2].nombre) \n \n4 limón = \(Jugadores[3].nombre) \n \n5 limón = \(Jugadores[4].nombre) \n \n6 limón = \(Jugadores[5].nombre) \n \n7 limón = \(Jugadores[6].nombre) \n \n8 limón = \(Jugadores[7].nombre)"
                default:
                    print("Default Switch Limon/MedioLimon")
            }
        }
        
    }
    
    @IBOutlet weak var printer: UIButton!
    @IBAction func printerFunc(_ sender: UIButton) {
        
    }

    @IBAction func dismissView(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        print("Regreso al Juego")
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
