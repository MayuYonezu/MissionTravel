//
//  ViewController.swift
//  MissionTravel
//
//  Created by Mayu Yonezu on 2022/06/06.
//

import UIKit

final class StartUpViewController: UIViewController, Instantiatable {

    private let viewModel: StartUpViewModel
    // 新規作成ボタン
    @IBOutlet private weak var newProjectButton: UIButton! {
        didSet {
            newProjectButton.addTarget(self, action: #selector(didTapNewProjectButton), for: .touchUpInside)
        }
    }
    // リスト一覧ボタン
    @IBOutlet private weak var projectListButton: UIButton! {
        didSet {
            projectListButton.addTarget(self, action: #selector(didTapProjectListButton), for: .touchUpInside)
        }
    }

    init?(coder: NSCoder, input: Void) {
        self.viewModel = .init()
        super.init(coder: coder)
    }

    required init(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting up NavigationBar
        do {
            navigationItem.title = "home"
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.mainPink
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navigationItem.standardAppearance = appearance
            navigationItem.scrollEdgeAppearance = appearance
            navigationItem.compactAppearance = appearance
            navigationController?.navigationBar.prefersLargeTitles = true
        }
    }

    @objc private func didTapNewProjectButton() {
        let editVC = EditViewController()
        self.navigationController?.pushViewController(editVC, animated: true)
    }

    @objc private func didTapProjectListButton() {
        let listVC = ListViewController()
        self.navigationController?.pushViewController(listVC, animated: true)
    }
}

