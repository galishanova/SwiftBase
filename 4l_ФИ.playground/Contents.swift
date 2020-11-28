import UIKit
//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

enum functionState {
    case turnedOn, turnedOff
}

class Phone {
    var microphone: functionState
    var speaker: functionState
    init(microphone: functionState, speaker: functionState) {
        self.microphone = microphone
        self.speaker = speaker
    }
    func contactWihtMom() {
    }
}

class mobilePhone: Phone {
    var isButtonManage: Bool
    var display: functionState
    init(isButtonManage: Bool, display: functionState, microphone: functionState, speaker: functionState) {
        self.isButtonManage = isButtonManage
        self.display = display
        super.init(microphone: microphone, speaker: speaker)
    }
    func playGame () {
        if isButtonManage == true, display == .turnedOn {
            print("Игра запущена")
        }
        else if display == .turnedOff {
            print("Дисплей недоступен. Невозможно запустить игру")
        }
        else {
            print("Игра не запущена. Управление кнопками невозможно")
        }
    }
    func textToFriend() {
        if isButtonManage == true {
            print("Сообщение другу отправлено")
        }
    }
}

class smartPhone: Phone {
    var internetAccess: Bool
    var camera: functionState
    init(internetAccess: Bool, camera: functionState, microphone: functionState, speaker: functionState) {
        self.internetAccess = internetAccess
        self.camera = camera
        super.init(microphone: microphone, speaker: speaker)

    }
    override func contactWihtMom () {
        if speaker == .turnedOn, microphone == .turnedOn, internetAccess == true, camera == .turnedOn {
            print("Видеозвонок абоненту 'Мама'")
        }
        else {
            print("Проверьте подключение для видеозвонка")
        }
    }
    func recordVideo() {
        if camera == .turnedOn, microphone == .turnedOn {
            print("Идет запись видео")
        } else {
            print("Ошибка в работе камеры и/или микрофона")
        }
        
    }
}
let nokia3310 = mobilePhone(isButtonManage: false, display: .turnedOn, microphone: .turnedOn, speaker: .turnedOn)
nokia3310.playGame()
nokia3310.isButtonManage = true
nokia3310.playGame()
nokia3310.textToFriend()
let iPhoneX = smartPhone(internetAccess: true, camera: .turnedOff, microphone: .turnedOff, speaker: .turnedOn)
iPhoneX.contactWihtMom()
iPhoneX.camera = .turnedOn
iPhoneX.microphone = .turnedOn
iPhoneX.contactWihtMom()
iPhoneX.recordVideo()




