//
//  PhoneViewModel.swift
//  SeSACRxThreads
//
//  Created by Seungyeon Kim on 11/2/23.
//

import Foundation
import RxSwift

class PhoneViewModel {
    
    let phone = BehaviorSubject(value: "010")
//    let formattedPhone = PublishSubject<String>()
    let buttonEnable = BehaviorSubject(value: false)
    let disposeBag = DisposeBag()
    
    init() {
        phone
            .observe(on: MainScheduler.instance)
            .subscribe(with: self) { owner, value in
                let value = value.formated(by: "###-####-####")
                self.phone.onNext(value)
            }
            .disposed(by: disposeBag)
        
        phone
            .observe(on: MainScheduler.instance)
            .map{ $0.count > 10 }
            .subscribe(with: self, onNext: { owner, value in
                owner.buttonEnable.onNext(value)
            })
            .disposed(by: disposeBag)
        
    }
    
}
