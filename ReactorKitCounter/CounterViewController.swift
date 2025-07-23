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
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    var disposeBag: RxSwift.DisposeBag = DisposeBag()

    func bind(reactor: CounterReactor) {
        plusButton.rx.tap
            .map { Reactor.Action.plusButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        minusButton.rx.tap
            .map { Reactor.Action.minusButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.count }
            .distinctUntilChanged()
            .bind(with: self) { [weak self] owner, count in
                self?.label.text = String(count)
            }
            .disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

