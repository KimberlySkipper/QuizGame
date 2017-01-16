//
//  ProperNerdAPI.swift
//  QuizGame
//
//  Created by Kimberly Skipper on 1/12/17.
//  Copyright © 2017 The Iron Yard. All rights reserved.
//

import Foundation

protocol ProperNerdAPIManagerProtocol
{
    func didReceiveStarWarsQA(StarWarsQAInfo:[GameRound])
}

class ProperNerdAPIManager
{
    
    var delegate: ProperNerdAPIManagerProtocol
    

    init(delegate: ProperNerdAPIManagerProtocol)
    {
        self.delegate = delegate
    }

    
    func searchProperNerdForFiveStarWarsQA()
    {
        let urlPath = "http://tiy-orl-proxy.herokuapp.com/trivia?category=Star%20Wars&limit=5&random=1"
        let url = URL(string: urlPath)
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: {data, response, error -> Void in
            print("Task completed")
            if error != nil
            {
                // will print error based on language most commomly spoken in that area.
                print(error!.localizedDescription)
            }
            if let array = self.parseJSON(data!)
            {
                let game = Game()
                for anEntry in array
                {
                    let question = anEntry["question"] as? String
                    let answer = anEntry["answer"] as? String
                    
                    let turn = GameRound(question: question!, correctAnswer: answer!)
                    game.gameRounds.append(turn)
                }
                
//                self.delegate.didReceiveStarWarsQA(StarWarsQAInfo: arrayOfQAs)
            }
        })
        task.resume()
    }
    
    func parseJSON(_ data: Data) -> [[String: Any]]?
    {
        do
        {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            if let dictionary = json as? [[String: Any]]
            {
                return dictionary
            }
            else
            {
                return nil
            }
        }
        catch let error as NSError
        {
            print(error)
            return nil
        }
    }

}// end class


    














