//
//  BirthdayViewModel.swift
//  SeSACRxThreads
//
//  Created by Seungyeon Kim on 11/2/23.
//

import Foundation
import RxSwift
import RxCocoa

class BirthdayViewModel {
    
    let birthday : BehaviorSubject<Date> = BehaviorSubject(value: .now)
    let year = BehaviorSubject(value: 2020)
    let month = BehaviorSubject(value: 12)
    let day = BehaviorSubject(value: 24)
    let buttonEnable = BehaviorSubject(value: false)
    
    let disposeBag = DisposeBag()
    
    init () {
        birthday
            .subscribe(with: self) { owner, date in
                let component = Calendar.current.dateComponents([.year, .month, .day], from: date)
                owner.year.onNext(component.year!)
                owner.month.onNext(component.month!)
                owner.day.onNext(component.day!)
            }
            .disposed(by: disposeBag)
    }
    
    
}
