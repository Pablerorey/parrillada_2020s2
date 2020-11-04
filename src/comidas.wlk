
class Plato {
	var property peso = 0
	
	method esAbundante() {
		return self.peso() > 250
	}
	
	method valoracion()
	
	method aptoVegetarianos()
}

class Provoleta inherits Plato {
	var property especias = false
	
	override method aptoVegetarianos() {
		return not self.especias()
	}
	
	method esEspecial() {
		return self.esAbundante() or self.especias()
	}
	
	override method valoracion() {
		return if(self.esEspecial()) {120} else {80}
	}
}

class HamburguesasDeCarne inherits Plato {
	var property pan = null
	
	override method peso() {
		return 250
	}
	
	override method aptoVegetarianos() {
		return false
	}	
	
	override method valoracion() {
		return 60 + pan.valoracion()
	}
}

object industrial {
	method valoracion() {
		return 0
	}
}

object casero {
	method valoracion() {
		return 20
	}
}

object deMasaMadre {
	method valoracion() {
		return 45
	}
}

class HamburguesasVegetarianas inherits HamburguesasDeCarne {
	var property legumbre = null
	
	override method aptoVegetarianos() {
		return true
	}
	
	override method valoracion() {
		return super() + (2 * self.legumbre().size()).min(17)
	}
}

class Parrillada inherits Plato {
	const property cortesPedidos = []
	
	method agregarCortes(tipos) {
		cortesPedidos.addAll(tipos)
	}
	
	override method peso() {
		return cortesPedidos.sum({c=>c.pesoDelCorte()})
	}
	
	override method aptoVegetarianos() {
		return false
	}	
	
	method maximaCalidadDeCorte() {
		return cortesPedidos.map({c=>c.calidad()}).max()
	}
	override method valoracion() {
		return (15 * self.maximaCalidadDeCorte() - self.cortesPedidos().size()).max(0)
	}
}

class Corte {
	var property nombre = null
	var property calidad = 0 
	var property pesoDelCorte = 0
}