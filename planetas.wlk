// Planetas:
class Planeta {
    const habitantes = #{}
    const construcciones = #{} 

    method habitantes() = habitantes

    method habitantesDestacados() = habitantes.filter({p => p.esDestacada()})

    method habitanteConMasRecursos() = habitantes.max({m => m.recursos()})

    method delegacionDiplomatica(){
        const delegacion = self.habitantesDestacados()
        
        if(delegacion.contains(self.habitanteConMasRecursos())){
            return delegacion
        } else {
            delegacion.add(self.habitanteConMasRecursos())
            return delegacion
        }
    } 

    method esValioso() = construcciones.sum({c => c.valor()}) > 100

    method construir(unaConstruccion){
        construcciones.add(unaConstruccion)
    }
}