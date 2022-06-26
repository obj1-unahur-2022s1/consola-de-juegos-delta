import wollok.game.*
import utilidades.*
import rana.*
import config.*

object nivel {
	const obstaculosMoviles = [auto1,auto2,auto3,camion1,camion2,tronco1,tronco2,otrasRanas1,otrasRanas2,otrasRanas3,otrasRanas4]
	const metas = [meta1, meta2,meta3,meta4,meta5]
	

	method agregarVisuales(){
	 	game.addVisual(new Fondo())	
		self.agregarVisualesObstaculosMoviles()
		self.agregarVisualesMeta()
		game.addVisual(rana)
		game.addVisual(textTiempo)
		game.addVisual(textPuntos)
		game.addVisual(puntos)
		game.addVisual(reloj)
		/*  
		game.addVisual(auto1)
		game.addVisual(auto2)
		game.addVisual(auto3)
		
		game.addVisual(camion1)
		game.addVisual(camion2)
		
		game.addVisual(tronco1)
		game.addVisual(tronco2)
		
		
		game.addVisual(otrasRanas1)
		game.addVisual(otrasRanas2)
		game.addVisual(otrasRanas3)
		game.addVisual(otrasRanas4)
		
		game.addVisual(meta1)
		game.addVisual(meta2)
		game.addVisual(meta3)
		game.addVisual(meta4)
		game.addVisual(meta5)
		
		game.addVisual(textTiempo)
		game.addVisual(textPuntos)
		game.addVisual(puntos)
		game.addVisual(reloj)		
		*/
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
		
		/* 
		rana.iniciar()
		reloj.iniciar()
		
		auto1.iniciar()
		auto2.iniciar()
		auto3.iniciar()
		
		camion1.iniciar()
		camion2.iniciar()
		
		tronco1.iniciar()
		tronco2.iniciar()
		
		otrasRanas1.iniciar()
		otrasRanas2.iniciar()
		otrasRanas3.iniciar()
		otrasRanas4.iniciar()
		
		*/
		
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
		/* 
		auto1.detener()
		auto2.detener()
		auto3.detener()
		
		camion1.detener()
		camion2.detener()
		
		tronco1.detener()
		tronco2.detener()
		
		otrasRanas1.detener()
		otrasRanas2.detener()
		otrasRanas3.detener()
		otrasRanas4.detener()
		*/
		self.detenerObstaculosMoviles()
		reloj.detener()
		rana.morir()
		puntos.restablecer()
		
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.schedule(1500, {
			game.clear()
			//configuracion.detenerMusica()
			// Fondo Game Over
			configuracion.pausarMusicaBajandoVolumen()
			game.addVisual(new Fondo(image = "gameover.png"))
			
			game.schedule(4000, { // Volver al inicio 
				//configuracion.detenerMusicaBajandoVolumen()
				pantallaInicio.iniciar()})
			})

		
	}
	
	
}
