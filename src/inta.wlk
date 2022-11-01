import parcelas.*

object inta{
	const parcelas = []
	
	method agregarParcela(unaParcela) {return parcelas.add(unaParcela)}
	method quitarParcela(unaParcela) {return parcelas.remove(unaParcela)}
	method todasLasPlantas() {return parcelas.sum({p => p.cantPlantas()})}
	method promedioDePlantas() {return self.todasLasPlantas() / parcelas.size()}
	method parcelaMasAutosustentable() {return self.parcelasConMasDe4Plantas().max({p => p.porcentajePlantasBienAsociadas()})}
	method parcelasConMasDe4Plantas() {return parcelas.filter({p => p.cantPlantas() > 4})}
	
}