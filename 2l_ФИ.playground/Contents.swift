import Foundation
//1.Написать функцию, которая определяет, четное число или нет.
func evenNumber(array: [Int]) {
    for element in array where element % 2 == 0 {
        print("\(element) четное")
    }
}
evenNumber(array: [12, 15, 85, 24, 96, 3, 53, 44])


//2.Написать функцию, которая определяет, делится ли число без остатка на 3.
func divideIntoThreeNumbers(array: [Int]) {
    for element in array where element % 3 == 0 {
        print("\(element) делится на 3 без остатка")
    }
}
divideIntoThreeNumbers(array: [9, 23, 47, 11, 82, 77, 15, 34])

//3.Создать возрастающий массив из 100 чисел.
var numbers100 = [Int]()
for i in 1...100 {
    numbers100.append(i)
}
print("Сто чисел: \(numbers100)")


//4.Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
var delete = numbers100.filter { $0 % 2 != 0 && $0 % 3 == 0 }
print("Нечетные чила, делящиеся на 3: \(delete)")


