enum FunctionState {
    case turnedOn, turnedOff
}
protocol Phone {
    var microphone: FunctionState { get set }
    var speaker: FunctionState { get set }
    var isNumberDialed: Bool { get set }
    var isAcceptButtonPreseed: Bool { get set }
    var isCancelButtonPressed: Bool { get set }
    func сall()
}
enum CallActions {
    case acceptCall
    case cancelCall
}
extension Phone {
    func acceptCall() {
        if isAcceptButtonPreseed == true {
            print("Вызов абонента принят")
        } else {
            print("Для ответа необходимо нажать конпку принятия вызова")
        }
    }
    func cancelCall() {
        if isCancelButtonPressed == true {
            print("Вызов абенента отменен")
        } else {
            print("Чтобы отклонить вызов нажмите кнопку отмены вызова")
        }
    }
}
class MobilePhone: Phone {
    var microphone: FunctionState
    var speaker: FunctionState
    var isNumberDialed: Bool
    var isAcceptButtonPreseed: Bool
    var isCancelButtonPressed: Bool
    var display: FunctionState
    func сall() {
        if microphone == .turnedOn, speaker == .turnedOn, isNumberDialed == true {
            print("Выполняется вызов абонента")
        } else if isNumberDialed == false {
            print("Для выполнения вызова необходимо набрать номер абонента")
        } else {
            print("Вызов невозможен. Проверьте работу функций микрофона и динамика")
        }
    }
    init(microphone: FunctionState, speaker: FunctionState, isNumberDialed: Bool, isAcceptButtonPreseed: Bool, isCancelButtonPressed: Bool, display: FunctionState) {
        self.microphone = microphone
        self.speaker = speaker
        self.isNumberDialed = isNumberDialed
        self.isAcceptButtonPreseed = isAcceptButtonPreseed
        self.isCancelButtonPressed = isCancelButtonPressed
        self.display = display
    }
}
extension MobilePhone: CustomStringConvertible {
    var description: String {
        return "Состояние устройства - микрофон: \(microphone), динамик: \(speaker), набор номера: \(isNumberDialed), нажатие конпки принятия вызова: \(isAcceptButtonPreseed), нажатие кнопки отмены вызова: \(isCancelButtonPressed), дисплей: \(display)"
    }
}
class SmartPhone: Phone {
    var microphone: FunctionState
    var speaker: FunctionState
    var isNumberDialed: Bool
    var isAcceptButtonPreseed: Bool
    var isCancelButtonPressed: Bool
    var display: FunctionState
    var internetAccess: FunctionState
    var camera: FunctionState
    func сall() {
        if microphone == .turnedOn, speaker == .turnedOn, isNumberDialed == true, camera == .turnedOn, internetAccess == .turnedOn {
            print("Выполняется видеозвонок абоненту")
        } else if isNumberDialed == false {
            print("Для выполнения вызова необходимо набрать номер абонента")
        } else {
            print("Вызов невозможен. Проверьте работу функций для звонка: микрофона, динамика, камеры и доступа в интернет")
        }
    }
    init(microphone: FunctionState, speaker: FunctionState, isNumberDialed: Bool, isAcceptButtonPreseed: Bool, isCancelButtonPressed: Bool, display: FunctionState, camera: FunctionState, internetAccess: FunctionState) {
        self.microphone = microphone
        self.speaker = speaker
        self.isNumberDialed = isNumberDialed
        self.isAcceptButtonPreseed = isAcceptButtonPreseed
        self.isCancelButtonPressed = isCancelButtonPressed
        self.display = display
        self.camera = camera
        self.internetAccess = internetAccess
    }
}
extension SmartPhone: CustomStringConvertible {
    var description: String {
        return "Состояние устройства - микрофон: \(microphone), динамик: \(speaker), набор номера: \(isNumberDialed), нажатие кнопки принятия вызова: \(isAcceptButtonPreseed), нажатие кнопки отмены вызова: \(isCancelButtonPressed), дисплей: \(display), камера: \(camera), доступ в интернет: \(internetAccess)"
    }
}
let nokia3310 = MobilePhone(microphone: .turnedOn, speaker: .turnedOn, isNumberDialed: false, isAcceptButtonPreseed: false, isCancelButtonPressed: false, display: .turnedOn)
let iPhoneX = SmartPhone(microphone: .turnedOn, speaker: .turnedOn, isNumberDialed: false, isAcceptButtonPreseed: false, isCancelButtonPressed: false, display: .turnedOn, camera: .turnedOn, internetAccess: .turnedOn)
nokia3310.isNumberDialed = true
nokia3310.сall()
nokia3310.isAcceptButtonPreseed = true
nokia3310.acceptCall()
print(nokia3310)

iPhoneX.isNumberDialed = true
iPhoneX.сall()
iPhoneX.isAcceptButtonPreseed = true
iPhoneX.acceptCall()
iPhoneX.cancelCall()
iPhoneX.isCancelButtonPressed = true
iPhoneX.cancelCall()
print(iPhoneX)
