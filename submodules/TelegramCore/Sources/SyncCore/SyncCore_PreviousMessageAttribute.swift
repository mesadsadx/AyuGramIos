import Foundation
import Postbox

public class PreviousMessageAttribute: MessageAttribute {
    public let text: String
    public let media: [Media]
    
    public var associatedPeerIds: [PeerId] {
        return []
    }
    public var associatedMessageIds: [MessageId] {
        return []
    }
    public var associatedMediaIds: [MediaId] {
        return []
    }
    public var automaticTimestampBasedAttribute: (UInt16, Int32)? {
        return nil
    }
    public var associatedStoryIds: [StoryId] {
        return []
    }

    public init(text: String, media: [Media]) {
        self.text = text
        self.media = media
    }
    
    required public init(decoder: PostboxDecoder) {
        self.text = decoder.decodeStringForKey("t", orElse: "")
        self.media = decoder.decodeObjectArrayForKey("m")
    }
    
    public func encode(_ encoder: PostboxEncoder) {
        encoder.encodeString(self.text, forKey: "t")
        encoder.encodeObjectArray(self.media, forKey: "m")
    }
}
