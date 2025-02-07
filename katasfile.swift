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
