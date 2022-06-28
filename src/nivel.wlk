import wollok.game.*
import utilidades.*
import rana.*
import config.*
import menu.*
import consola.*

object nivel {
	const obstaculosMoviles = [
		auto1,auto2,auto3,auto4,
		camion1,camion2,camion3,camion4,
		tronco1,tronco2,tronco3,tronco4,
		tortuga1,tortuga2,tortuga3,tortuga4
	]
	const metas = [meta1, meta2,meta3,meta4,meta5]
	
	var fondoJuego = new Fondo()
	
	method agregarVisuales(){
	 	game.addVisual(fondoJuego)	
		game.addVisual(textTiempo)
	}
	

	method iniciar(){
		self.iniciarObstaculosMoviles()
		self.iniciarMetas()	
		rana.iniciar()
		reloj.iniciar()
		puntos.iniciar()
		puntosMax.iniciar()	
	}
	
	method iniciarObstaculosMoviles(){
		obstaculosMoviles.forEach({
			obstaculo => obstaculo.iniciar()
		})
	}
	method iniciarMetas(){
		metas.forEach({
			obstaculo => obstaculo.iniciar()
		})
	}
	
	method detenerObstaculosMoviles(){
		obstaculosMoviles.forEach({
			obstaculo => obstaculo.detener()
		})
	}
	
	method terminar(){	
		self.detenerObstaculosMoviles()
		reloj.detener()
		rana.morir()
		puntosMax.agregarPuntaje(puntos.puntaje())
		self.mostrarPantallaGameOverYVolverAMenu()
		
	}
	method mostrarPantallaGameOverYVolverAMenu(){
		game.schedule(1000, {
			game.clear()
			configuracion.pausarMusicaBajandoVolumen()
			game.addVisual(new Fondo(image = "gameover.png"))  //Fondo Game Over
			game.schedule(4000, { // Volver al menu...
				game.clear()
				menu.iniciar()})
			})
		
	}
	
}
