//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

class Pion {
    var color: String
    var length: Double
    init(color: String, length: Double) {
        self.color = color
        self.length = length
    }
}
extension Pion: CustomStringConvertible {
    var description: String {
    return "Pion \(color) \(length)"
    }
}
class Rose {
    var color: String
    var length: Double
    init(color: String, length: Double) {
        self.color = color
        self.length = length
    }
}
extension Rose: CustomStringConvertible {
    var description: String {
    return "Rose \(color) \(length)"
    }
}
struct Queue<T> {
    var elements: [T] = []
    mutating func push(_ element: T) {
        return elements.append(element)
    }
    mutating func pop() -> T? {
        guard elements.count > 0 else { return nil }
        print("Flower \(elements[0]) is deleted")
        return elements.removeFirst()
    }
}
var queueOfPeonies = Queue<Pion>()
queueOfPeonies.push(Pion(color: "pink", length: 50))
queueOfPeonies.push(Pion(color: "white", length: 66))
queueOfPeonies.push(Pion(color: "yellow", length: 57))
queueOfPeonies.push(Pion(color: "violet", length: 63))
queueOfPeonies.pop()
print(queueOfPeonies)

queueOfPeonies.elements.sort {$0.length < $1.length}
print(queueOfPeonies)
queueOfPeonies.elements.sort {$0.color < $1.color}
print(queueOfPeonies)
var longPeonies = queueOfPeonies.elements.filter { $0.length > 60 }
print(longPeonies)
queueOfPeonies.elements.forEach {
    print("In the queue of Peonies there is a color: " + $0.color)
}

var queueOfRoses = Queue<Rose>()
queueOfRoses.push(Rose(color: "white", length: 70))
queueOfRoses.push(Rose(color: "red", length: 83))
queueOfRoses.push(Rose(color: "pink", length: 91))
queueOfRoses.push(Rose(color: "multicolor", length: 99))
queueOfRoses.push(Rose(color: "lightblue", length: 103))
queueOfRoses.push(Rose(color: "red", length: 118))
queueOfRoses.push(Rose(color: "pink", length: 105))
queueOfRoses.pop()

queueOfRoses.elements.sort {$0.length > $1.length}
print(queueOfRoses)
queueOfRoses.elements.sort {$0.color > $1.color}
print(queueOfRoses)
var pinkRoses = queueOfRoses.elements.filter { $0.color == "pink" }
print(pinkRoses)
queueOfRoses.elements.forEach {
    print("In the queue of Roses there is a color: " + $0.color)
}

