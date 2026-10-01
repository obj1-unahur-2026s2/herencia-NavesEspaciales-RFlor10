class NaveEspacial {
    var velocidad = 0 //km/seg
    var direccion = 0 //-10 alejado ; 0 rodeando ; 10 acercando

    method direccion()= direccion//.between(-10, 10)
    method acelerar(cuanto){
        velocidad = 100000.min(velocidad + cuanto)
        }
    method desacelerar(cuanto){
        velocidad = 0.max(velocidad - cuanto)
        }    
    method irHaciaElSol(){
        direccion = 10
    }
    method escaparseDelSol(){
        direccion = -10
    }
    method ponerseParaleloAlSol(){
        direccion = 0
    }
    method acercarseUnPocoAlSol(){
        direccion = 10.min(direccion + 1)
    }
    method alejarseUnPocoDelSol(){
        direccion = (-10).max(direccion - 1)
    }
}

class NaveBaliza inherits NaveEspacial{
    var baliza = "verde" //"verde", "rojo" o "azul".
    method cambiarColorDeBaliza(colorNuevo){
        baliza = colorNuevo
    }

}

class NaveDePasajeros inherits NaveEspacial{
    const pasajeros = 5
    var racionesDeComida = 5
    var racionesDeBebida = 5

    method cargarRacionesDeComida(cantidad) { 
         racionesDeComida += cantidad
    }
    method cargarRacionesDeBebida(cantidad)  {
        racionesDeBebida += cantidad
    }

    method descargarRacionesDeComida(cantidad) {
         0.max(racionesDeComida - cantidad)
    }
    method descargarRacionesDeBebida(cantidad) {
        0.max(racionesDeBebida - cantidad)
    }
}

class NaveDeCombate inherits NaveEspacial{
    var visible = true
    var misilesDesplegados = true
    const mensajesEmitidos = []

    method  ponerseVisible(){
        visible = true
    }
    method ponerseInvisible(){
        visible = false
    }
    method estaInvisible() = not visible

    method desplegarMisiles() {
        misilesDesplegados = true
    }
    method replegarMisiles() {
        misilesDesplegados = false
    }
    method misilesDesplegados() = misilesDesplegados

    method emitirMensaje(mensaje){
        mensajesEmitidos.add(mensaje)
    }
    method mensajesEmitidos() = mensajesEmitidos.count()
    method primerMensajeEmitido() = mensajesEmitidos.first()
    method ultimoMensajeEmitido() = mensajesEmitidos.last()
    method emitioMensaje(mensaje) = mensajesEmitidos.contains(mensaje)
    method esEscueta() = mensajesEmitidos.size()<=30
    
}