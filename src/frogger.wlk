import wollok.game.*



object juego{
	
	var auto= new AutosTrampa(position= game.at(game.width()-1,3), imagen= "camion.png", velocidad= 300)
	var auto2= new AutosTrampa(position= game.at(game.width()-1,2), imagen = "auto1.png", velocidad= 250)
	var auto3= new AutosTrampa(position= game.at(game.width()-1,4), imagen= "auto1.png", velocidad= 230)
	var auto4= new AutosTrampa(position= game.at(game.width()-1,3), imagen= "auto1.png", velocidad= 200)
	
	// Arreglar: No salen autos del lado izquierdo en forma de bucle
	var auto5= new AutosMortales(position= game.at(game.height()-1,3), imagen = "auto2.png", velocidad= 330)
	
	
	

	method configurar(){
		
		
		game.width(20)
		game.height(15)
		game.title("Frogger Game")
		game.boardGround("fondo.png")
		game.addVisual(rana)
		game.addVisual(auto)
		game.addVisual(auto2)
		game.addVisual(auto3)
		game.addVisual(auto4)
		game.addVisual(auto5)
		game.addVisual(reloj)
	
		keyboard.space().onPressDo{ self.jugar()}
		keyboard.up().onPressDo{ rana.subir()}
		keyboard.down().onPressDo{ rana.bajar()}
		keyboard.right().onPressDo{ rana.derecha()}
		keyboard.left().onPressDo{ rana.izquierda()}
		
		game.onCollideDo(rana,{ obstaculo => obstaculo.chocar()})
		
	} 
	
	method iniciar(){
		rana.iniciar()
		reloj.iniciar()
		auto.iniciar()
		auto2.iniciar()
		auto3.iniciar()
		auto4.iniciar()
		auto5.iniciar()
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
		auto.detener()
		auto2.detener()
		auto3.detener()
		auto5.detener()
		auto4.detener()
		reloj.detener()
		rana.morir()
	}

}
	
object gameOver {
	method position() = game.center()
	method text() = "GAME OVER"
	

}

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

class Obstaculo {
	var velocidad
	var position //= self.posicionInicial()
	var imagen 
	//const posX
	//const posY
	method image() = imagen //"auto1.png"
	method position() = position
	
	method posicionInicial() //= game.at(posX,posY)

	method iniciar(){
		position = self.posicionInicial()
		game.onTick(velocidad,"moverObstaculo",{self.mover()})
	}
	
	method mover()
	
	method chocar()
	
    method detener(){
		game.removeTickEvent("moverObstaculo")
	}
}



class AutosTrampa inherits Obstaculo{
	override method posicionInicial()= game.at(game.width()-1,3) //suelo.position().y())
	override method chocar(){
		juego.terminar()
	}
	
	override method mover(){
		position = position.left(1)
		if (position.x() == -1)
			position = self.posicionInicial()
	}
}


class AutosMortales inherits Obstaculo{
	override method posicionInicial()= game.at(3,game.height()-1)//suelo.position().y())
	override method chocar() {
		juego.terminar()
	}
	
	override method mover(){
		position = position.right(1)
		if (position.x() == -1)
			position = self.posicionInicial()
	}
	
}

/* 
object suelo{
	
	method position() = game.origin().up(3)
	
	method image() = "suelo.png"
}
*/

object rana {
	var vivo = true

	var position = game.at(9,0)
	
	method image() = "rana.png"
	method position() = position
	

	method subir(){
		position = position.up(1)
	}
	
	method bajar(){
		position = position.down(1)
	}
	
	method izquierda(){
		position = position.left(1)
	}
	
	method derecha(){
		position = position.right(1)
	}

	
	method morir(){
		game.say(self,"¡Auch!")
		vivo = false
	}
	method iniciar() {
		vivo = true
	}
	method estaVivo() {
		return vivo
	}
}