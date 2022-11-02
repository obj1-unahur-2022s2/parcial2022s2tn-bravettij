import plantas.*

class Parcela {
	var property ancho
	var property largo
	var property horasDeSol
	const plantas = []
	method cantPlantas() {return plantas.size()}
	method agregarPlanta(unaPlanta) {return plantas.add(unaPlanta)}
	method plantarUnaPlanta(unaPlanta) {
		if (self.cantMaxima() == plantas.size()){
			console.println('ERROR!! Cantidad maxima alcanzada')
		}else self.agregarPlanta(unaPlanta)
	}
	method quitarPlanta(unaPlanta) {return plantas.remove(unaPlanta)}
	method superficie() {return ancho * largo}
	method cantMaxima() {
		if (ancho > largo){
			return self.superficie() / 5
		}else return self.superficie() / 3 + largo
	}
	method hayPlantaNoTolera() {return plantas.any({p => p.horasDeSolToleradas()< horasDeSol} )}
	method tieneComplicaciones() {return self.hayPlantaNoTolera()}	
	method noHayPlantaMayorA(alt){ return !plantas.any({p => p.altura() > alt})}
	method parcelaConMasDe4Plantas() {return plantas.size() > 4}
	method porcentajePlantasBienAsociadas() {return plantas.sum({p => p.seAsociaBien(self)}) / plantas.size() }
}
