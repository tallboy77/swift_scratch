//Sample that demonstrates classes and protocols in Swift using a baseball example.

//Define variables and functions that classes must conform to
public protocol Hittable {
    
    func hit()
    func out()
    func walk()
    
    //A variable of type Double with only a getter
    var battingAverage:Double { get }
    var onBasePercentage:Double { get }
    
}

//An enum lists defines discrete values. A raw value can also be provided
//for each value, in this case a String.
public enum Rating:String {
    case AllStar = "All Star"
    case BenchWarmer = "Bench Warmer"
    case MVP = "Most Valuable Player"
}

// Player class that conforms to Hittable protocol
public class Player:Hittable, CustomStringConvertible {
    //Immutable variables are defined with let.
    //They don't have to be initialized when defined.
    let name:String
    
    //An optional can hold a value or be nil
    let nickName:String?
    
    //Mutable variables are defined with var.
    var hits = 0
    var atBats = 0
    var walks = 0

    //The description property is required by the CustomStringConvertible
    //protocol, and it provides a textual representation of the object
    //when printed
    public var description:String {
        return "The rating of \(name) is \(rating)."
    }
    
    //An initializer is defined with init. The nickName parameter
    //has a default value of nil if it is not passed in to the function.
    public init(name:String, nickName:String? = nil) {
        //Self is used to distinguish between the class property and
        //the property passed into the initializer
        self.name = name
        self.nickName = nickName
    }
    
    //A computed property calculates rather than stores a value
    public var battingAverage:Double {
        return atBats > 0 ? Double(hits) / Double(atBats) : 0
    }
    
    //A computed property calculates rather than stores a value
    public var onBasePercentage:Double {
        return atBats > 0 ? (Double(hits) + Double(walks)) / Double(atBats) : 0
    }
    
    public var rating:String {
        if battingAverage >= 0.3 {
            if onBasePercentage >= 0.4 {
                return Rating.MVP.rawValue
            }
            return Rating.AllStar.rawValue
        }
        return Rating.BenchWarmer.rawValue
    }
    
    public func hit() {
        hits++
        atBats++
    }
    
    public func out() {
        atBats++
    }
    
    public func walk() {
        walks++
    }
}

//Instantiate a player named Swifty
let p = Player(name:"Swifty", nickName:"Swiftee")

print(p.nickName!)
print(p)
//Call the out function on the player
p.out()
print(p.rating)
p.out()
p.hit()
//The player's rating has improved!
print(p.rating)
p.walk()
print(p.rating)
