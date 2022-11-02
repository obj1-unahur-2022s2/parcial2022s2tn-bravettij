/*
 * ParcelaEcologica y ParcelaIndustrial debían ser clases que hereden de parcial y no estan modeladas
 * El método  agregarPlanta(unaPlanta) no lleva RETURN es una indicación
 * El método quitarPlanta(unaPlanta) no lleva RETURN es una indicación
 * En el agregar planta falto la validacion que la planta no puede tolerar el sol de la parcela
 * Para lanzar una excepcion debes usar self.error("ERROR!! Cant...") y usaste un console.println()
 */
import plantas.*

class Parcela {
	var property ancho
	var property largo
	var property horasDeSol
	const plantas = []
	method cantPlantas() {return plantas.size()}
	method agregarPlanta(unaPlanta) {plantas.add(unaPlanta)}
	method plantarUnaPlanta(unaPlanta) {
		if (self.cantMaxima() == plantas.size()){
			self.error('ERROR!! Cantidad maxima alcanzada')
		}
		self.agregarPlanta(unaPlanta)
	}
	method quitarPlanta(unaPlanta) {plantas.remove(unaPlanta)}
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
