//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.07.2022.
//

import UIKit

class ResultViewController: UIViewController {
    //MARK: - IB Outlets
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    
    //MARK: - Public Properties
    var answersChosen: [Answer]!
    
    //MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        guard let animal = findAnimal() else { return }
        resultLabel.text = "Вы - \(animal.rawValue) !"
        definitionLabel.text = animal.definition
    }
    
    //MARK: - IB Actions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    deinit {
        print("ResultViewController has been deallocated")
    }
    
    //MARK: - Private Methods
    private func findAnimal() -> Animal? {
        let animalFrequency = answersChosen.reduce(into: [:] ) { $0[$1.animal, default: 0] += 1 }
        guard let result = animalFrequency.max(by: {$0.value < $1.value})?.key else { return nil }
        return result
    }
    
}
