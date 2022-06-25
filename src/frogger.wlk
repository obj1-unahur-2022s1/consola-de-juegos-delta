import wollok.game.*
import rana.*
import movimientos.*
import utilidades.*
import obstaculos.*
import nivel.*

//const musica = game.sound("/ConsolaDeJuegos/assets/audio/remember-the-80s.mp3")
object pantallaInicio {
	const fondoEmpezar = new Fondo(image = "fondo_inicio1.png")
	
	method configurar() {
		
		game.addVisual(fondoEmpezar)
		keyboard.x().onPressDo({ if (game.hasVisual(fondoEmpezar)) {
				//game.addVisual(fondoEmpezar)
				game.schedule(2000, { juego.configurar()})
			}
		})
		keyboard.z().onPressDo({ game.addVisual(fondoEmpezar)
			game.schedule(2000, { game.stop()})
		})
		
	}
}


object juego{
	
	method configurar(){
		//Se hace un game clear primero para que el usuario no pueda presionar Z o X
		game.clear()
		nivel.agregarVisuales()
		nivel.iniciar()
		self.configurarControles()
		self.configurarColision()
		//keyboard.x().onPressDo({ }) // ??
		//keyboard.z().onPressDo({ }) // ??
		//game.onCollideDo(rana,{ obstaculo => obstaculo.chocar()})
		
	} 
	
	method configurarColision(){
		game.onCollideDo(rana,{ obstaculo => obstaculo.chocar()})
	}
	
	method configurarControles(){

		keyboard.up().onPressDo{ rana.moverDireccion_(arriba)}
		keyboard.down().onPressDo{ rana.moverDireccion_(abajo)}
		keyboard.right().onPressDo{ rana.moverDireccion_(derecha)}
		keyboard.left().onPressDo{ rana.moverDireccion_(izquierda)}
	}
	/* 
	method iniciar(){
	
		rana.iniciar()
		//reloj.iniciar()
		
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
		
		game.say(rana,"¡Presiona SPACE para reanudar!")
	}
	*/
}
/* 
object controles{
	method configurar(){
		keyboard.space().onPressDo{ nivel.jugar()}
		keyboard.up().onPressDo{ rana.moverDireccion_(arriba)}
		keyboard.down().onPressDo{ rana.moverDireccion_(abajo)}
		keyboard.right().onPressDo{ rana.moverDireccion_(derecha)}
		keyboard.left().onPressDo{ rana.moverDireccion_(izquierda)}
	}
}	
object gameOver {
	method position() = game.center()
	method text() = "GAME OVER"
	
}*/
/* 
object reloj {
	
	var tiempo = 0
	
	method text() = tiempo.toString()
	method position() = game.at(1, game.height()-1)
	
	method pasarTiempo() {
		tiempo = tiempo +1
	}
	method iniciar(){
		tiempo = 0
		game.onTick(100,"tiempo",{self.pasarTiempo()})
	}
	method detener(){
		game.removeTickEvent("tiempo")
	}
}
*/