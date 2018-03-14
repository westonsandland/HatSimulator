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
    @IBAction func ExistingEnd(_ sender: Any) {
        let enteredExistingText : String
        enteredExistingText = ExistingField.text!.lowercased()
        if(deckExists(deckName: enteredExistingText))
        {
            
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

