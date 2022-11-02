/*
 * agregarParcela y quitarParcela son métodos de indicación NO llevan return
 * parcelaMasAutosustentable esta mal
 */
import parcelas.*
import plantas.*
object inta{
	const parcelas = []
	
	method agregarParcela(unaParcela) { parcelas.add(unaParcela)}
	method quitarParcela(unaParcela) { parcelas.remove(unaParcela)}
	method todasLasPlantas() { return parcelas.sum({p => p.cantPlantas()}) }
	method promedioDePlantas() {return self.todasLasPlantas() / parcelas.size()}
	
	//no puedo conseguir solucionar el mas autosustentable :'(
	method parcelaMasAutosustentable() {return self.parcelasConMasDe4Plantas().map({p => p.porcentajePlantasBienAsociadas()})}
	method parcelasConMasDe4Plantas() = parcelas.filter({p => p.parcelaConMasDe4Plantas()})
	
}