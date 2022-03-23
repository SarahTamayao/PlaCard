//
//  ViewController.swift
//  PlaCard
//
//  Created by Karene.A.N on 3/4/22.
//

import UIKit

struct Flashcard
{
    var question: String
    var answer: String
}

class ViewController: UIViewController {

    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var frontLabel: UILabel!
    
    @IBOutlet weak var Card: UIView!
   
    @IBOutlet weak var btnOptionOne: UIButton!
    
    @IBOutlet weak var btnOptionTwo: UIButton!
    
    @IBOutlet weak var btnOptionThree: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var prevButton: UIButton!
    
    var flashcards = [Flashcard]()
    var currentIndex = 0
        
    
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
        
        // read saved flashcards
        readSavedFlashcards()
       //Adding our initial flashcard if needed
        if (flashcards.count == 0) {
        updateFlashCard(question: "What is the Capital of Texas", answer: "Austin", extraAnswerOne:" Houston" , extraAnswerTwo: "Dallas")
        }else {
            updateLabels()
            updateNextPrevButtons()
        }
                
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
        let flashcard = Flashcard(question: question, answer: answer)
// I think if i want to add my buttons to be uploaded as well
        flashcards.append(flashcard)
        
        btnOptionOne.setTitle(extraAnswerOne, for: .normal)
        btnOptionTwo.setTitle(answer, for: .normal)
        btnOptionThree.setTitle(extraAnswerTwo, for: .normal)
        
        print("Added new Flash Card")
        print("We now have \(flashcards.count) flashcards")
        currentIndex = flashcards.count - 1
        print("Our current Index is \(currentIndex)")
        updateNextPrevButtons()
        
        updateLabels()
        
        saveAllFlashcardsToDisk()
    }
    
    func updateNextPrevButtons(){
        if(currentIndex == flashcards.count - 1){
            nextButton.isEnabled = false
        }
        else{
            nextButton.isEnabled = true
        }
        if(currentIndex == 0){
            prevButton.isEnabled = false
        }else{
            prevButton.isEnabled = true
        }
    }
   
    func updateLabels(){
        
        let currentFlashcard = flashcards[currentIndex]
        
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
        // i think for the buttons ill have to do same i believe
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        currentIndex = currentIndex + 1
        updateLabels()
        updateNextPrevButtons()
        
    }
    
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        
        currentIndex = currentIndex - 1
        updateLabels()
        updateNextPrevButtons()
    }
    
    func saveAllFlashcardsToDisk(){

        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return ["question": card.question, "answer": card.answer]
        }
            UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
            
        print("Flashcards saved to UserDefaults")
        
        }
    func readSavedFlashcards(){
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String:String]]
        {
            // converting our dictionary array to flashcards
            let savedCards = dictionaryArray.map { dictionary -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
            }
        
    
        flashcards.append(contentsOf: savedCards)
       }
}
}
