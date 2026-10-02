class NaveEspacial {
    var velocidad = 0 //km/seg
    var direccion = 0 //-10 alejado ; 0 rodeando ; 10 acercando
    var combustible = 0
    var estaTranquila = true
    

    

    method direccion()= direccion//.between(-10, 10)

    method velocidad() = velocidad

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

    method prepararViaje(){
        self.cargarCombustible(30000)
        self.acelerar(5000)
    } 
    
    method combustible() = combustible

    method cargarCombustible(litros){
        combustible += litros
    }

    method descargarCombustible(litros){
        combustible -= litros
    }
    method estaTranquila() =
        self.combustible() >= 4000 
        and
        self.velocidad() <= 12000
    

}

class NaveBaliza inherits NaveEspacial{
    var colorDeBaliza = "verde" //"verde", "rojo" o "azul".
    
    method cambiarColorDeBaliza(colorNuevo){
        colorDeBaliza = colorNuevo
    }

   override method prepararViaje() {
    super()
    self.cambiarColorDeBaliza("verde")
    self.ponerseParaleloAlSol()
    }

    override method estaTranquila() = 
        super() and colorDeBaliza != "rojo"
}

class NaveDePasajeros inherits NaveEspacial{
    const pasajeros = 5
    var racionesDeComida = 0
    var racionesDeBebida = 0

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
        super()
        self.cargarRacionesDeComida(4 * pasajeros)
        self.cargarRacionesDeBebida(6 * pasajeros)
        self.acercarseUnPocoAlSol()
        
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
        super()
        self.ponerseInvisible()
        self.acelerar(15000)
        self.emitirMensaje("Saliendo en misión")   
    }

    override method estaTranquila() = 
        super() and not misilesDesplegados 
}

class NaveHospital inherits NaveDePasajeros {
    var quirofanosPreparados = true

    method tieneQuirofanosPreparados() = quirofanosPreparados

    method cambiarEstadoQuirofanos(){
        quirofanosPreparados = not quirofanosPreparados
    }
    override method estaTranquila() = 
        super() and not quirofanosPreparados
}

class NaveDeCombateSigilosa inherits NaveDeCombate {
    override method estaTranquila() = 
        super() and not self.estaInvisible()
}