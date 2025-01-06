
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    var questionsAsked = 0
    let totalQuestions = 10
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttons = [button1, button2, button3]
        for button in buttons {
            button?.layer.borderWidth = 1.0
            button?.layer.borderColor = UIColor { traitCollection in
                return traitCollection.userInterfaceStyle == .dark ? .white : .lightGray
            }.cgColor
        }

        
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
       
        askQuestion()
      
    }

    func askQuestion(action:UIAlertAction! = nil) {
        
        if questionsAsked < totalQuestions {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            button1.setImage(UIImage(named: countries[0]), for: .normal)
            button2.setImage(UIImage(named: countries[1]), for: .normal)
            button3.setImage(UIImage(named: countries[2]), for: .normal)
            
            updateTitle()
        }else{
          
            showFinalScore()
        }}
    
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        var title:String
        var message: String
        if sender.tag == correctAnswer{
            
            title = "Correct"
            score+=1
            message = "Your score is \(score)."
        }else{
            title = "Wrong"
            score-=1
            message = "That’s the flag of \(countries[sender.tag].capitalized).\nYour score is \(score)."
        }
        
       questionsAsked += 1
 
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(alert, animated: true)
    }
    
    func updateTitle() {
            
        title = "\(countries[correctAnswer].uppercased()) | Score: \(score) | Q: \(questionsAsked + 1)/\(totalQuestions)"
        }
    
    func showFinalScore() {
            
            let alert = UIAlertController(
                title: "Game Over",
                message: "You answered \(totalQuestions) questions.\nYour final score is \(score).",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "Restart", style: .default) { _ in
                self.restartGame()
            })
            present(alert, animated: true)
        }
        
        func restartGame() {
           
            score = 0
            questionsAsked = 0
            askQuestion()
        }
}


