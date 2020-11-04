import comidas.*
class Comensal {
	var property comidas = []
	var property peso = 0
	
	method comer(unaComida) {
		comidas.add(unaComida)
	}
	
	method leAgrada(unaComida)
	
	method satisfecho() {
		return comidas.sum({c=>c.peso()}) >= (peso * 0.01)
	}
}

class Vegetarianos inherits Comensal {
	
	override method leAgrada(comida) {
		return comida.aptoVegetarianos() and comida.valoracion() > 85
	}
	
	override method satisfecho() {
		return super() and comidas.all({c=>not c.esAbundante()})
	}
}

class HambrePopular inherits Comensal {
	
	override method leAgrada(comida) {
		return comida.esAbundante()
	}
}

class DePaladarFino inherits Comensal {
	
	override method leAgrada(comida) {
		return comida.peso().between(150,300) and comida.valoracion() > 100
	}
	
	override method satisfecho() {
		return super() and self.comidas().size().even()
	}
}