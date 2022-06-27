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
	const metas = [
		meta1, meta2,meta3,meta4,meta5
	]
	
	var fondojuego = new Fondo()
	
	method agregarVisuales(){
	 	game.addVisual(fondojuego)	
		self.agregarVisualesObstaculosMoviles()
		self.agregarVisualesMeta()
		game.addVisual(textMaxPuntaje)
		game.addVisual(textPuntos)
		game.addVisual(puntos)
		//game.addVisual(textMaxPuntajeActual)
		game.addVisual(reloj)
		game.addVisual(textTiempo)
	}
	method agregarVisualesObstaculosMoviles(){
		obstaculosMoviles.forEach({
			obstaculo => game.addVisual(obstaculo)
		})
	}
	method agregarVisualesMeta(){
		metas.forEach({
			obstaculo => game.addVisual(obstaculo)
		})
	}
	
	method iniciar(){
		self.iniciarObstaculosMoviles()
		rana.iniciar()
		reloj.iniciar()		
	}
	
	method iniciarObstaculosMoviles(){
		obstaculosMoviles.forEach({
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
		puntos.agregarPuntaje(puntos.puntaje())
		puntos.maxPuntaje()
		//puntos.restablecer()
		game.schedule(1500, {
			game.clear()
			
			
			//configuracion.detenerMusica()
			configuracion.pausarMusicaBajandoVolumen()
			
			
			game.addVisual(new Fondo(image = "gameover.png"))  //Fondo Game Over
			game.schedule(4000, { // Volver al inicio 
				//configuracion.detenerMusicaBajandoVolumen()
				game.clear()
				menu.iniciar()})
			})

		
	}
	
	
}
