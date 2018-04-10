//
//  DatabaseController.swift
//  HatSimulator
//
//  Created by Weston Sandland on 3/31/18.
//  Copyright © 2018 Weston Sandland. All rights reserved.
//

import Foundation
import AWSDynamoDB

@objcMembers class DatabaseController
{
    func createCard(deckCards: Set<String>, deckID: String, deckName: String)
    {
        let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
        
        let deckItem: Decks? = Decks()
        deckItem?._id = deckID
        deckItem?._name = deckName
        deckItem?._cards = deckCards
        
        dynamoDbObjectMapper.save(deckItem!).continueWith { (task:AWSTask<AnyObject>!) -> Any? in
            if let error = task.error as NSError? {
                print("The request failed. Error: \(error)")
                return nil
            } else {
                return task.result
                // Do something with task.result or perform other operations.
            }
        }
    }
    
    func readCard(deckID: String)
    {
        let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
        
        let deckItem: Decks? = Decks()
        deckItem?._id = deckID
        
        dynamoDbObjectMapper.load(
            Decks.self,
            hashKey: deckItem!._id,
            rangeKey: Any?.self,
            completionHandler: {
                (objectModel: AWSDynamoDBObjectModel?, error: Error?) -> Void in
                if let error = error {
                    print("Amazon DynamoDB Read Error: \(error)")
                    return
                }
                print("the name is "+deckItem?._name)
                print("An item was read.")
        })
    }
    
    func deleteCard(deckID: String)
    {
        let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
        
        let deckItem: Decks! = Decks()
        deckItem._id = deckID
        
        dynamoDbObjectMapper.remove(deckItem!, completionHandler: {(error: Error?) -> Void in
            if let error = error {
                print(" Amazon DynamoDB Save Error: \(error)")
                return
            }
            print("An item was deleted.")
        })
    }
    
//    func updateCard(deckCards: Set<String>, deckID: String, deckName: String)
//    {
//        let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
//
//        let deckItem: Decks? = Decks()
//        deckItem?._id = deckID
//        deckItem?._name = deckName
//        deckItem?._cards = deckCards
//
//        dynamoDbObjectMapper.save(deckItem!).continueWith { (task:AWSTask<AnyObject>!) -> Any? in
//            if let error = task.error as NSError? {
//                print("The request failed. Error: \(error)")
//                return nil
//            } else {
//                return task.result
//                // Do something with task.result or perform other operations.
//            }
//        }
//    }
}
