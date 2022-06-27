import wollok.game.*
import consola.*
import config.*
import menu.*

class Juego {
	var property position = null
	var property color 
	
	
	method iniciar(){
        game.addVisual(object{method position()= game.center() method text() = "Juego "+color + " - <q> para salir"})	
 		
	}
	
	method terminar(){
		
	}
	
	method image() = "juego" + color + ".png"
	
}

object juegoFrogger {
	
	var property position
	
	method iniciar(){
       game.schedule(1000,{menu.iniciar() })	
	}
	method terminar(){
		
	}
	method image() = "logoFrogger1.png"
}