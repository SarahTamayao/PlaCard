//
//  SecondViewController.swift
//  PlaCard
//
//  Created by Karene.A.N on 3/12/22.
//

import UIKit

class SecondViewController: UIViewController
{
    
    var viewController :ViewController!
    
    @IBOutlet weak var questionTextField: UITextField!
    
    @IBOutlet weak var answerTextField: UITextField!
    
    
    @IBOutlet weak var extraAnswerOne: UITextField!
    
    @IBOutlet weak var extraAnswerTwo: UITextField!
    
     
    var initialQuestion : String?
    
    var initialAnswer: String?
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        questionTextField.text = initialQuestion
        answerTextField.text = initialAnswer

    }
    
    @IBAction func didTapOnCancel(_ sender: Any)
    {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any)
    {
        let questionText = questionTextField.text
        let answerText = answerTextField.text
        let extraAnswer = extraAnswerOne.text
        let anotherAnswer = extraAnswerTwo.text
        //the question and answer will be set to nil if there are empty
        
        if (questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty)
        {
            //displays an error message
           
            let alert = UIAlertController(title: "Missing Text", message: "You must enter both a question and an answer", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
            
        }
        else
        {
            viewController.updateFlashCard(question:questionText!, answer: answerText!, extraAnswerOne: extraAnswer!, extraAnswerTwo: anotherAnswer!)
            dismiss(animated : true)
        }
       
       
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
