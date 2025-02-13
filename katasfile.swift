import Foundation

// 6/2/25 
// Kata: https://www.codewars.com/kata/5966eeb31b229e44eb00007a
func toVaporWave(_ text: String) -> String {
	return String(text
		.filter { !$0.isWhitespace }
		.uppercased()
		.map { "\($0)  " }
		.joined()
		.dropLast(2))
}

print(toVaporWave("Lets go to the movies"))
print(toVaporWave("Why isn't my code working?"))

// 7/2/25
// Kata: https://www.codewars.com/kata/57a0556c7cb1f31ab3000ad7
func makeUpperCase(_ input: String) -> String {
	return input.uppercased()
}

makeUpperCase("Hello World!")

// Kata: https://www.codewars.com/kata/58ce8725c835848ad6000007
func potatoes (_ p0: Int, _ w0: Int, _ p1: Int) -> Int {
	let dryMatter = w0 * (100 - p0) / 100
	return dryMatter * 100 / (100 - p1)
}

potatoes(99, 100, 98)

// 8/2/25
// Kata: https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1
func countDuplicates(_ input: String) -> Int {
	guard !input.isEmpty else { return 0 }
	var characterCount: [Character : Int] = [:]
	for character in input.lowercased() {
		characterCount[character, default: 0] += 1
	}
	return characterCount.values.filter { $0 > 1}.count
}

countDuplicates("Hahaha this is a test")

// 10/2/25
// Kata: https://www.codewars.com/kata/526571aae218b8ee490006f4
func countBits(_ num: Int) -> Int {
	guard num >= 0 else { return 0 }
	return String(num, radix: 2).filter { $0 == "1" }.count
}

print(countBits(1234))

// 12/2/25
// Kata: https://www.codewars.com/kata/599bb194b7a047b04d000077
func howManyPizzas(_ n: Int) -> String {
	let radius = Double(n) / 2.0
	let area = Double.pi * pow(radius, 2)
	let areaOfEightInch = Double.pi * pow(4, 2)
	let numberOfPizzas = area / areaOfEightInch
	let completePizzas = Int(numberOfPizzas)
	let sliceOfPizza = Int(round(numberOfPizzas.truncatingRemainder(dividingBy: 1) * 8))
	return "pizzas: \(completePizzas), slices: \(sliceOfPizza)"
}

howManyPizzas(16)
howManyPizzas(12)
howManyPizzas(8)
howManyPizzas(6)
howManyPizzas(0)

// 13/2/25
// Kata: https://www.codewars.com/kata/5fc7d2d2682ff3000e1a3fbc 
func isAValidMessage(_ message: String) -> Bool {
	guard !message.isEmpty else { return true }

	var characters = Array(message)
	var index = 0
	var pairs: [(Int, String)] = []

	while index < characters.count {
		var numberString = ""
		while index < characters.count, let _ = Int(String(characters[index])) {
			numberString.append(characters[index])
			index += 1
		}
		
		guard let number = Int(numberString) else { return false }
		
		var word = ""
		while index < characters.count, characters[index].isLetter {
			word.append(characters[index])
			index += 1
		}

		if word.count != number {
			return false
		}

		pairs.append((number, word))
	}

	return true
}

isAValidMessage("3hey5hello2hi")
isAValidMessage("4code13hellocodewars")
isAValidMessage("3hey5hello2hi5")
isAValidMessage("code4hello5")
isAValidMessage("1a2bb3ccc4dddd5eeeee")
isAValidMessage("")