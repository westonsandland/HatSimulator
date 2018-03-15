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
    @IBOutlet weak var ExistingErrorText: UILabel!
    @IBOutlet weak var CreateErrorText: UILabel!
    
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
            dvc.ID = enteredExistingText
        }
        if(segue.identifier == "CreateSegue")
        {
            let cvc = segue.destination as! CreateViewController
            cvc.ID = enteredCreateText
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        removeErrorTexts()
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
    
    func doesNotExistError()
    {
        ExistingErrorText.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    }
    
    func alreadyCreatedError()
    {
        CreateErrorText.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    }
    
    func removeErrorTexts()
    {
        ExistingErrorText.textColor = UIColor(white: 0.0, alpha: 0.0)
        CreateErrorText.textColor = UIColor(white: 0.0, alpha: 0.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

