class Golosina {
    var property precio
    var property peso
    var property sabor
    var property gluten

}
class Bombon inherits Golosina(precio = 5, peso = 15, sabor = "frutilla", gluten = false){
    method mordisco (){
        peso = (peso * 0.8) - 1
    }
}
class BombonDuro inherits Bombon{
    override method mordisco (){
        peso = peso * 0.9
    }
}
class Alfajor inherits Golosina(precio = 12, peso = 300, sabor = "chocolate", gluten = true){
    method mordisco (){
        peso = peso * 0.8
    }
}
class Caramelo inherits Golosina(precio = 1, peso = 5, sabor = "frutilla", gluten = false){
    method mordisco (){
        peso -= 1
    }
}
class CarameloRelleno inherits Caramelo{
    override method mordisco (){
        peso -= 1
        sabor = "chocolate"
    }
}
class Chupetin inherits Golosina(precio = 2, peso = 7, sabor = "naranja", gluten = false){
    method mordisco (){
        if (peso >= 2) peso = peso * 0.9
    }
}
class Oblea inherits Golosina(precio = 5, peso = 250, sabor = "vainilla", gluten = true){
    method mordisco (){
        if (peso > 70)
            peso = peso * 0.5
        else
            peso = peso * 0.75
    }
}
class ObleaCrujiente inherits Oblea{
    var property mordiscos = 3
    override method mordisco(){
    if(mordiscos > 0){
        peso = peso - 3
        mordiscos -= 1
    } 
    if (peso > 70)
            peso = peso * 0.5
        else
            peso = peso * 0.75
    }
}
class Chocolatin inherits Golosina(precio = null, peso = null, sabor = "chocolate", gluten = true){
    method asignarPeso(pesoNuevo){
        peso = pesoNuevo
        precio = peso * 0.5
    }
    method mordisco(){
        peso = peso - 2
        }
}
class ChocolatinVIP inherits Chocolatin{
    var property humedad = 0
    override method asignarPeso(pesoNuevo){
        peso = pesoNuevo * (1 + humedad)
        precio = peso * 0.5
    }
}
class ChocolatinPremium inherits ChocolatinVIP{
    override method asignarPeso(pesoNuevo){
        peso = pesoNuevo * (1 + (humedad / 2))
        precio = peso * 0.5
    }
}
class GolosinaBaniada inherits Golosina(precio = golosinaBase.precio(), peso = golosinaBase.peso() + pesoBaniado, sabor = golosinaBase.sabor(), gluten = golosinaBase.gluten()){
    var property pesoBaniado = 4
    var property precioBaniado = 2
    var property golosinaBase

    method mordisco(){
        golosinaBase.mordisco()
        sabor = golosinaBase.sabor()
        pesoBaniado -= 2
        peso = golosinaBase.peso() + pesoBaniado.max(0)
        gluten = golosinaBase.gluten()
    }
    override method precio() = golosinaBase.precio() + precioBaniado
}
class Pastilla inherits Golosina(precio = null, peso = 5, sabor = "frutilla", gluten = null){
    method asignarGluten(glutenNuevo){
        gluten = glutenNuevo
        if (!gluten)
            precio = 7
        else
            precio = 10
    }
    method mordisco(){
        if (sabor == "frutilla")
            sabor = "chocolate"
        else if (sabor == "chocolate")
            sabor = "naranja"
        else 
            sabor = "frutilla"
    }
}
object mariano {
var property bolsa =  []
  method comprar(unaGolosina){
    bolsa.add(unaGolosina)
  }
  method desechar(unaGolosina){
    bolsa.remove(unaGolosina)
  }
  method probarGolosinas(){
    bolsa.forEach{golosina => golosina.mordisco()}
  }
  method hayGolosinaSinTACC() = bolsa.any{golosina => !golosina.gluten()}
  method preciosCuidados() = bolsa.all{golosina => golosina.precio() <= 10}
  method golosinaDeSabor(unSabor) = bolsa.find{golosina => golosina.sabor() == unSabor}
  method golosinasDeSabor(unSabor) = bolsa.filter{golosina => golosina.sabor() == unSabor}
  method sabores() = bolsa.map{golosina => golosina.sabor()}.asSet()
  method golosinaMasCara() = bolsa.max{golosina => golosina.precio()}
  method pesoGolosinas() = bolsa.sum{golosina => golosina.peso()}
  
  method golosinasFaltantes(golosinasDeseadas) = golosinasDeseadas.difference(bolsa)
  method gustosFaltantes(gustosDeseados) = gustosDeseados.difference(self.sabores())
  
  method baniar(unaGolosina){
    const golosinaBaniada = new GolosinaBaniada(golosinaBase = unaGolosina)
        bolsa.add(golosinaBaniada)
        return golosinaBaniada
  }
}