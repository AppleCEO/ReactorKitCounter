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
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

