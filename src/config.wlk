import wollok.game.*
import rana.*
import movimientos.*
import utilidades.*
import obstaculos.*
import nivel.*

//const musica = game.sound("/ConsolaDeJuegos/assets/audio/remember-the-80s.mp3")

/* 
object pantallaInicio {
	const fondoEmpezar = new Fondo(image = "fondo_inicio1.png")
	method iniciar() {
	
		game.addVisual(fondoEmpezar)
		keyboard.x().onPressDo({ if (game.hasVisual(fondoEmpezar)) {
				//game.addVisual(fondoEmpezar)
				game.schedule(2000, { configuracion.iniciar()})
			}
		})
		keyboard.z().onPressDo({ game.addVisual(fondoEmpezar)
			game.schedule(2000, { game.stop()})
		})
		
	}

}
*/

object configuracion{
	const musica = game.sound("frogger.mp3")
	
	method iniciar(){
		
		game.clear() //Se hace un game clear primero para que el usuario no pueda presionar Z o X
		rana.posicionInicial()
		puntos.restablecer()
		//puntos.maxPuntaje()
		self.configurarControles()
		nivel.agregarVisuales()
		nivel.iniciar()
		//self.configurarMusica()
		self.configurarColision()
		
	} 
	
	method configurarMusica(){
		//const musica = game.sound("remember-the-80s.mp3")
		musica.shouldLoop(true)
		musica.volume(0.1)
		
		if (musica.paused()){
			musica.volume(0.1)
			musica.resume()
		}else {
			musica.play()
		}
		
		keyboard.p().onPressDo({musica.pause()})
		keyboard.o().onPressDo({musica.resume()})
	}
	method pausarMusicaBajandoVolumen(){
		game.schedule(100, {
			musica.volume(0.080)
			game.schedule(500, {
				musica.volume(0.050)
				game.schedule(800, {
					musica.volume(0.020)
					game.schedule(1000, {musica.pause()})
				})
			})
		})
		
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
}	