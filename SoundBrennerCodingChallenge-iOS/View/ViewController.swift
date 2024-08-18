//
//  ViewController.swift
//  SoundBrennerCodingChallenge-iOS
//
//  Created by Kantachat.Pua on 18/8/2567 BE.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel: ViewModel = ViewModel(objects: .init(component: []))
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Init commit - Hello SoundBrenner!
        setupUI()
        setupData()
    }
    
    private func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .sbnBasicDarkGrey
        self.view.backgroundColor = .sbnBasicDarkGrey
    }
    
    private func setupData() {
        viewModel.requestMainComponents()
        
        // register cells
        let colourWheelCellNib = UINib(nibName: viewModel.colorWheelCellNib, bundle: nil)
        let segmentCellNib = UINib(nibName: viewModel.segmentControllerCellNib, bundle: nil)
        let brightnessCellNib = UINib(nibName: viewModel.brightnessAdjustCellNib, bundle: nil)
        tableView.register(colourWheelCellNib, forCellReuseIdentifier: viewModel.colorWheelCellIdentifier)
        tableView.register(segmentCellNib, forCellReuseIdentifier: viewModel.segmentControllerCellIdentifier)
        tableView.register(brightnessCellNib, forCellReuseIdentifier: viewModel.brightnessAdjustCellIdentifier)
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // set number of item in row of table
        return viewModel.getNumberOfRowInMainComponent()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.objects.component[indexPath.row] == .colorWheel {
            let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.colorWheelCellIdentifier) as! ColorWheelTableViewCell
            return cell
        } else if viewModel.objects.component[indexPath.row] == .segmentController {
            let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.segmentControllerCellIdentifier) as! SegmentControllerTableViewCell
            return cell
        } else if viewModel.objects.component[indexPath.row] == .brightnessAdjustment {
            let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.brightnessAdjustCellIdentifier) as! BrightnessTableViewCell
            return cell
        } else {
            let cell = UITableViewCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
