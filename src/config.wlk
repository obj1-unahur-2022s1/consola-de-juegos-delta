import wollok.game.*
import rana.*
import movimientos.*
import utilidades.*
import obstaculos.*
import nivel.*

object configuracion{
	const musica = game.sound("frogger.mp3")
	
	method iniciar(){
		
		game.clear() 
		rana.posicionInicial()
		puntos.restablecer()
		self.configurarControles()
		nivel.agregarVisuales()
		nivel.iniciar()
		
		self.configurarMusica()
		
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
			game.schedule(500, {musica.play()})
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