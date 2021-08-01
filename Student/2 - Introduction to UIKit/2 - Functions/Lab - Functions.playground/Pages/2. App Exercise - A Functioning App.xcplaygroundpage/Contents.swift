/*:
## App Exercise - A Functioning App
 
 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 As you may have guessed, functions are key to making your app work. For example, in every exercise dealing with step count until now, you have simply assigned a number of steps to a `steps` variable. This isn't very realistic seeing as the number of steps you take increments one at a time and continues changing throughout the day.
 
 A reoccurring process like this is a perfect candidate for a function. Write a function called `incrementSteps` after the declaration of `steps` below that will increment `steps` by one and then print its value. Call the function multiple times and observe the printouts.
 */
var steps = 0
print(steps)

func incrementSteps() {
    steps += 1
    print(steps)
}

incrementSteps()
incrementSteps()
incrementSteps()
incrementSteps()
//:  Similarly, if you want to regularly provide progress updates to your user, you can put your control flow statements that check on progress into a function. Write a function called `progressUpdate` after the declaration of `goal` below. The function should print "You're off to a good start." if `steps` is less than 10% of `goal`, "You're almost halfway there!" if `steps` is less than half of `goal`, "You're over halfway there!" if `steps` is less than 90% of `goal`, "You're almost there!" if `steps` is less than `goal`, and "You beat your goal!" otherwise. Call the function and observe the printout.
let goal = 10000
steps = 5000

func progressUpdate() {
    switch steps {
    case 0...goal * 10 / 100:
        print("You're off to a good start.")
    case goal * 10 / 100 + 1 ... goal / 2 - 1:
        print( "You're almost halfway there!")
    case goal / 2...goal * 90 / 100 - 1:
        print("You're over halfway there!")
    case goal * 90 / 100...goal:
        print("You're almost there!")
    default:
        print("You beat your goal!")
    }
}

progressUpdate()
/*:
[Previous](@previous)  |  page 2 of 6  |  [Next: Exercise - Parameters and Argument Labels](@next)
 */
