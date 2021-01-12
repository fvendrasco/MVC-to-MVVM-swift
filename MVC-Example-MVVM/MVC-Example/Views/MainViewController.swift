//
//  MainViewController.swift
//  MVC-Example
//
//  Created by Marcio Fetter on 12/01/21.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    // MARK: - Visual Elements
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textAlignment = .center
        label.textColor = .darkGray
        label.text = "título"
        return label
    }()
    
    private lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.textColor = .darkGray
        label.text = "--/--/----"
        return label
    }()
    
    // MARK: - Properts
    let viewModel: MainViewModel
    
    // MARK: - Constructors
    init(viewModel: MainViewModel = MainViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewConfiguration()
        viewModel.delegate = self
        //bind()
        viewModel.loadMovie()
    }
    
//    func bind() {
//        viewModel.viewData.bind { (movieViewData) in
//            guard let `movieViewData` = movieViewData else { return }
//            self.titleLabel.text = movieViewData.title
//            self.releaseDateLabel.text = movieViewData.releaseDate
//        }
//    }
}

// MARK: - ViewConfiguration
extension MainViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(releaseDateLabel)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).inset(20)
            make.height.equalTo(200)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(containerView).offset(20)
            make.left.equalTo(containerView).offset(20)
            make.right.equalTo(containerView).inset(20)
        }
        releaseDateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.equalTo(containerView).offset(20)
            make.right.equalTo(containerView).inset(20)
        }
    }
    
    func configureViews() {
        view.backgroundColor = .blue
    }
}

extension MainViewController: MainViewModelDelegate {
    
    func reloadData(movie: MovieViewData) {
        self.titleLabel.text = movie.title
        self.releaseDateLabel.text = movie.releaseDate
    }
}
