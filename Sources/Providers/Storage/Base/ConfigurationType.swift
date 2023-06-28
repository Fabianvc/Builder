import Foundation

public enum ConfigurationType {
    case basic(dbFile: URL?)
    case inMemory(identifier: String = "")
}
