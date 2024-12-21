//
//  ResultVC.swift
//  Quiz
//
//  Created by Анастасия Восколович on 25.11.2024.
//


import UIKit

final class ResultViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var definition: UILabel!
    
    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        findAnimal()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}

// MARK: - Private Methods

extension ResultViewController {
    private func findAnimal() {
        var answerAnimal: [Animal: Int] = [:]
        let animals = answersChosen.map { $0.animal }
        animals.forEach { answerAnimal[$0, default: 0] += 1 }
        
        let sortedFrequentOfAnimals = answerAnimal.sorted { $0.value > $1.value }
        guard let mostFrequentAnimal = sortedFrequentOfAnimals.first?.key else { return }
        
        updateUI(with: mostFrequentAnimal)
        
    }
    
    private func updateUI(with animal: Animal) {
        result.text = "Вы \(animal.rawValue)!"
        definition.text = animal.definition
    }
}
