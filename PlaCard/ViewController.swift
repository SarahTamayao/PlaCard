//
//  ViewController.swift
//  PlaCard
//
//  Created by Karene.A.N on 3/4/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var frontLabel: UILabel!
    
    @IBOutlet weak var Card: UIView!
   
    @IBOutlet weak var btnOptionOne: UIButton!
    
    @IBOutlet weak var btnOptionTwo: UIButton!
    
    @IBOutlet weak var btnOptionThree: UIButton!
    
    
    override func viewDidLoad()
    {
        Card.layer.shadowRadius = 15.0
        Card.layer.shadowOpacity = 0.2
        Card.layer.cornerRadius = 20.0
        
        frontLabel.layer.cornerRadius = 20.0
        backLabel.layer.cornerRadius = 20.0
        
        frontLabel.layer.shadowRadius = 15.0
        frontLabel.layer.shadowOpacity = 0.2
        
        backLabel.layer.shadowRadius = 15.0
        backLabel.layer.shadowOpacity = 0.2
        
        btnOptionOne.layer.cornerRadius = 20.0
        btnOptionTwo.layer.cornerRadius = 20.0
        btnOptionThree.layer.cornerRadius = 20.0
        
        btnOptionOne.layer.borderWidth = 3.0
        btnOptionTwo.layer.borderWidth = 3.0
        btnOptionThree.layer.borderWidth = 3.0
        
        btnOptionOne.layer.borderColor = UIColor.magenta.cgColor
        btnOptionTwo.layer.borderColor = UIColor.magenta.cgColor
        btnOptionThree.layer.borderColor = UIColor.magenta.cgColor
    
        
        frontLabel.clipsToBounds = true
        backLabel.clipsToBounds = true

        super.viewDidLoad()
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        let  navigationController = segue.destination as! UINavigationController
        
        let secondController = navigationController.topViewController as! SecondViewController
       
        secondController.viewController = self
    if(segue.identifier == "EditSegue")
    {
        secondController.initialQuestion = frontLabel.text
        secondController.initialAnswer = backLabel.text
    }
    }
    
    @IBAction func didTapOnPlaCard(_ sender: Any)
    {
        
        if(frontLabel.isHidden == true){
            frontLabel.isHidden = false
        }
        else
        {
            frontLabel.isHidden = true
        }
        
        btnOptionOne.isHidden = false
        btnOptionThree.isHidden = false
        
    }
    
    
    @IBAction func didTapOptionOne(_ sender: Any)
    {
         btnOptionOne.isHidden = true
    }
    
    @IBAction func didTapOptionTwo(_ sender: Any)
    {
        
        
        if(frontLabel.isHidden == true && backLabel.isHidden==true)
        {
            backLabel.isHidden = false
        }
        else if(frontLabel.isHidden == false && backLabel.isHidden == false)
       {
            frontLabel.isHidden = true
        }
        else if(frontLabel.isHidden == false && backLabel.isHidden == true)
        {
            frontLabel.isHidden = true
            backLabel.isHidden = false
        }
        else if(frontLabel.isHidden == true && backLabel.isHidden == false)
        {
            
        }
    
    }

    
    @IBAction func didTapOptionThree
    (_ sender: Any)
    {
        btnOptionThree.isHidden = true
    }
    
    
    func updateFlashCard(question: String , answer:String , extraAnswerOne: String?, extraAnswerTwo:String?)
    {
        frontLabel.text = question
        backLabel.text = answer
        btnOptionOne.setTitle(extraAnswerOne, for: .normal)
        btnOptionTwo.setTitle(answer, for: .normal)
        btnOptionThree.setTitle(extraAnswerTwo, for: .normal)
    }
    
    
}

