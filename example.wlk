// Personas:

class Persona {
  var recursos = 20
  var edad

  method esDestacada() = edad.between(18, 65) or recursos > 30

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