//1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

import Foundation
enum PrintDocumentError: Error {
    case sheetsOutOfStock(sheetsNeeded: Double)
    case tonerOutOfStock(tonerNeeded: Double)
    case invalidSelection
}
struct File {
    var sheetsNumber: Double
    var tonerSpendingOnOnePage: Double = 0.2
    var tonerSpending: Double
    let document: Document
    init(sheetsNumber: Double, tonerSpendingOnOnePage: Double = 0.2, document: Document) {
        self.sheetsNumber = sheetsNumber
        self.tonerSpending = tonerSpendingOnOnePage * sheetsNumber
        self.document = document
    }
}
struct Document {
    let name: String
}
class Printer {
    var printQueue = [
        "Year Report": File(sheetsNumber: 56, document: Document(name: "Year Report")),
        "Company revenues": File(sheetsNumber: 54, document: Document(name: "Company revenues")),
        "Month Results": File(sheetsNumber: 9, document: Document(name: "Month Results"))
        ]
    
    var tonerStock = 0.0
    var sheetsStock = 0.0
    
    func printDocument(DocumentName name: String) throws -> Document {
        guard let file = printQueue[name] else {
            throw PrintDocumentError.invalidSelection
        }
        guard file.sheetsNumber <= sheetsStock else {
            throw PrintDocumentError.sheetsOutOfStock(sheetsNeeded: file.sheetsNumber - sheetsStock)
        }
        guard file.tonerSpending <= tonerStock else {
            throw PrintDocumentError.tonerOutOfStock(tonerNeeded: file.tonerSpending - tonerStock)
        }
        sheetsStock -= file.sheetsNumber
        tonerStock -= file.tonerSpending
        let newFile = file
        printQueue[name] = newFile
        return newFile.document
    }
        
}
let printer = Printer()
printer.tonerStock += 15.0
printer.sheetsStock += 59.0

do {
    let doc1 = try printer.printDocument(DocumentName: "Year Report")
    print("Распечатали \(doc1)")
} catch PrintDocumentError.invalidSelection {
    print("Такого документа не существует")
} catch PrintDocumentError.sheetsOutOfStock(let sheetsNeeded) {
    print("Недостаточно листов бумаги. Необходимо добавить \(sheetsNeeded) листов")
} catch PrintDocumentError.tonerOutOfStock(let tonerNeeded) {
    print("Недостаточно тонера. Необходимо добавить \(tonerNeeded) гр. тонера")
} catch let error {
    print(error.localizedDescription)
}
do {
    let doc2 = try printer.printDocument(DocumentName: "Memes")
    print("Распечатали \(doc2)")
} catch PrintDocumentError.invalidSelection {
    print("Такого документа не существует")
} catch PrintDocumentError.sheetsOutOfStock(let sheetsNeeded) {
    print("Недостаточно листов бумаги. Необходимо добавить \(sheetsNeeded) листов")
} catch PrintDocumentError.tonerOutOfStock(let tonerNeeded) {
    print("Недостаточно тонера. Необходимо добавить \(tonerNeeded) гр. тонера")
} catch let error {
    print(error.localizedDescription)
}
do {
    let doc3 = try printer.printDocument(DocumentName: "Month Results")
    print("Распечатали \(doc3)")
} catch PrintDocumentError.invalidSelection {
    print("Такого документа не существует")
} catch PrintDocumentError.sheetsOutOfStock(let sheetsNeeded) {
    print("Недостаточно листов бумаги. Необходимо добавить \(sheetsNeeded) листов")
} catch PrintDocumentError.tonerOutOfStock(let tonerNeeded) {
    print("Недостаточно тонера. Необходимо добавить \(tonerNeeded) гр. тонера")
} catch let error {
    print(error.localizedDescription)
}

