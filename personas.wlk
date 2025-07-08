import construcciones.*

// Personas:

class Persona {
  var recursos = 20
  var edad

  method esDestacada() = edad.between(18, 65) or recursos > 30

  method recursos() = recursos

  method ganarMonedas(unaCantidad){
    recursos += unaCantidad
  }

  method gastarMonedas(unaCantidad){
    recursos -= unaCantidad
  }

  method cumplirAnios(){
    edad += 1
  }
}


class Productor inherits Persona {
  const tecnicas = #{"cultivo"}

  override method recursos() = super() * tecnicas.size()

  override method esDestacada() = super() or tecnicas.size() > 5

  method tecnicas() = tecnicas

  method realizarTecnicaPor(unaTecnica, tiempo){
    if (tecnicas.contains(unaTecnica))
      recursos += (3 * tiempo)
  }

  method aprenderTecnica(unaTecnica){
    tecnicas.add(unaTecnica)
  }

  method trabajarEn(unPlaneta, tiempo){
    if(unPlaneta.habitantes().contains(self)){
      self.realizarTecnicaPor(self.tecnicas().last(), tiempo)
    }
  }
}


class Constructor inherits Persona {
  const tecnicas = #{"cultivo"}
  const regionDondeVive
  const property inteligencia
  var cantidadConstrucciones

  method tecnicas() = tecnicas

  override method ganarMonedas(unaCatidad){
    super(unaCatidad) + (10 * cantidadConstrucciones)
  } 

  override method esDestacada() = cantidadConstrucciones > 5

  method trabajarEn(unPlaneta, tiempo){
    unPlaneta.construir(regionDondeVive.construccion(tiempo))
    cantidadConstrucciones += 1
    self.gastarMonedas(5)
  }

}


// Regiones:
object montaña {
  method construccion(unConstructor, tiempo){
    const unaMuralla = new Muralla(longitud = (tiempo / 2))
    return unaMuralla
  }
}

object costa {
  method construccion(unConstructor, tiempo){
    const unMuseo = new Museo(superficie = tiempo, indiceImportancia = 1)
    return unMuseo
  }
}

object bosque {
  method construccion(unConstructor, tiempo){
    const unMuseo = new Museo(superficie = unConstructor.inteligencia(), indiceImportancia = 1)
    return unMuseo
  }
}

object llanura {
  method construccion(unConstructor, tiempo){
    if(unConstructor.esDestacada()){
      const unMuseo = new Museo(superficie = tiempo, indiceImportancia = 1)
      return unMuseo
    }
    else{
      const unaMuralla = new Muralla(longitud = (tiempo / 2))
      return unaMuralla
    }
  }
}


/*
se puede heredar un objeto de una clase 
*/