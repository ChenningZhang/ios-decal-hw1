//: # Homework 1 - Debugging and Swift Intro

//: To see markup format, go to Editor -> Show Rendered Markup


import UIKit


//: ## Q1: Optionals
//: The compiler is yelling at us. Why isn't this the correct way to unwrap optionals?

class Foo {
    
    var wordA : String!
    var wordB : String!
    
    init (words: [String?]) {
        wordA = words[0]
        wordB = words[1]
    }
    
//: [EXPLAIN YOUR ANSWER TO Q1 HERE]
    
//The ? is unnecessary because wordA and wordB already return Optionals. Using the optional chaining operator without chaining a further member lookup will have no effect.
    
//: ## Q2: Variable Types and Function Types
//: Why does the compiler dislike the for loop? Also, what should we return?
    
    
    class func arePalindromes(words: [String]) -> Bool! {
        let reversedWords = words.map({String($0.characters.reverse())})
        let numElements = words.count
        
        for var i = 0; i < numElements; i++ {
            if words[i] != reversedWords[i] {
                return false
            }
        }
        
        return true
    }
    
//: [EXPLAIN YOUR ANSWER TO Q2 HERE]
    
    //The reason is that i was declared as a constant using let. In other words, the value of it cannot be changed once declared. Hence the '++' operator cannot be used on i.
    //Also another problem is that the value of the variable numElements is never changed after being declared and throughout the function. Therefore declaring it as a constant using let is better than using var.
    //Third problem is that the function initially needs to be called on an instance, add the keyword class makes the function able to be called on a class.
    //The loop returns true if the word passed in is a palindrome, and false otherwise.
    
//: ## Q3: More functions, and object initialization
//: The method should be returning true or false -- what's wrong?
//: Are we initializing the dictionary correctly?
    class func isAnagram(wordA: String, wordB: String) -> Bool! {
        var countLetters : [Character : Int] = [Character: Int]()
        let lenA = wordA.characters.count
        let lenB = wordB.characters.count
        
        if lenA != lenB {
            return false
        }
        var arrA = Array(wordA.characters)
        var arrB = Array(wordB.characters)
        
        for i in 0...lenA-1 {
            let letter = arrA[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val + 1
            } else {
                countLetters[letter] = 1
            }
        }
        
        for i in 0...lenB-1 {
            let letter = arrB[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val - 1
            } else {
                return false
            }
        }
        
        for (_, count) in countLetters {
            if count != 0 {
                return false
            }
        }
        
        return true
    }
}

//: [EXPLAIN YOUR ANSWER TO Q3 HERE]
    //Add "class" keyword to make it a class function, otherwise it cannot be called on a class.

//: **Do not** change anything below.
//: You should be able to call the methods as is.
Foo.isAnagram("anagram", wordB: "managra")
Foo.isAnagram("hello", wordB: "what")

var palindromes = ["hih", "racecar", "mom", "wow"]
var notPalindromes = ["gene", "shawn", "hello"]

Foo.arePalindromes(palindromes)
Foo.arePalindromes(notPalindromes)

