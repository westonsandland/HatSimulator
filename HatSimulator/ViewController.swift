//
//  ViewController.swift
//  HatSimulator
//
//  Created by Weston Sandland on 3/14/18.
//  Copyright © 2018 Weston Sandland. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ExistingField: UITextField!
    @IBOutlet weak var CreateField: UITextField!
    var enteredExistingText : String = ""
    var enteredCreateText : String = ""
    
    @IBAction func ExistingEnd(_ sender: Any) {
        enteredExistingText = ExistingField.text!.lowercased()
        if(deckNameIsValid(deckName: enteredExistingText) && deckExists(deckName: enteredExistingText))
        {
            performSegue(withIdentifier: "ExistingSegue", sender: Any?.self)
        }
    }
    
    @IBAction func CreateEnd(_ sender: Any) {
        enteredCreateText = CreateField.text!.lowercased()
        if(deckNameIsValid(deckName: enteredCreateText) && !deckExists(deckName: enteredCreateText))
        {
            //TODO: Add deck to the database
            performSegue(withIdentifier: "CreateSegue", sender: Any?.self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ExistingSegue")
        {
            let dvc = segue.destination as! DeckViewController
            dvc.deckID = enteredExistingText
        }
        if(segue.identifier == "CreateSegue")
        {
            let cvc = segue.destination as! CreateViewController
            cvc.deckID = enteredCreateText
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func deckExists(deckName: String) -> Bool
    {
        //TODO: Check database for the deck name
        return false;
    }
    
    func deckNameIsValid(deckName: String) -> Bool
    {
        //TODO: Check validity of deck name, i.e. right characters
        return true;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

