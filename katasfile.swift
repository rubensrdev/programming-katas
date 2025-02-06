
// 6/2/25 - Kata: https://www.codewars.com/kata/5966eeb31b229e44eb00007a

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
