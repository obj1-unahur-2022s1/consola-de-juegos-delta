import wollok.game.*
import movimientos.*
import obstaculos.*



object puntos {
	// Puntos
	
	var listaPuntos = [0]
	
	var property puntaje = 0
	method text() = puntaje.toString()
	
	method position() = game.at(1 , game.height()-1)
	
	method puntosAlLlegarAMeta(){	
		puntaje += 300
	}
	
	method puntajePorPaso(){
		puntaje += 10
	}
	method restablecer(){
		puntaje = 0
	}
	method maxPuntaje(){
		return listaPuntos.max()
	}
	method agregarPuntaje(unPuntaje){
		listaPuntos.add(unPuntaje)
	}
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

class Fondo {
	const property position = game.at(0, 0)
	var property image = "fondo2.png"
	
	method removerFondo(){
		image = null
	}
}


//Instancias

//Metas

const meta1 = new Meta(position = game.at(1, game.height()-2), imagen = "meta2.png")
const meta2 = new Meta(position = game.at(game.width()-2, game.height()-2), imagen = "meta2.png")

const meta3 = new Meta(position = game.at(5, game.height()-2), imagen = "meta2.png")
const meta4 = new Meta(position = game.at(game.width()-6, game.height()-2), imagen = "meta2.png")
const meta5 = new Meta(position = game.at(game.width()-10.1, game.height()-2), imagen = "meta2.png")



//Autos

const auto1= new Auto(position= game.at(game.width()-1,1), imagen= "auto1-izquierda.png", velocidad= 300,direccion = izquierda)
const auto2= new Auto(position= game.at(game.width()-1,6), imagen= "auto3-izquierda.png", velocidad= 230, direccion = izquierda)
const auto3= new Auto(position= game.at(game.width()-1,2), imagen = "auto4.png", velocidad= 280, direccion = derecha)

const camion1= new Auto(position= game.at(game.width()-1,5), imagen= "camion2-derecha.png", velocidad= 200, direccion = derecha)
const camion2= new Auto(position= game.at(game.height()-1,3), imagen = "camion2.png", velocidad= 240, direccion = izquierda)
const camion3= new Auto(position= game.at(5,3), imagen = "camion2.png", velocidad= 240, direccion = izquierda)

const tronco1= new Auto(position= game.at(game.height()-1,9), imagen = "tronco4.png", velocidad= 340, direccion = derecha)
const tronco2= new Auto(position= game.at(game.height()-1,11), imagen = "tronco3.png", velocidad= 320, direccion = izquierda)

const otrasRanas1= new Auto(position= game.at(game.height()-1,10), imagen = "otrasRanas.png", velocidad= 290, direccion = izquierda)
const otrasRanas2= new Auto(position= game.at(game.height()-1,8), imagen = "otrasRanas2.png", velocidad= 250, direccion = derecha)

const otrasRanas3= new Auto(position= game.at(game.height()-1,12), imagen = "otrasRanas.png", velocidad= 340, direccion = derecha)
const otrasRanas4= new Auto(position= game.at(game.height()-1,7), imagen = "otrasRanas2.png", velocidad= 200, direccion = izquierda)



//Texto

//const textTiempo = new Texto(texto = "Tiempo: ", position = game.at(0, game.height()-1))

const textPuntos = new Texto(texto = "SCORE: ", position = game.at(0 , game.height()-1))
	
const textMaxPuntaje = new Texto(texto = "HI-SCORE: " + puntos.maxPuntaje().toString() , position = game.at(3 , game.height()-1))
//const textMaxPuntajeActual = new Texto(texto = puntos.maxPuntaje().toString(), position = game.at(4 , game.height()-1))
