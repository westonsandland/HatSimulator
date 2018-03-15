//
//  DeckViewController.swift
//  HatSimulator
//
//  Created by Weston Sandland on 3/14/18.
//  Copyright © 2018 Weston Sandland. All rights reserved.
//

import UIKit
import GameplayKit

class DeckViewController: UIViewController {

    let stateURL = URL(fileURLWithPath: "/tmp/state.plist")
    let cardsURL = URL(fileURLWithPath: "/tmp/cards.plist")
    var ID : String! = "default"
    var position : Int = 0
    var cards : [String] = ["Card Text"]
    
    @IBOutlet weak var CardLabel: UILabel!
    
    @IBAction func NextCardRequest(_ sender: Any) {
        position = (position + 1) % cards.count
        setCardText()
        writeDeckToFile()
    }
    
    @IBAction func PreviousCardRequest(_ sender: Any) {
        position = (position - 1) % cards.count
        setCardText()
        writeDeckToFile()
    }
    
    @IBAction func ShuffleRequest(_ sender: Any) {
        shuffleCards()
        setCardText()
        writeDeckToFile()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        retrieveDeck()
    }

    func retrieveDeck()
    {
        let savedState = NSArray(contentsOf: stateURL) as! [String]
        let savedID = savedState[0]
        let savedPosition = savedState[1]
        let savedCards = NSArray(contentsOf: cardsURL) as! [String]
        if(savedID == "default")
        {
            //TODO: retrieve the deck from the database using the deckID
            shuffleCards()
            writeDeckToFile()
        }else
        {
            ID = savedID
            position = Int(savedPosition)!
            cards = savedCards
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setCardText()
    {
        CardLabel.text = cards[position]
    }
    
    func shuffleCards()
    {
        cards = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: cards) as! [String]
        position = 0
    }
    
    func writeDeckToFile()
    {
        let stateArray = [ID, String(position)]
        (stateArray as NSArray).write(to: stateURL, atomically: true)
        (cards as NSArray).write(to: cardsURL, atomically: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
