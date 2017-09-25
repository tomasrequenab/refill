//
//  DominoesViewController.swift
//  Refill it!
//
//  Created by Tomas Requena Briceño on 09/16/16.
//  Copyright © 2016 Tomas Requena Briceño. All rights reserved.
//

import UIKit

class DominoesViewController: UIViewController {

    
    //Outlets
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var nombreJugador: UILabel!
    @IBOutlet weak var separadorPintas: UILabel!
    @IBOutlet weak var changingLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var pintaArribaButton: UIButton!
    @IBOutlet weak var pintaAbajoButton: UIButton!

    
    
    //Propiedades:
    var estadoDelJuego = false
    
    
    
    //ViewDidLoad
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        nombreJugador.text = Jugadores[jugadorAleatorio].nombre
        mostrarNombre()
        changingLabel.isHidden = true
        playButton.isHidden = true
        restartButton.isHidden = true
        pintaArribaButton.isEnabled = false
        pintaAbajoButton.isEnabled = false
        
    }
    
    
    
    //RefillButton Setting:
    @IBAction func mostrarDominoes(_ sender: UIButton) {
        
        let limiteJugadores = Jugadores.count - 1
        let dominoAleatorio = Int(arc4random_uniform(uint(Dominoes.count)))
        let dominoAzar = Dominoes[dominoAleatorio]
        
        if pintaArribaButton.currentTitle == nil || pintaAbajoButton.currentTitle == "" {
            
            pintaArribaButton.setTitle(String(dominoAzar.pintaArriba), for: .normal)
            pintaAbajoButton.setTitle(String(dominoAzar.pintaAbajo), for: .normal)
            Dominoes.remove(at: dominoAleatorio)
            DominoesDescubiertos.append(dominoAzar)
            
        } else {
            
            if jugadorAleatorio == limiteJugadores {
                
                jugadorAleatorio = 0
                nombreJugador.text = Jugadores[jugadorAleatorio].nombre
                mostrarNombre()
                pintaArribaButton.setTitle(String(dominoAzar.pintaArriba), for: .normal)
                pintaAbajoButton.setTitle(String(dominoAzar.pintaAbajo), for: .normal)
                Dominoes.remove(at: dominoAleatorio)
                DominoesDescubiertos.append(dominoAzar)
                
            } else {
                
                jugadorAleatorio += 1
                nombreJugador.text = Jugadores[jugadorAleatorio].nombre
                mostrarNombre()
                pintaArribaButton.setTitle(String(dominoAzar.pintaArriba), for: .normal)
                pintaAbajoButton.setTitle(String(dominoAzar.pintaAbajo), for: .normal)
                Dominoes.remove(at: dominoAleatorio)
                DominoesDescubiertos.append(dominoAzar)
    
            }
        }
        
         if (dominoAzar.pintaArriba == 3 && dominoAzar.pintaAbajo == 3) && estadoDelJuego == false {
            
            homeButton.isEnabled = false
            playButton.isHidden = false
            
            changingLabel.text = "Eres el Doble 3"
            changingLabel.isHidden = false
            
            Jugadores[jugadorAleatorio].dobleTres = true
            jugadorDobleTres = Jugadores[jugadorAleatorio]
            print("\(Jugadores[jugadorAleatorio].nombre) es el dobleTres")
            
         }
        
        if estadoDelJuego {
            pintaArribaButton.isEnabled = true
            pintaAbajoButton.isEnabled = true
        }
        
        if estadoDelJuego == true && Dominoes.count == 0 {
            
            homeButton.isEnabled = false
            playButton.isHidden = false
            restartButton.isHidden = false
            
            changingLabel.text = "Game Over"
            changingLabel.isHidden = false
            
            jugadorDobleTres?.dobleTres = false
            jugadorDobleTres = nil
    
            estadoDelJuego = false
            print("Game Over")
            
        }
 
        print("\(Jugadores[jugadorAleatorio].nombre) saco: \(dominoAzar.pintaArriba) | \(dominoAzar.pintaAbajo)")
        print("Dominoes Totales: \(Dominoes.count)")
        print("Han salido \(DominoesDescubiertos.count) Dominoes")
        print("------------")
        

    }
    
    
    
    //PlayButton Setting:
    @IBAction func comenzarJuego(_ sender: UIButton) {
        
        switch playButton.currentTitle! {
        
        case "Play It":
            estadoDelJuego = true
            pintaArribaButton.isEnabled = true
            pintaAbajoButton.isEnabled = true
            playButton.setTitle("Play Again", for: .normal)
            print("Game Begins")
        
        case "Play Again":
            pintaArribaButton.isEnabled = false
            pintaAbajoButton.isEnabled = false
            playButton.setTitle("Play It", for: .normal)
            print("Game Again")
        
        default:
            print("Default Switch Statement PlayButton")
        }
   
        configurarDominoes()
        reiniciarCategorias()
        reiniciarJuegos()
        reiniciarRetos()
        reiniciarPersonales()
        
        changingLabel.isHidden = true
        playButton.isHidden = true
        restartButton.isHidden = true
        homeButton.isEnabled = true
        
        pintaArribaButton.setTitle(nil, for: .normal)
        pintaAbajoButton.setTitle(nil, for: .normal)
        print("Estado del Juego: \(estadoDelJuego ? "Activo" : "No Activo")")
        print("------------")
    }
    
    
    
    //RestartButton Setting:
    @IBAction func reiniciarJuego(_ sender: UIButton) {
        
        estadoDelJuego = false
        
        configurarDominoes()
        reiniciarCategorias()
        reiniciarJuegos()
        reiniciarRetos()
        reiniciarPersonales()
        Jugadores.removeAll()
        
        pintaArribaButton.isEnabled = false
        pintaAbajoButton.isEnabled = false
        
        pintaArribaButton.setTitle(nil, for: .normal)
        pintaAbajoButton.setTitle(nil, for: .normal)
        
        print("Restart Game")
        print("Estado del Juego: \(estadoDelJuego ? "Activo" : "No Activo")")
        print("------------")
        
    }
    
    
    
    //Configurar Colecciones por Default
    func configurarDominoes() {
        Dominoes = [dobleBlanco, blancoUno, blancoDos, blancoTres, blancoCuatro, blancoCinco, blancoSeis, dobleUno, unoDos, unoTres, unoCuatro, unoCinco, unoSeis, dobleDos, dosTres, dosCuarto, dosCinco, dosSeis, dobleTres, tresCuatro, tresCinco, tresSeis, dobleCuatro, cuatroCinco, cuatroSeis, dobleCinco, cincoSeis, dobleSeis]
        DominoesDescubiertos.removeAll()
    }
    
    func reiniciarCategorias() {
        categorias = [genero, preferenciaSexual, prendas, colorPrendas, relaciones, años, profesion, estatura, fumador, hermanos, sistemaOperativo, mascotas, bilingue]
        categoriasDescubiertas.removeAll()
        
    }
    
    func reiniciarRetos(){
        retos = ["Invitación del juego", "Presentate al mundo", "Imita a un famoso", "Haz una onomatopeya", "Canta un exito", "Pide perdón a alguien", "Declarale el amor a alguien", "Canta Feliz Cumpleaños a alguien", "Echa un chistecito"]
        retosDescubiertos.removeAll()
    }
    
    func reiniciarPersonales() {
        personales = [Jefe, Compadre, Senado, AlarmaBoom, VocalesNombre, Cedula, MesNacimiento]
        personalesDescubiertas.removeAll()
    }
    
    func reiniciarJuegos() {
        juegos = [medioLimon, culturaChupistica, pareNone, caraSello, piedraPapelTijeras, dueloEtilico, mayorMenor, miBaul, abogado, encadenados, poeta, charadas]
        juegosDescubiertos.removeAll()
    }
    
    
    //Mostrar nombres de Jugadores
    func mostrarNombre () {
        
        switch jugadorAleatorio {
        case 0:
            nombreJugador.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.55, alpha: 1)
            nombreJugador.textColor = UIColor.white
        case 1:
            nombreJugador.backgroundColor = UIColor(red: 0.65, green: 0.0, blue: 0.0, alpha: 1)
            nombreJugador.textColor = UIColor.white
        case 2:
            nombreJugador.backgroundColor = UIColor(red: 1.0, green: 0.85, blue: 0.0, alpha: 1)
            nombreJugador.textColor = UIColor.black
        case 3:
            nombreJugador.backgroundColor = UIColor(red: 0.0, green: 0.55, blue: 0.0, alpha: 1)
            nombreJugador.textColor = UIColor.white
        case 4:
            nombreJugador.backgroundColor = UIColor(red: 0.25, green: 0.0, blue: 0.4, alpha: 1)
            nombreJugador.textColor = UIColor.white
        case 5:
            nombreJugador.backgroundColor = UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1)
            nombreJugador.textColor = UIColor.white
        case 6:
            nombreJugador.backgroundColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1)
            nombreJugador.textColor = UIColor.white
        case 7:
            nombreJugador.backgroundColor = UIColor(red: 0.2, green: 0.15, blue: 0.0, alpha: 1)
            nombreJugador.textColor = UIColor.white
        default:
            print("Default Switch Statement MostrarNombre")
        }
        
    }

    
    
    //Dominoes Segue:
    @IBAction func seguePintaArriba(_ sender: UIButton) {
        
        if sender.currentTitle == "4" {
            
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "JuegosViewController") as! JuegosViewController
            controller.jugadorActivo = Jugadores[jugadorAleatorio]
            
            let juegoAleatorio = Int(arc4random_uniform(UInt32(juegos.count)))
            let juegoSeleccionado = juegos[juegoAleatorio]
            controller.juego = juegoSeleccionado
            juegosDescubiertos.append(juegoSeleccionado)
            juegos.remove(at: juegoAleatorio)
            
            self.present(controller, animated: true, completion: nil)
            
        } else {
            
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "SegueDominoViewController") as! SegueDominoViewController
            controller.jugadorActivo = Jugadores[jugadorAleatorio]
            controller.pinta = Int(self.pintaArribaButton.currentTitle!)
        
                switch sender.currentTitle! {
                    
                    case "0":
                        let categoriaAleatoria = Int(arc4random_uniform(UInt32(categorias.count)))
                        let categoriaSeleccionada = categorias[categoriaAleatoria]
                        controller.categoria = categoriaSeleccionada
                        categoriasDescubiertas.append(categoriaSeleccionada)
                        categorias.remove(at: categoriaAleatoria)
                    break
            
                    case "6":
                        let personalesAleatoria = Int(arc4random_uniform(UInt32(personales.count)))
                        let personalesSeleccionada = personales[personalesAleatoria]
                        controller.persona = personalesSeleccionada
                            if personalesSeleccionada.nombre == "El Senado" {
                                print("El Senado")
                            } else {
                                personalesDescubiertas.append(personalesSeleccionada)
                                personales.remove(at: personalesAleatoria)
                            }
                    break
            
                    default:
                        print("Default Switch Pinta Arriba")
                    }
            
            self.present(controller, animated: true, completion: nil)
        }
        
        print("segue Pinta Arriba")
        pintaArribaButton.isEnabled = false
        
    }
    
    @IBAction func seguePintaAbajo(_ sender: UIButton) {
        
        if sender.currentTitle == "4" {
            
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "JuegosViewController") as! JuegosViewController
            controller.jugadorActivo = Jugadores[jugadorAleatorio]
            
            let juegoAleatorio = Int(arc4random_uniform(UInt32(juegos.count)))
            let juegoSeleccionado = juegos[juegoAleatorio]
            controller.juego = juegoSeleccionado
            juegosDescubiertos.append(juegoSeleccionado)
            juegos.remove(at: juegoAleatorio)
            
            self.present(controller, animated: true, completion: nil)
            
        } else {
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "SegueDominoViewController") as! SegueDominoViewController
        controller.jugadorActivo = Jugadores[jugadorAleatorio]
        controller.pinta = Int(pintaAbajoButton.currentTitle!)
        
            switch sender.currentTitle! {
                
            case "0":
                let categoriaAleatoria = Int(arc4random_uniform(UInt32(categorias.count)))
                let categoriaSeleccionada = categorias[categoriaAleatoria]
                controller.categoria = categoriaSeleccionada
                categoriasDescubiertas.append(categoriaSeleccionada)
                categorias.remove(at: categoriaAleatoria)
            break
                
            case "6":
                let personalesAleatoria = Int(arc4random_uniform(UInt32(personales.count)))
                let personalesSeleccionada = personales[personalesAleatoria]
                controller.persona = personalesSeleccionada
                    if personalesSeleccionada.nombre == "El Senado" {
                        print("El Senado")
                    } else {
                personalesDescubiertas.append(personalesSeleccionada)
                personales.remove(at: personalesAleatoria)
                }
                break
                
            default:
                print("Default Switch Pinta Abajo")
            }
            
        present(controller, animated: true, completion: nil)
            
        }
     
        print("segue Pinta Abajo")
        pintaAbajoButton.isEnabled = false
    }
    
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
