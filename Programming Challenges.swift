import Foundation

// 7/2/25 - Challenge:

/* FizzBuzz
 * Escribe un programa que muestre por consola (con un print) los
 * números de 1 a 100 (ambos incluidos y con un salto de línea entre
 * cada impresión), sustituyendo los siguientes:
 * - Múltiplos de 3 por la palabra "fizz".
 * - Múltiplos de 5 por la palabra "buzz".
 * - Múltiplos de 3 y de 5 a la vez por la palabra "fizzbuzz".
 */



func fizzBuzzGame() {
	for n in 1...100 {
		var output = ""
		if n % 3 == 0 {
			output += "fizz"
		}
		if n % 5 == 0 {
			output += "buzz"
		}
		
		print(output.isEmpty ? n : output)
	}
}

fizzBuzzGame()

/* Es un anagrama?
 * Escribe una función que reciba dos palabras (String) y retorne
 * verdadero o falso (Bool) según sean o no anagramas.
 * - Un Anagrama consiste en formar una palabra reordenando TODAS
 *   las letras de otra palabra inicial.
 * - NO hace falta comprobar que ambas palabras existan.
 * - Dos palabras exactamente iguales no son anagrama.
 */

func isAnagram(_ word1: String, _ word2: String) -> Bool {
	guard word1 != word2 else {
		return false
	}
	guard word1.count == word2.count else {
		return false
	}
	return Array(word1.lowercased()).sorted() == Array(word2.lowercased()).sorted()
}

print(isAnagram("roma", "amor"))
print(isAnagram("coche", "moto"))
print(isAnagram("abc", "cba"))
print(isAnagram("book", "book"))


// 8/2/25 - Challenge:

/*
 * Escribe un programa que se encargue de comprobar si un número es o no primo.
 * Hecho esto, imprime los números primos entre 1 y 100.
 */

func isPrime(_ num: Int) -> Bool {
	guard num != 1 else { return false }
	guard num != 2 else { return true }
	guard num > 2 && num % 2 != 0 else { return false }
	let limit = Int(Double(num).squareRoot())
	for i in stride(from: 3, to: limit, by: 2) {
		if num % i == 0 {
			return false
		}
	}
	return true
}

for num in 1...100 {
	if isPrime(num) {
		print(num)
	}
}