import wollok.game.*
import movimientos.*

object rana {
	var vivo = true
	var property direccion = abajo
	var position = game.at(game.width()/2,0)
	//var pasos 
	
	method image() = "rana.png"
	
	method position() = position
	
	method position(nuevaPosicion){
		position = nuevaPosicion
	}
	/* 
	method pasos(){
		return pasos
	} */
	
	method moverDerecha() {
		self.direccion(derecha)	
		self.avanzar()
			
	}

	method moverIzquierda() {
		self.direccion(izquierda)
		self.avanzar()	
	}

	method moverArriba() {
		self.direccion(arriba)	
		self.avanzar()	
	}

	method moverAbajo() {
		self.direccion(abajo)
		self.avanzar()
	}
	
	method avanzar() {
			position = direccion.proximaPosicion(self.position())
			//pasos +=1
	}
	
	method morir(){
		game.say(self,"¡Auch!")
		vivo = false
		//position = game.at(,0)
	}
	method iniciar() {
		vivo = true
		position = game.at(game.width()/2,0)
	}
	method estaVivo() {
		return vivo
	}
	

}