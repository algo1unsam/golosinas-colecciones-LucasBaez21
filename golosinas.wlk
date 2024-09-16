object bombon {
    var property precio = 5
    var property peso = 15
    const property sabor = "frutilla"
    const property gluten = false
       
    method mordisco(){
        peso = (peso * 0.8) - 1
    }
}

object alfajor {
    var property precio = 12
    var property peso = 300
    const property sabor = "chocolate"
    const property gluten = true
       
    method mordisco(){
        peso = peso * 0.8
    }
}

object caramelo {
    var property precio = 1
    var property peso = 5
    const property sabor = "frutilla"
    const property gluten = false
       
    method mordisco(){
        peso -= 1
    }
}

object chupetin {
    var property precio = 2
    var property peso = 7
    const property sabor = "naranja"
    const property gluten = false
       
    method mordisco(){
        if (peso >= 2)
            peso = peso * 0.9
    }
}
object oblea {
    var property precio = 5
    var property peso = 250
    const property sabor = "vainilla"
    const property gluten = true
       
    method mordisco(){
        if (peso > 70)
            peso = peso * 0.5
        else
            peso = peso * 0.75
    }
}

object chocolatin {
    var property precio = null
    var property peso = null
    var property pesoInicial = null
    const property sabor = "chocolate"
    const property gluten = true

    method asignarPeso(pesoNuevo){
        peso = pesoNuevo
        pesoInicial = pesoNuevo
        precio = pesoInicial * 0.5
    }
    method mordisco(){
       peso = peso - 2
    }
}

object golosinaBaniada {
    var property precio = null
    var property peso = null
    var property pesoInicial = null
    var property sabor = null
    var property gluten = null
    var property pesoBaniado = 4
    var property precioBaniado = 2
    
    method baniada(golosina){
        pesoBaniado = 4
        pesoInicial = golosina.peso()
        peso = pesoInicial + pesoBaniado
        precio = golosina.precio() + precioBaniado
        sabor = golosina.sabor()
        gluten = golosina.gluten()
        
    }
    method mordisco(golosina){
        golosina.mordisco()
        sabor = golosina.sabor()
        pesoInicial = golosina.peso()
        if (pesoBaniado > 0){
            pesoBaniado -= 2
        }
        peso = pesoInicial + pesoBaniado
    }

}

object pastilla {
  var property peso = 5
  var property gluten = null
  var property precio = null 
  var property sabor = "frutilla"


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
