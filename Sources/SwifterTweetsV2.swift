//
//  SwifterTweetsV2.swift
//  Swifter
//
//  Created by Justin Tomich on 9/30/20.
//  Copyright © 2020 Matt Donnelly. All rights reserved.
//

import Foundation


public extension Swifter {

//    public enum Expansions {
//        case attachments.poll_ids,
//        case attachments.media_keys,
//        case author_id,
//        case entities.mentions.username,
//        case geo.place_id,
//        case in_reply_to_user_id,
//        case referenced_tweets.id
//        case referenced_tweets.id.author_id
//    }
    
    // Convenience method to help us get a timeline
    // per path and its parameters
    private func getTweet(at path: String,
                          parameters: [String: Any],
                          tweetMode: TweetMode = .default,
                          success: SuccessHandler? = nil,
                          failure: FailureHandler? = nil) {
        let path = "tweets"

        var params = parameters
        params["count"] ??= count
        
        self.getJSON(path: path, baseURL: .api, parameters: params, success: { json, _ in
            success?(json)
        }, failure: failure)
    }
}
