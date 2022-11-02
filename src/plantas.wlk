/*
 * Tuviste algunos errores en los métodos abstractos esParcelaIdeal(unaParcela) y espacioOcupa()
 * Otros detalles mínimos en los signos y valores de altura en algunos métodos 
 * El método se asociaBien(unaPlanta) debía ser un método abstracto en las parcialas
 * Los métodos esEcologica y esIndustrial no van, debias modelar clases que herende de parcelas
 */

import parcelas.*

class Planta {
	var property anioObtencion
	var property altura = 0
	
	method esFuerte() {return self.horasDeSolToleradas() > 10}
	method daSemillas(){return self.esFuerte()}
	method horasDeSolToleradas() // debía ser un método abstracto
	method esParcelaIdeal(unaParcela) // debía ser un método abstracto con un parámetro
	/*method seAsociaBien(unaParcela){
		return self.esEcologica(unaParcela) or self.esIndustrial(unaParcela)
	}
	method esEcologica(unaParcela){
		return not unaParcela.tieneComplicaciones() and self.esParcelaIdeal(unaParcela)
	}
	method esIndustrial(unaParcela){
		return unaParcela.cantPlantas() > 3 and self.esFuerte()
	}
	*/
	method espacioOcupa()
}

class Menta inherits Planta {
	override method espacioOcupa() = altura * 3
	override method horasDeSolToleradas() {
		return 6
	}
	override method daSemillas() {return super() or altura > 0.4}
	override method esParcelaIdeal(unaParcela){
		return unaParcela.superficie() > 6
	}
}

class Hierbabuena inherits Menta{
	override method espacioOcupa() {return super() * 2}
}




class Soja inherits Planta {
	override method horasDeSolToleradas(){
		if (altura < 0.5){
			return 6
		}else if (altura <= 1){
			return 7
		}else return 9
	}
	override method daSemillas() { return super() or (anioObtencion > 2007 and altura > 1)}
	override method espacioOcupa() {return altura * 0.5}
	override method esParcelaIdeal(unaParcela){
		return unaParcela.horasDeSol() == self.horasDeSolToleradas()
	}
}

class SojaTransgenica inherits Soja{
	override method daSemillas() {return false}
	override method esParcelaIdeal(unaParcela){
		return unaParcela.cantMaxima() == 1
	}
}


class Quinoa inherits Planta{
	var property horasToleradas
	override method horasDeSolToleradas(){
		return horasToleradas
	}
	override method espacioOcupa() = 0.5
	override method daSemillas() {
		return super() or anioObtencion < 2005
	}
	override method esParcelaIdeal(unaParcela){
		return unaParcela.noHayPlantaMayorA(1.5) //..cuya altura supere los 1.5 metros;
	}
}