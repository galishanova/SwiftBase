import UIKit
// 1. Решить квадратное уравнение
// ax2 + bx + c = 0
// D = b2 - 4ac
// x1,2 = -b +- №D / 2a
let a:Float = 9
let b:Float = 9
let c:Float = 2
let disInSquare = (b * b - 4.0 * a * c) //дискриминант
let dis = disInSquare.squareRoot() //корень из дискриминанта

if disInSquare == 0 {
    let x1 = (b * (-1.0) + dis) / (2.0 * a)
    print("Уравненеие имеет 1 корень: \(x1).")
} else if disInSquare < 0 {
    print("Уравнение не имеет корней")
} else {
    let x1 = (b * (-1.0) + dis) / (2.0 * a)
    let x2 = (b * (-1.0) - dis) / (2.0 * a)
    print("Уравненеие имеет 2 корня: \(x1) и \(x2)")
}

//2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

let leg1:Double = 6
let leg2:Double = 8

let square = (leg1 * leg2) / 2.0
let hypotenuse = (leg1 * leg1 + leg2 * leg2).squareRoot()
let perimeter = hypotenuse + leg2 + leg1

//3* Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

let sumDepozit = 600
let percent = 0.06
let year = 5

let percentInOneYear = percent * Double(sumDepozit)
print("Ваш доход от вложения суммы \(sumDepozit), составит \(percentInOneYear) в год")
let depozitInYears = percentInOneYear * Double(year)
print("Ваша сумма вклада через \(year) лет составит: \(depozitInYears)")
