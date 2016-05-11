//: Playground - noun: a place where people can play

import UIKit

class Person: Equatable {
    let firstName: String
    let lastName: String
    let age: Int
    
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}

func ==(lhs: Person, rhs: Person) -> Bool {
    return(lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName && lhs.age == rhs.age)
}

let james = Person(firstName: "James", lastName: "Pacheco", age: 26)
let andrea = Person(firstName: "Andrea", lastName: "Mower", age: 24)
let carol = Person(firstName: "Rebecca", lastName: "Mordo", age: 30)
var clubMembers: [Person] = [james, andrea, carol]

let ashley = Person(firstName: "Ashley", lastName: "Hunter", age: 28)
let kelly = Person(firstName: "Kelly", lastName: "Greenwell", age: 28)

clubMembers.append(ashley)

func areYouAMemberOfTheClub(person: Person) -> Bool {
    var isMember = false
    for clubMember in clubMembers {
        if person == clubMember {
            isMember = true
        }
    return isMember
}

areYouAMemberOfTheClub(kelly)









