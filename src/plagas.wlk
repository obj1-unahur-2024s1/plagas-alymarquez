import elementos.*

class Plaga{
	var property poblacion
	
	method nivelDeDanio() = 0
	
	method transmitenEnfermedades() = poblacion >= 10
	
	method efectoAlAtacar(){ poblacion += poblacion*0.1}
	
	method atacarElemento(elemento){
		elemento.recibeAtaquePlaga(self)
	}
	
}

class Cucarachas inherits Plaga{
	var property pesoPromedio
	
	override method nivelDeDanio() = poblacion/2
	
	override method transmitenEnfermedades() =
		super() and pesoPromedio >= 10 
	
	override method efectoAlAtacar(){
		super()
		pesoPromedio += 2
	}

}

class Pulgas inherits Plaga{
	override method nivelDeDanio() = poblacion*2
}

class Garrapatas inherits Plaga{
	override method efectoAlAtacar(){
		poblacion += poblacion*0.2
	}
}

class Mosquitos inherits Plaga{
	override method nivelDeDanio() = poblacion
	
	override method transmitenEnfermedades() = 
		super() and poblacion % 3 == 0
}



