import Foundation
import Postbox

public struct AyugramSettings: Codable, Equatable {
    public var saveDeletedMessages: Bool
    public var ghostMode: Bool
    public var localPremium: Bool
    public var storyStealthMode: Bool
    public var disableTyping: Bool

    public static var defaultSettings: AyugramSettings {
        return AyugramSettings(
            saveDeletedMessages: true,
            ghostMode: false,
            localPremium: true,
            storyStealthMode: false,
            disableTyping: false
        )
    }

    public init(
        saveDeletedMessages: Bool,
        ghostMode: Bool,
        localPremium: Bool,
        storyStealthMode: Bool,
        disableTyping: Bool
    ) {
        self.saveDeletedMessages = saveDeletedMessages
        self.ghostMode = ghostMode
        self.localPremium = localPremium
        self.storyStealthMode = storyStealthMode
        self.disableTyping = disableTyping
    }
}

public struct AyugramSettingsKeys {
    public static let ayugramSettings: ValueBoxKey = {
        let key = ValueBoxKey(length: 4)
        key.setInt32(0, value: 23 + 1000)
        return key
    }()
}
