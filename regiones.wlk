import personas.*
import planetas.*
import construcciones.*

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