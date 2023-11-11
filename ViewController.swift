//
//  ViewController.swift
//  Knob
//
//  Created by Kyle Wilson on 2023-11-11.
//

import UIKit

class ViewController: UIViewController {
    
    var valueLabelKnob1 = UILabel()
    var valueLabelKnob2 = UILabel()
    var valueLabelKnob3 = UILabel()
    var knob1 = Knob()
    var knob2 = Knob()
    var knob3 = Knob()

    override func viewDidLoad() {
        super.viewDidLoad()
        knob1 = createKnob(knobValue: 0, color: .red)
        knob2 = createKnob(knobValue: 0, color: .blue)
        knob3 = createKnob(knobValue: 0, color: .purple)
        let knobs = [knob1, knob2, knob3]
        for (index, knob) in knobs.enumerated() {
            view.addSubview(knob)
            knob.tag = index + 1
            knob.center.x = view.center.x
            knob.addTarget(self, action: #selector(handleKnobValueChanged), for: .valueChanged)
        }
        knob1.center.y = view.center.y + 200
        knob2.center.y = view.center.y
        knob3.center.y = view.center.y - 200
        valueLabelKnob1 = createLabel(knobValue: knob1.value)
        valueLabelKnob2 = createLabel(knobValue: knob2.value)
        valueLabelKnob3 = createLabel(knobValue: knob3.value)
        knob1.addSubview(valueLabelKnob1)
        knob2.addSubview(valueLabelKnob2)
        knob3.addSubview(valueLabelKnob3)
    }
    
    func createLabel(knobValue: Float) -> UILabel {
        let label = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: 120, height: 120)))
        label.textColor = .black
        label.textAlignment = .center
        label.text = String(format: "%.2f", knobValue)
        return label
    }
    
    func createKnob(knobValue: Float, color: UIColor) -> Knob {
        let knob = Knob(frame: CGRect(origin: .zero, size: CGSize(width: 120, height: 120)))
        knob.pointerLength = 8
        knob.lineWidth = 4
        knob.setValue(knobValue)
        knob.renderer.color = color
        return knob
    }
    
    @objc func handleKnobValueChanged(_ sender: Knob) {
        if sender.tag == 1 {
            valueLabelKnob1.text = String(format: "%.2f", sender.value)
        } else if sender.tag == 2 {
            valueLabelKnob2.text = String(format: "%.2f", sender.value)
        } else if sender.tag == 3 {
            valueLabelKnob3.text = String(format: "%.2f", sender.value)
        }
    }

}

