//
//  NicknameViewModel.swift
//  SeSACRxThreads
//
//  Created by Seungyeon Kim on 11/2/23.
//

import Foundation
import RxSwift
import RxCocoa

class NicknameViewModel {
    
    let nickname = BehaviorSubject(value: "")
    let buttonHidden = BehaviorSubject(value: false)
    let disposeBag = DisposeBag()
    
    init() {
        nickname
            .map {$0.count <= 2 && $0.count < 6 }
            .subscribe(with: self, onNext: { owner, value in
                owner.buttonHidden.onNext(value)
            })
            .disposed(by: disposeBag)
        
    }
    
    
}
