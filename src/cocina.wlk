import comidas.*
import comensales.*

object cocina {
	const property comidasPreparadas = []
	
	method agregarAlMenu(comidas) {
		comidasPreparadas.addAll(comidas)
	}
	
	method removerPlatoDelMenu(comida) {
		comidasPreparadas.remove(comida)
	}
	
	method comidasVegetarianas() {
		return comidasPreparadas.filter({c=>c.aptoVegetarianos()})
	}
	
	method comidasCarnivoras() {
		return comidasPreparadas.filter({c=>not c.aptoVegetarianos()})
	}

	method ofertaVegetariana() {
		return (self.comidasVegetarianas().size() - self.comidasCarnivoras().size()).abs() >= 2
	}
	
	method platoFuerteCarnivoro() {
		return self.comidasCarnivoras().max({c=>c.valoracion()})
	}
	
	method comidasQueLeGustanA(comensal) {
		return comidasPreparadas.filter({comida=>comensal.leAgrada(comida)})
	}
	
	method elegirUnPlato() {
		return comidasPreparadas.anyOne()
	}
	method elegirPlatoPara(comensal) {
		if(comensal.leAgrada(self.elegirUnPlato())) {
			self.removerPlatoDelMenu(self.elegirUnPlato())
			comensal.comer(self.elegirUnPlato())
		}
		else { self.error("NO HAY NINGUN PLATO EN EL MENU DEL AGRADO DEL COMENSAL")}
	}
}