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

/* ¿Es un número primo?
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

// 10/2/25 - Challenge:
/* Area de un polígono
 * Crea una única función (importante que sólo sea una) que sea capaz
 * de calcular y retornar el área de un polígono.
 * - La función recibirá por parámetro sólo UN polígono a la vez.
 * - Los polígonos soportados serán Triángulo, Cuadrado y Rectángulo.
 * - Imprime el cálculo del área de un polígono de cada tipo.
 */

enum Polygon {
	case triangle(base: Double, height: Double)
	case square(side: Double)
	case rectangle(width: Double, height: Double)
}

func polygonArea(_ polygon: Polygon) -> Double {
	switch polygon {
		case .triangle(let base, let height):
			return (base * height) / 2
		case .square(let side):
			return side * side
		case .rectangle(let width, let height):
			return width * height
	}
}

print(polygonArea(.square(side: 5)))
print(polygonArea(.rectangle(width: 10, height: 2)))
print(polygonArea(.triangle(base: 6, height: 18)))


// 12/2/25 - Challenge:
/* Invirtiendo cadenas
 * Crea un programa que invierta el orden de una cadena de texto
 * sin usar funciones propias del lenguaje que lo hagan de forma automática.
 * - Si le pasamos "Hola mundo" nos retornaría "odnum aloH"
 */

func invertedChain(_ text: String) -> String {
	guard !text.isEmpty else { return "" }
	var inverted = ""
	for letter in text {
		inverted.insert(letter, at: inverted.startIndex)
	}
	return inverted
}

invertedChain("Hello world!")
invertedChain("It's work")

// 13/2/25 - Challenge:
/* Contando palabras
 * Crea un programa que cuente cuantas veces se repite cada palabra
 * y que muestre el recuento final de todas ellas.
 * - Los signos de puntuación no forman parte de la palabra.
 * - Una palabra es la misma aunque aparezca en mayúsculas y minúsculas.
 * - No se pueden utilizar funciones propias del lenguaje que
 *   lo resuelvan automáticamente.
 */

import Foundation

func countWordsIn(text: String) -> [String:Int] {
	guard !text.isEmpty else { return [:] }
	let cleanText = text
		.lowercased()
		.filter { $0.isLetter || $0.isWhitespace }
	
	let words = cleanText.split(separator: " ").map(String.init)
	
	return words.reduce(into: [:]) { counts, word in
		counts[word, default: 0] += 1
	}
}

let result = countWordsIn(text: "Hello world! Hello Swift. Swift is awesome, awesome awesome.")

result.forEach { key, value in
	print("Word: \(key), count: \(value)")
}