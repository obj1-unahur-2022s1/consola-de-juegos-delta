import wollok.game.*
import movimientos.*
import rana.*
import obstaculos.*



object puntos {
	// Puntos
	var puntos = 0
	method text() = puntos.toString()
	method position() = game.at(5 , game.height()-1)
	
	method puntosAlLlegarAMeta(){	
		puntos += 300
	}
	
	method puntajePorPaso() = 10
	
	//FALTA IMPLEMENTAR QUE POR CADA PASO QUE HACE LA RANA, AUMENTE EL PUNTAJE EN 10
	
	/* 
	method iniciar(){
		
		game.whenKeyPressedDo(keyboard.up(), self.puntajePorPaso())
		game.whenKeyPressedDo(keyboard.down(), self.puntajePorPaso())
		game.whenKeyPressedDo(keyboard.left(), self.puntajePorPaso())
		game.whenKeyPressedDo(keyboard.right(), self.puntajePorPaso())
	}
	*/
	
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
		game.onTick(1000,"tiempo",{self.pasarTiempo()})
	}
	method detener(){
		game.removeTickEvent("tiempo")
	}
}

class Texto {
	var property texto 
	var property position
	
	method text() = texto	
}

//Instancias

//Metas

const meta1 = new Meta(position = game.at(0, game.height()-2))
const meta2 = new Meta(position = game.at(game.width()-1, game.height()-2))

//Autos

const auto= new AutosTrampa(position= game.at(game.width()-1,5), imagen= "camion.png", velocidad= 300,direccion = izquierda)
const auto3= new AutosTrampa(position= game.at(game.width()-1,1), imagen= "auto1.png", velocidad= 230, direccion = izquierda)
const auto2= new AutosTrampa(position= game.at(game.width()-1,2), imagen = "auto1.png", velocidad= 250, direccion = derecha)
const auto4= new AutosTrampa(position= game.at(game.width()-1,7), imagen= "auto1.png", velocidad= 200, direccion = derecha)
const auto5= new AutosMortales(position= game.at(game.height()-1,3), imagen = "auto2.png", velocidad= 330, direccion = derecha)
	

//Texto

const textTiempo = new Texto(texto = "Tiempo: ", position = game.at(0, game.height()-1))

const textPuntos = new Texto(texto = "Puntos: ", position = game.at(4 , game.height()-1))
	

