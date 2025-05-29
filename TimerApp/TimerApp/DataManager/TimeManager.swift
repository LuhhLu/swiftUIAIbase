 

import Foundation

class TimeManager {
    
    static var shared  = TimeManager()
    
    private let remainingTimeKey = "remainingTime"
    
    func saveData<T>(with key: String, data: T){
        UserDefaults.standard.set(data, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    var savedDate: Date?  {
        get {
            return UserDefaults.standard.object(forKey: "savedDate") as? Date
        }
        set {
            saveData(with: "savedDate", data: newValue)
        }
    }
    
    var remainingTime: TimeInterval {
        get {
            return UserDefaults.standard.double(forKey: remainingTimeKey)
        }
        set {
            saveData(with: remainingTimeKey, data: newValue)
        }
    }
    
    var duration: TimeInterval {
        get {
            return UserDefaults.standard.double(forKey: "duration")
        }
        set {
            saveData(with: "duration", data: newValue)
        }
    }
    
    func getRemainingTime() -> TimeInterval{
        if let savedDate = savedDate {
            let currentDate = Date()
            let differenceInSeconds = currentDate.timeIntervalSince(savedDate)
            remainingTime = remainingTime - differenceInSeconds
            return remainingTime
        } else {
            return 0
        }
    }
    
    func clearUserData() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
    
}
