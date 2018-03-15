//
//  DeckViewController.swift
//  HatSimulator
//
//  Created by Weston Sandland on 3/14/18.
//  Copyright © 2018 Weston Sandland. All rights reserved.
//

import UIKit

class DeckViewController: UIViewController {

    let IDURL = NSURL(fileURLWithPath: "/tmp/ID.plist")
    let cardsURL = NSURL(fileURLWithPath: "/tmp/cards.plist")
    var ID : String! = "default"
    var cards : [String] = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        retrieveDeck()
        
    }

    func retrieveDeck()
    {
        let savedID = (NSArray(contentsOf: IDURL as URL) as! [String])[0]
        let savedCards = NSArray(contentsOf: cardsURL as URL) as! [String]
        if(savedID == "default")
        {
            //TODO: retrieve the deck from the database using the deckID
        }else
        {
            ID = savedID
            cards = savedCards
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
