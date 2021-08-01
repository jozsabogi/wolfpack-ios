/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
let myCollection: [Any] = ["Bogi", 2.6, 9, 8, true, 88 ]
print(myCollection)
//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for elem in myCollection {
    if let intElem = elem as? Int {
        print("The integer has a value of \(intElem)")
    }
}

//:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
let myDictionary: [String : Any] = ["one": 1, "two": 4.8, "three": "String", "for": true]

//:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
var total: Double = 0

for value in myDictionary.values {
    if let double = value as? Double {
        total += double
    } else if let int = value as? Int {
        total += Double(int)
    } else if let _ = value as? String {
        total += 1
    } else if let bool = value as? Bool {
        if bool == true {
            total += 2
        } else {
            total -= 3
        }
    }
}

print("Total value:")
print(total)

//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
 

/*:
page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
 */
