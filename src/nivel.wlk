import wollok.game.*
import utilidades.*
import rana.*
import config.*
import menu.*
import consola.*

object nivel {
	const obstaculosMoviles = [
		auto1,auto2,auto3,
		camion1,camion2,camion3,
		tronco1,tronco2,
		otrasRanas1,otrasRanas2,otrasRanas3,otrasRanas4
	]
	const metas = [meta1, meta2,meta3,meta4,meta5]
	//const obstaculosMoviles =  []
	//const metas = []
	var fondojuego = new Fondo()
	
	method agregarVisuales(){
	 	game.addVisual(fondojuego)	
		self.agregarVisualesObstaculosMoviles()
		self.agregarVisualesMeta()
		game.addVisual(textMaxPuntaje)
		game.addVisual(textPuntos)
		game.addVisual(puntos)
		//game.addVisual(textMaxPuntajeActual)
		
		//game.addVisual(reloj)
		
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
		//reloj.iniciar()		
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
		//reloj.detener()
		rana.morir()
		puntos.agregarPuntaje(puntos.puntaje())
		puntos.maxPuntaje()
		//puntos.restablecer()
		
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.schedule(1500, {
			game.clear()
			//configuracion.detenerMusica()
			// Fondo Game Over
			//configuracion.pausarMusicaBajandoVolumen()
			game.addVisual(new Fondo(image = "gameover.png"))
			game.schedule(4000, { // Volver al inicio 
				//configuracion.detenerMusicaBajandoVolumen()
				game.clear()
				menu.iniciar()})
			})

		
	}
	
	
}
