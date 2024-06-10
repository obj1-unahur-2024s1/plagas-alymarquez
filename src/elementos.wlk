import plagas.*

class Hogar{
	var nivelMugre
	var property confort
	
	method esBueno() = nivelMugre <= confort/2
	
	method nivelMugre() = nivelMugre
	
	method nivelMugre(cantidad){
		nivelMugre = nivelMugre + cantidad
	}
	
	method recibeAtaquePlaga(plaga){ 
		self.nivelMugre(plaga.nivelDeDanio())
		plaga.efectoAlAtacar()
	}
}

class Huerta{
	var capacidadProduccion
	
	method esBueno() = capacidadProduccion > nivelHuertas.nivel()
	
	method capacidadProduccion() = capacidadProduccion
	
	method capacidadProduccion(cantidad){
		capacidadProduccion -= cantidad
	}
	
	method recibeAtaquePlaga(plaga){
		const disminucion = plaga.nivelDeDanio() * 0.1 +
			if (plaga.transmitenEnfermedades()) 10 else 0 
			
		self.capacidadProduccion(disminucion)
		plaga.efectoAlAtacar()
	}
}

object nivelHuertas{
	var property nivel = 100
}

class Mascota{
	var nivelSalud
	
	method esBueno() = nivelSalud > 250
	
	method nivelSalud() = nivelSalud
	
	method nivelSalud(cantidad){
		nivelSalud -= cantidad
	}
	
	method recibeAtaquePlaga(plaga){
		if(plaga.transmitenEnfermedades()){
			self.nivelSalud(plaga.nivelDeDanio())
		}
		
		plaga.efectoAlAtacar()
	}
}


class Barrios{
	const property elementos = []
	
	method agregarElemento(elemento){
		elementos.add(elemento)
	}
	
	method esCopado() = 
		elementos.count({x => x.esBueno()}) > elementos.count({x => not x.esBueno()})
		
}




