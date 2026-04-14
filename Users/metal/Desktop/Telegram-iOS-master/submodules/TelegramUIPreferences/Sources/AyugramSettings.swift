import Foundation
import Postbox
import TelegramCore
import SwiftSignalKit

public func updateAyugramSettingsInteractively(accountManager: AccountManager<TelegramAccountManagerTypes>, _ f: @escaping (AyugramSettings) -> AyugramSettings) -> Signal<Void, NoError> {
    return accountManager.transaction { transaction -> Void in
        transaction.updateSharedData(ApplicationSpecificSharedDataKeys.ayugramSettings, { entry in
            let currentSettings: AyugramSettings
            if let entry = entry?.get(AyugramSettings.self) {
                currentSettings = entry
            } else {
                currentSettings = AyugramSettings.defaultSettings
            }
            return SharedPreferencesEntry(f(currentSettings))
        })
    }
}
