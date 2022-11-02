import parcelas.*
import plantas.*
object inta{
	const parcelas = []
	
	method agregarParcela(unaParcela) {return parcelas.add(unaParcela)}
	method quitarParcela(unaParcela) {return parcelas.remove(unaParcela)}
	method todasLasPlantas() { return parcelas.sum({p => p.cantPlantas()}) }
	method promedioDePlantas() {return self.todasLasPlantas() / parcelas.size()}
	
	//no puedo conseguir solucionar el mas autosustentable :'(
	method parcelaMasAutosustentable() {return self.parcelasConMasDe4Plantas().map({p => p.porcentajePlantasBienAsociadas()})}
	method parcelasConMasDe4Plantas() = parcelas.filter({p => p.parcelaConMasDe4Plantas()})
	
}