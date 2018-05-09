//
//  BrushSettingViewController.swift
//  ARPainter
//
//  Created by Miyoshi Masataka on 2018/05/09.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import UIKit

class BrushSettingViewController: UIViewController {
    
    // MARK: - Properties

    @IBOutlet weak var brushPicker: UIPickerView!
    @IBOutlet weak var sizeSlider: UISlider!
    @IBOutlet weak var spinnigSwitch: UISwitch!
    
    private let COLOR_COMPONENT = 0
    private let SHEPE_COMPONENT = 1
    
    internal var brushSettings: BrushSettings!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rootTabBarController = self.tabBarController as! RootTabBaViewController
        brushSettings = rootTabBarController.burushSettings
        brushPicker.dataSource = self
        brushPicker.delegate = self
    }
    
    // MARK: - Actions
    
    @IBAction func sizeSliderChanged(_ sender: UISlider) {
        brushSettings.size = CGFloat(sender.value)
    }
    
    @IBAction func spinnigSwitchChanged(_ sender: UISwitch) {
        brushSettings.isSpnning = sender.isOn
    }
    
}

// MARK: - UIPickerViewDataSource
/*******************************************************************************************/
extension BrushSettingViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == COLOR_COMPONENT {
            return ColorListItem.colors.count
        } else {
            return ShapeListItem.shapes.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        let titleText: String
        let titleTextAttributes: [NSAttributedStringKey: Any]
        if component == COLOR_COMPONENT {
            titleText = ColorListItem.colors[row].name
            titleTextAttributes = [
                .strokeColor: UIColor.black,
                .foregroundColor: ColorListItem.colors[row].color,
                .strokeWidth: -2.0,
                .font: UIFont.boldSystemFont(ofSize: 36)
            ]
            label.textAlignment = .right
        } else {
            titleText = ShapeListItem.shapes[row].name
            titleTextAttributes = [
                .strokeColor: UIColor.black,
                .foregroundColor: brushSettings.color,
                .strokeWidth: -2.0,
                .font: UIFont.boldSystemFont(ofSize: 36)
            ]
            label.textAlignment = .left
        }
        let title = NSAttributedString(string: titleText, attributes: titleTextAttributes)
        label.attributedText = title
        return label
    }
    
}

// MARK: - UIPickerViewDelegate
/*******************************************************************************************/
extension BrushSettingViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == COLOR_COMPONENT {
            brushSettings.color = ColorListItem.colors[row].color
            pickerView.reloadComponent(SHEPE_COMPONENT)
        } else {
            brushSettings.shape = ShapeListItem.shapes[row].shape
        }
    }
    
}





















