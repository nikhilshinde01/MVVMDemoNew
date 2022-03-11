//
//  EmployeesViewController.swift
//  MVVMDemoNew
//
//  Created by Nikhil Shinde on 11/03/22.
//

import UIKit

class EmployeesViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    lazy var viewModel = {
        EmployeesViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initViewModel()
    }

    func initView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .lightGray
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false

        tableView.register(EmployeeCell.nib, forCellReuseIdentifier: EmployeeCell.identifier)
    }

    func initViewModel() {
        // Get employees data
        viewModel.getEmployees()
        
        // Reload TableView closure
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDelegate

extension EmployeesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

// MARK: - UITableViewDataSource

extension EmployeesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.employeeCellViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeCell.identifier, for: indexPath) as? EmployeeCell else { fatalError("xib does not exists") }
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.cellViewModel = cellVM
        return cell
    }
}
