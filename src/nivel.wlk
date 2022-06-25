import wollok.game.*
import utilidades.*
import rana.*
import frogger.*

object nivel {
	
	method agregarVisuales(){
		//game.boardGround("fondo.png")
	 	
	 	game.addVisual(new Fondo())
		
		game.addVisual(rana)
		 
		game.addVisual(auto1)
		game.addVisual(auto2)
		game.addVisual(auto3)
		
		game.addVisual(camion1)
		game.addVisual(camion2)
		
		game.addVisual(tronco1)
		game.addVisual(tronco2)
		
		
		game.addVisual(otrasRanas1)
		game.addVisual(otrasRanas2)
		game.addVisual(otrasRanas3)
		game.addVisual(otrasRanas4)
		
		game.addVisual(meta1)
		game.addVisual(meta2)
		game.addVisual(meta3)
		game.addVisual(meta4)
		game.addVisual(meta5)
		
		game.addVisual(textTiempo)
		game.addVisual(textPuntos)
		game.addVisual(puntos)
		game.addVisual(reloj)	
	}
	
	method iniciar(){
	
		rana.iniciar()
		reloj.iniciar()
		
		auto1.iniciar()
		auto2.iniciar()
		auto3.iniciar()
		
		camion1.iniciar()
		camion2.iniciar()
		
		tronco1.iniciar()
		tronco2.iniciar()
		
		otrasRanas1.iniciar()
		otrasRanas2.iniciar()
		otrasRanas3.iniciar()
		otrasRanas4.iniciar()
	}
	
	method jugar(){
		if (rana.estaVivo()) 
			rana.iniciar()
		else {
			game.removeVisual(gameOver)
			self.iniciar()
		}
		
	}
	
	method terminar(){
		//game.clear()
		//game.addVisual(new Fondo(image= "fondo_negro.jpg"))
		game.addVisual(gameOver)
		
		auto1.detener()
		auto2.detener()
		auto3.detener()
		
		camion1.detener()
		camion2.detener()
		
		tronco1.detener()
		tronco2.detener()
		
		otrasRanas1.detener()
		otrasRanas2.detener()
		otrasRanas3.detener()
		otrasRanas4.detener()
		
		//reloj.detener()
		rana.morir()
		puntos.restablecer()
		
		//game.say(rana,"¡Presiona SPACE para reanudar!")
	}
}
