import wollok.game.*
import movimientos.*
import utilidades.*

object rana {
	var vivo = true
	var property direccion = arriba
	var property position = game.at(game.width()/2,0)
	var property image = "rana-"+ direccion.toString() +".png"
	
	method posicionInicial(){
		position =game.at(game.width()/2,0)
		}
	// Mueve en la direccion indicada
	method moverDireccion_(dir){
		self.direccion(dir)	
		self.image(dir)
		self.avanzar()
		self.puntajePorPasoSiDireccion_EsArriba(dir)
		//puntos.puntajePorPaso()
		self.sonidoPorPaso()
	}
	method puntajePorPasoSiDireccion_EsArriba(unaDireccion){
		if (unaDireccion == arriba){
			puntos.puntajePorPaso()
		}
	}
	
	//Sonido que se reproduce por cada paso que da la rana
	method sonidoPorPaso(){
		const salto = game.sound("audio/sonidoSalto.wav")
		salto.volume(0.3)
		salto.play()
	}
	
	//Determina qué imagen se utiliza según la dirección en la que se mueve la rana
	method image(dir){
        if(self.estaVivo()) {
		    image = "rana-" + dir.toString() + ".png"
		}
	}
	
	method avanzar() {
			position = direccion.proximaPosicion(self.position())
	}
	
	method morir(){
		game.say(self,"¡Auch!")
		vivo = false
		
	}
	
	method iniciar() {
		vivo = true
		//position = game.at(game.width()/2,0)
		game.addVisual(self)
	}
	method estaVivo() {
		return vivo
	}
	

}