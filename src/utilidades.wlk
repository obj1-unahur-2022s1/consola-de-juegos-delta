import wollok.game.*
import movimientos.*
import obstaculos.*

object posicion{

	method posicionArbitrariaHeight() { // Delimita el rango aleatorio dejando una celda de margen 
		return game.at(0, 1.randomUpTo(game.height() - 2).truncate(0))
	}
	method posicionArbitrariaWidth() { // Delimita el rango aleatorio dejando una celda de margen a lo ancho
		return game.at(1.randomUpTo(game.width() - 2).truncate(0), 0)
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
	
}

object puntos {
	
	var property puntaje = 0
	
	method text() = "SCORE: " + puntaje.toString()
	
	method position() = game.at(2 , game.height()-1)
	
	method puntosAlLlegarAMeta(){	
		puntaje += 300
	}
	
	method puntajePorPaso(){
		puntaje += 30
	}
	method restablecer(){
		puntaje = 0
	}
	method iniciar(){
		game.addVisual(self)
	}
}

object puntosMax{
	
	var listaPuntos = [0]

	method text() = "HI-SCORE: "+ self.maxPuntaje().toString()
	
	method position() = game.at(5, game.height()-1)
	
	method maxPuntaje(){
		return listaPuntos.max()
	}
	method agregarPuntaje(unPuntaje){
		listaPuntos.add(unPuntaje)
	}
	method iniciar(){
		if (not game.hasVisual(self)){
			game.addVisual(self)		
		}
	}
}


object reloj {
	var tiempo = 0
	
	method text() = tiempo.toString()
	method position() = game.at(game.width()-1, game.height()-1)
	
	method pasarTiempo() {
		tiempo = tiempo +1
	}
	method iniciar(){
		tiempo = 0
		if (not game.hasVisual(self)){
			game.addVisual(self)		
		}
		game.onTick(1000,"tiempo",{self.pasarTiempo()})
	}
	method detener(){
		game.removeTickEvent("tiempo")
	}
}


//Instancias...

//Metas

const meta1 = new Meta(position = game.at(1, game.height()-2), imagen = "meta2.png")
const meta2 = new Meta(position = game.at(game.width()-2, game.height()-2), imagen = "meta2.png")

const meta3 = new Meta(position = game.at(5, game.height()-2), imagen = "meta2.png")
const meta4 = new Meta(position = game.at(game.width()-6, game.height()-2), imagen = "meta2.png")
const meta5 = new Meta(position = game.at(game.width()-10.1, game.height()-2), imagen = "meta2.png")


//Autos

const auto1= new ObstaculoMovil(position= game.at(game.width()-1,1), imagen= "auto1-izquierda.png", velocidad= 300,direccion = izquierda)
const auto2= new ObstaculoMovil(position= game.at(game.width()-1,6), imagen= "auto3-izquierda.png", velocidad= 230, direccion = izquierda)
const auto3= new ObstaculoMovil(position= game.at(game.width()-1,2), imagen = "auto4.png", velocidad= 280, direccion = derecha)
const auto4= new ObstaculoMovil(position= game.at(12,5), imagen= "auto4.png", velocidad= 200, direccion = derecha)


const camion1= new ObstaculoMovil(position= game.at(0,5), imagen= "camion2-derecha.png", velocidad= 200, direccion = derecha)
const camion2= new ObstaculoMovil(position= game.at(game.height()-1,3), imagen = "camion2.png", velocidad= 240, direccion = izquierda)
const camion3= new ObstaculoMovil(position= game.at(5,3), imagen = "camion2.png", velocidad= 240, direccion = izquierda)
const camion4= new ObstaculoMovil(position= game.at(6,5), imagen= "camion2-derecha.png", velocidad= 200, direccion = derecha)


const tronco1= new ObstaculoMovil(position= game.at(game.height()-1,9), imagen = "tronco4.png", velocidad= 340, direccion = derecha)
const tronco2= new ObstaculoMovil(position= game.at(game.height()-1,11), imagen = "tronco3.png", velocidad= 320, direccion = izquierda)
const tronco3= new ObstaculoMovil(position= game.at(4,11), imagen = "tronco3.png", velocidad= 320, direccion = izquierda)
const tronco4= new ObstaculoMovil(position= game.at(7,9), imagen = "tronco4.png", velocidad= 340, direccion = derecha)

const tortuga1= new ObstaculoMovil(position= game.at(game.height()-1,10), imagen = "tortuga1.png", velocidad= 290, direccion = izquierda)
const tortuga2= new ObstaculoMovil(position= game.at(game.height()-1,8), imagen = "tortuga2.png", velocidad= 200, direccion = izquierda)

const tortuga3= new ObstaculoMovil(position= game.at(game.height()-1,12), imagen = "tortuga1-derecha.png", velocidad= 340, direccion = derecha)
const tortuga4= new ObstaculoMovil(position= game.at(5,8), imagen = "tortuga2.png", velocidad= 200, direccion = izquierda)

//Texto

const textTiempo = new Texto(texto = "TIME: ", position = game.at(game.width()-2, game.height()-1))
//const textPuntos = new Texto(texto = "SCORE - ", position = game.at(1 , game.height()-1))
//const textMaxPuntaje = new Texto(texto = "HI-SCORE - ", position = game.at(4 , game.height()-1))




