//
//  ViewController.swift
//  ReactorKitCounter
//
//  Created by 도미닉 on 7/23/25.
//

import UIKit
import ReactorKit
import RxCocoa

class CounterViewController: UIViewController, View {
    let stackView = UIStackView()
    let countLabel = UILabel()
    let minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    let plusButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    var disposeBag: RxSwift.DisposeBag = DisposeBag()

    func bind(reactor: CounterReactor) {
        setPlusButtonTap(reactor: reactor)
        setMinusButtonTap(reactor: reactor)
        bindCountState(reactor: reactor)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    private func configureView() {
        addSubViews()
        setAutolayout()
    }
    
    private func addSubViews() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        [minusButton, countLabel, plusButton].forEach { view in
            stackView.addArrangedSubview(view)
        }
    }
    
    private func setAutolayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setPlusButtonTap(reactor: CounterReactor) {
        plusButton.rx.tap
            .map { Reactor.Action.plusButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func setMinusButtonTap(reactor: CounterReactor) {
        minusButton.rx.tap
            .map { Reactor.Action.minusButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func bindCountState(reactor: CounterReactor) {
        reactor.state.map { $0.count }
            .distinctUntilChanged()
            .bind(with: self) { [weak self] owner, count in
                self?.countLabel.text = String(count)
            }
            .disposed(by: disposeBag)
    }
}

