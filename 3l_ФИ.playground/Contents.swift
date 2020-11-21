import UIKit
//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько ЭКЗЕМПЛЯРОВ структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

//Phone memory 64 gb
enum screenSwitch {
    case block, unlock
}
enum mediaState {
    case play, pause, stop
}
enum PhoneActions {
    case downloadGame(Size: Int)
    case playGame(mediaState)
    case changeSoundVolume(Percent: Int)
    case setSceenState(screenSwitch)
    case changeDisplayBrightness(Percent: Int)
}
struct Phone {
    let maxMemory: Int = 64
    var filledMemory: Int = 44
    var screenState: screenSwitch
    var soundVolume: Int
    var displayBrightness: Int
    var gameState: mediaState = .stop
    var isGameDownloaded: Bool = false
    
    mutating func makeAction(action: PhoneActions) {
        switch action {
        
        case .downloadGame(let size):
            if filledMemory + size > maxMemory {
                print("Невозможно загрузить файл. Cкачайте файл меньшим размером")
                self.isGameDownloaded == false // игра не загрузилась
            } else {
                self.filledMemory += size
                self.isGameDownloaded = true //игра загрузилась
        }
        
        case .changeSoundVolume(Percent: let Percent):
            if Percent > 100 {
                print("Громкость звука максимальная")
                self.soundVolume = 100
            } else {
                self.soundVolume = Percent
            }
        
        case .changeDisplayBrightness(Percent: let Percent):
            if Percent > 100 {
                print("Яркость дисплея максимальная")
                self.displayBrightness = 100
            } else {
            self.displayBrightness = Percent
            }
            
        case .setSceenState(let state):
            self.screenState = state
            
        case .playGame(let state):
            if isGameDownloaded == true {
                self.gameState = state
                self.screenState = .unlock //при управлении игрой автоматически разблокируется экран
            } else {
                print("Управление невозможно. Игра не загружена")
            }
        }
        
        showPhoneState()
    }
    func showPhoneState() {
        print("При памяти телефона \(self.maxMemory) Гб, заполнено \(self.filledMemory) Гб, загрузка игры \(self.isGameDownloaded), дисплей сейчас \(self.screenState), громкость звука составялет \(self.soundVolume)%, а яркость экрана \(self.displayBrightness)%, игра на данный момент \(self.gameState)")
    }
}

var phone = Phone(screenState: .block, soundVolume: 10, displayBrightness: 20)
phone.showPhoneState()
phone.makeAction(action: .playGame(.play))
phone.makeAction(action: .downloadGame(Size: 21))
phone.makeAction(action: .downloadGame(Size: 12))
phone.makeAction(action: .playGame(.play))
phone.makeAction(action: .changeDisplayBrightness(Percent: 120))
phone.makeAction(action: .changeSoundVolume(Percent: 100))
phone.makeAction(action: .setSceenState(.block))


