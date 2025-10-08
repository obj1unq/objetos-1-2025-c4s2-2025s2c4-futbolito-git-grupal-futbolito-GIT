/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	
	method image() {
		return "lionel-titular.png"
	}

	method estaSobre(cosa) = (position.x() == cosa.position().x() && 
							  position.y() == cosa.position().y() )

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {

		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method patear(pelota) {
		self.validarQuePuedePatear(pelota)
		pelota.lanzarPorPateo()
	}

	method validarQuePuedePatear(pelota) {
		if (not self.estaSobre(pelota) ) {
			self.error("No puede patear porque la pelota esta lejos")
		}
	}
	
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)

	method estaEnPosicion(ejeX, ejeY) = ( position.x() == ejeX && position.y() == ejeY )

	method lanzarPorPateo() {
		const nuevaPosX = (position.x() + 3).min(game.width() - 1)
        position = game.at(nuevaPosX, position.y())
	}

}
