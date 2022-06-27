import wollok.game.*
import consola.*
import config.*
import utilidades.* 

object menu {

    var property seleccionado = 0
    //var posicionInicial
    
    const opciones = [play, salir]

    const fondoEmpezar = new Fondo(image = "fondo_inicio.png")
	
	method seleccionar() = opciones.get(seleccionado)

    method iniciar(){
        self.configurarControles()
        game.addVisual(fondoEmpezar)
        opciones.forEach({option => game.addVisual(option)})
   
    }

    method configurarControles() {
        keyboard.up().onPressDo({ self.arriba() })
        keyboard.down().onPressDo({ self.abajo()})
        keyboard.enter().onPressDo({ self.select() })
        //keyboard.enter().onPressDo({ if (game.hasVisual(fondoEmpezar)){self.select() }})
 
    }

	method arriba(){
    	self.seleccionar().estaSeleccionado(false)
    	seleccionado = (((seleccionado - 1) % opciones.size()) + opciones.size()) % opciones.size()
    	self.seleccionar().estaSeleccionado(true)
    }

    method abajo(){
    	self.seleccionar().estaSeleccionado(false)
    	seleccionado = (((seleccionado + 1) % opciones.size()) + opciones.size()) % opciones.size()
    	self.seleccionar().estaSeleccionado(true)
    }
    method select(){
        	self.seleccionar().iniciar()
    }
}



class Opcion {
    var property nombre
    var property position
    const imgSeleccionada
    const imgNoSeleccionada
    var property estaSeleccionado

    method image() = if (estaSeleccionado) imgSeleccionada else imgNoSeleccionada
}

object play inherits Opcion(
    nombre = "play", 
    imgSeleccionada = "jugarRojo.png",
    imgNoSeleccionada = "jugarNegro.png",
    estaSeleccionado = true, 
    position = game.at(8, 3)
    ) {

    method iniciar(){
        game.schedule(100,
		{
			game.clear()
			configuracion.iniciar()
		})
    }
    
}
object salir inherits Opcion(
    nombre = "salir", 
    imgSeleccionada = "salirRojo.png",
    imgNoSeleccionada = "salirNegro.png",
    estaSeleccionado = false,
    position = game.at(8,1)
    ) {

    method iniciar(){
       	game.schedule(100,
		{
			game.clear()
			consola.iniciar()
		})
    }
    
    
}

