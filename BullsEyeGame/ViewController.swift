//
//  ViewController.swift
//  BullsEyeGame
//
//  Created by Fedor Lvov on 15/08/2019.
//  Copyright © 2019 Fedor Lvov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0;
    var targetValue: Int = 0;
    var roundsCounter: Int = 0;
    var totalScore: Int = 0;
    
    @IBOutlet weak var targetValueLabel: UILabel!;
    @IBOutlet weak var roundsCounterLabel: UILabel!;
    @IBOutlet weak var totalScoreLabel: UILabel!;
    
    @IBOutlet weak var slider: UISlider!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound();
        
        let sliderIconNormal = #imageLiteral(resourceName: "SliderThumb-Normal");
        slider.setThumbImage(sliderIconNormal, for: .normal);
        
        let sliderIconHighlited = #imageLiteral(resourceName: "SliderThumb-Highlighted");
        slider.setThumbImage(sliderIconHighlited, for: .highlighted);
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14);
        
        let sliderLeftImage = #imageLiteral(resourceName: "SliderTrackLeft");
        let sliderLeftImageResizable = sliderLeftImage.resizableImage(withCapInsets: insets);
        slider.setMinimumTrackImage(sliderLeftImageResizable, for: .normal);
        
        let sliderRightImage = #imageLiteral(resourceName: "SliderTrackRight");
        let sliderRightImageResizable = sliderRightImage.resizableImage(withCapInsets: insets);
        slider.setMaximumTrackImage(sliderRightImageResizable, for: .normal);
    }
    
    @IBAction func startOverButton() {
        let title = "Start Over";
        let message = "Are you sure?"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        
        let actionYes = UIAlertAction(title: "Yes", style: .destructive, handler: {
            action in
            self.startNewGame();
        });
        
        let actionNo = UIAlertAction(title: "No", style: .cancel, handler: nil);
        
        alert.addAction(actionYes);
        alert.addAction(actionNo);
        
        present(alert, animated: true, completion: nil);
    }

    @IBAction func countScore() {
        
        let diffrence = abs(targetValue - currentValue);
        var points = 100 - diffrence;
        
        let title: String;
        switch (diffrence) {
        case 50...:
            title = "Not even close...";
            break;
        case 20... :
            title = "Not bad";
            break;
        case 10... :
            title = "Pretty good";
            break;
        case 2...:
            title = "Too close";
            break;
        case 1:
            title = "Almost had it!";
            points += 51;
            break;
        case 0:
            title = "Perfect!";
            points += 100;
            break;
        default:
            title = "How are you do this?!";
            break;
        }
        
        let message = "Your earn \(points) point";
        totalScore += points;
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
    
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound();
        });
        
        alert.addAction(action);
        
        present(alert, animated: true, completion: nil);
    }
    
    func startNewGame() {
        roundsCounter = 0;
        totalScore = 0;
        startNewRound();
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100);
        currentValue = 50;
        slider.value = Float(currentValue);
        roundsCounter += 1;
        updateLaabels();
    }
    
    func updateLaabels() {
        targetValueLabel.text = String(targetValue);
        roundsCounterLabel.text = String(roundsCounter);
        totalScoreLabel.text = String(totalScore);
    }
    
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = Int(slider.value.rounded());
    }

}

