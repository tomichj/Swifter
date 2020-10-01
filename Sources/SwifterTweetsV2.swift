//
//  SwifterTweetsV2.swift
//  Swifter
//
//  Created by Justin Tomich on 9/30/20.
//  Copyright © 2020 Matt Donnelly. All rights reserved.
//

import Foundation


public extension Swifter {

    enum Expansion: String {
        case attachmentsPollIds = "attachments.poll_ids"
        case attachmentsMediaKeys = "attachments.media_keys"
        case authorId = "author_id"
        case entitiesMentionsUsername = "entities.mentions.username"
        case geoPlaceId = "geo.place_id"
        case inReplyToUserId = "in_reply_to_user_id"
        case referencedTweetsId = "referenced_tweets.id"
        case referencedTweetsIdAuthorId = "referenced_tweets.id.author_id"
    }
    
    enum MediaField: String {
        case durationMS = "duration_ms"
        case height = "height"
        case mediaKey = "media_key"
        case previewImageUrl = "preview_image_url"
        case type = "type"
        case url = "url"
        case width = "width"
        case publicMetrics = "public_metrics"
        case nonPublicMetrics = "non_public_metrics"
        case organicMetrics = "organic_metrics"
        case promotedMetrics = "promoted_metrics"
    }
    
    enum PlaceField: String {
        case containedWithin = "contained_within"
        case country = "country"
        case countryCode = "country_code"
        case fullName = "full_name"
        case geo = "geo"
        case id = "id"
        case name = "name"
        case placeType = "place_type"
    }
    
    enum PollField: String {
        case durationMinutes = "duration_minutes"
        case endDatetime = "end_datetime"
        case id = "id"
        case options = "options"
        case votingStatus = "voting_status"
    }
    
    enum TweetField: String {
        case attachments = "attachments"
        case authorId = "author_id"
        case contextAnnotations = "context_annotations"
        case conversationId = "conversation_id"
        case createdAt = "created_at"
        case entities = "entities"
        case geo = "geo"
        case id = "id"
        case inReplyToUserId = "in_reply_to_user_id"
        case lang = "lang"
        case nonPublicMetrics = "non_public_metrics"
        case publicMetrics = "public_metrics"
        case organicMetrics = "organic_metrics"
        case promotedMetrics = "promoted_metrics"
        case possiblySensitive = "possibly_sensitive"
        case referencedTweets = "referenced_tweets"
        case source = "source"
        case text = "text"
        case withheld = "withheld"
    }
    
    enum UserField: String {
        case created_at = "created_at"
        case description = "description"
        case entities = "entities"
        case id = "id"
        case location = "location"
        case name = "name"
        case pinnedTweetId = "pinned_tweet_id"
        case profileImageUrl = "profile_image_url"
        case protected = "protected"
        case publicMetrics = "public_metrics"
        case url = "url"
        case username = "username"
        case verified = "verified"
        case withheld = "withheld"
    }
    
    func lookupTweet(for id: String,
                     expansions: [Expansion]? = nil,
                     mediaFields: [MediaField]? = nil,
                     placeFields: [PlaceField]? = nil,
                     pollFields: [PollField]? = nil,
                     tweetFields: [TweetField]? = nil,
                     userFields: [UserField]? = nil,
                     success: SuccessHandler? = nil,
                     failure: FailureHandler? = nil) {
        let path = "tweets/\(id).json"
        var params = [String: Any]()
        
//        if expansions != nil {
//            params["expansions"] = expansions!.map { $0.rawValue }.joined(separator: ",")
//        }
        
        params["expansions"] ??= expansions?.map { $0.rawValue }.joined(separator: ",")
        params["media.fields"] ??= mediaFields?.map { $0.rawValue }.joined(separator: ",")
        params["place.fields"] ??= placeFields?.map { $0.rawValue }.joined(separator: ",")
        params["poll.fields"] ??= pollFields?.map { $0.rawValue }.joined(separator: ",")
        params["tweet.fields"] ??= tweetFields?.map { $0.rawValue }.joined(separator: ",")
        params["user.fields"] ??= userFields?.map { $0.rawValue }.joined(separator: ",")
        
        self.getJSON(path: path, baseURL: .api, parameters: params, success: { json, _ in success?(json) }, failure: failure)
    }

    func lookupTweets(for ids: [String],
                      expansions: [Expansion]? = nil,
                      mediaFields: [MediaField]? = nil,
                      placeFields: [PlaceField]? = nil,
                      pollFields: [PollField]? = nil,
                      tweetFields: [TweetField]? = nil,
                      userFields: [UserField]? = nil,
                      success: SuccessHandler? = nil,
                      failure: FailureHandler? = nil) {
        let path = "tweets.json"
        var params = [String: Any]()
        params["ids"] = ids.joined(separator: ",")
        params["expansions"] ??= expansions?.map { $0.rawValue }.joined(separator: ",")
        params["media.fields"] ??= mediaFields?.map { $0.rawValue }.joined(separator: ",")
        params["place.fields"] ??= placeFields?.map { $0.rawValue }.joined(separator: ",")
        params["poll.fields"] ??= pollFields?.map { $0.rawValue }.joined(separator: ",")
        params["tweet.fields"] ??= tweetFields?.map { $0.rawValue }.joined(separator: ",")
        params["user.fields"] ??= userFields?.map { $0.rawValue }.joined(separator: ",")
                
        self.getJSON(path: path, baseURL: .api, parameters: params, success: { json, _ in success?(json) }, failure: failure)
    }

    
}
