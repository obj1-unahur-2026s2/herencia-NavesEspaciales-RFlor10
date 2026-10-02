class NaveEspacial {
    var velocidad = 0 //km/seg
    var direccion = 0 //-10 alejado ; 0 rodeando ; 10 acercando
    var combustible = 0


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

    method prepararViaje() 

    method cargarCombustible(litros){
        combustible += litros
    }

    method descargarCombustible(litros){
        combustible -= litros
    }

}

class NaveBaliza inherits NaveEspacial{
    var baliza = "verde" //"verde", "rojo" o "azul".
    method cambiarColorDeBaliza(colorNuevo){
        baliza = colorNuevo
    }

   override method prepararViaje() {
    self.cambiarColorDeBaliza("verde")
    self.ponerseParaleloAlSol()
    self.cargarCombustible(30000)
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

    override method prepararViaje() {
        self.cargarRacionesDeComida(4 * pasajeros)
        self.cargarRacionesDeBebida(6 * pasajeros)
        self.acercarseUnPocoAlSol()
        self.cargarCombustible(30000)
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
    method mensajesEmitidos() = mensajesEmitidos.size()
    method primerMensajeEmitido() = mensajesEmitidos.first()
    method ultimoMensajeEmitido() = mensajesEmitidos.last()
    method emitioMensaje(mensaje) = mensajesEmitidos.contains(mensaje)
    method esEscueta() = mensajesEmitidos.all({m => m.lenght() <=30 })
    
    override method prepararViaje() {
        self.ponerseInvisible()
        self.emitirMensaje("Saliendo en misión")
        self.cargarCombustible(30000)
        self.acelerar(5000)
        self.acelerar(15000)
    }
}