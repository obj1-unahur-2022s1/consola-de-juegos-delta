import wollok.game.*
import movimientos.*
import rana.*
import obstaculos.*



object puntos {
	// Puntos
	var property puntos = 0
	method text() = puntos.toString()
	method position() = game.at(5 , game.height()-1)
	
	method puntosAlLlegarAMeta(){	
		return 300
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

const meta1 = new Meta(position = game.at(1, game.height()-2))
const meta2 = new Meta(position = game.at(game.width()-2, game.height()-2))

const meta3 = new Meta(position = game.at(5, game.height()-2))
const meta4 = new Meta(position = game.at(game.width()-6, game.height()-2))
const meta5 = new Meta(position = game.at(game.width()-10.1, game.height()-2))


//Autos

const auto1= new AutosMortales(position= game.at(game.width()-1,1), imagen= "auto1.png", velocidad= 300,direccion = izquierda)
const auto2= new AutosMortales(position= game.at(game.width()-1,5), imagen= "auto3.png", velocidad= 230, direccion = izquierda)
const auto3= new AutosMortales(position= game.at(game.width()-1,2), imagen = "auto4.png", velocidad= 280, direccion = derecha)

const camion1= new AutosMortales(position= game.at(game.width()-1,5), imagen= "camion.png", velocidad= 200, direccion = derecha)
const camion2= new AutosMortales(position= game.at(game.height()-1,3), imagen = "camion.png", velocidad= 240, direccion = izquierda)


const tronco1= new AutosMortales(position= game.at(game.height()-1,9), imagen = "tronco1.png", velocidad= 340, direccion = derecha)
const tronco2= new AutosMortales(position= game.at(game.height()-1,11), imagen = "tronco2.png", velocidad= 320, direccion = izquierda)

const otrasRanas1= new AutosMortales(position= game.at(game.height()-1,10), imagen = "otrasRanas.png", velocidad= 290, direccion = izquierda)
const otrasRanas2= new AutosMortales(position= game.at(game.height()-1,8), imagen = "otrasRanas2.png", velocidad= 280, direccion = derecha)

const otrasRanas3= new AutosMortales(position= game.at(game.height()-1,12), imagen = "otrasRanas.png", velocidad= 340, direccion = izquierda)
const otrasRanas4= new AutosMortales(position= game.at(game.height()-1,7), imagen = "otrasRanas2.png", velocidad= 310, direccion = derecha)


//Texto

const textTiempo = new Texto(texto = "Tiempo: ", position = game.at(0, game.height()-1))

const textPuntos = new Texto(texto = "Puntos: ", position = game.at(4 , game.height()-1))
	

