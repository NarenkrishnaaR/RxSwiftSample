//
//  ViewController.swift
//  ReactiveSwiftSample
//
//  Created by Naren on 06/03/18.
//  Copyright © 2018 naren. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
  
  @IBOutlet weak var btnTap: UIButton!
  
  @IBOutlet weak var dataTxtFld: UITextField!
  
  @IBOutlet weak var dataLbl: UILabel!
  
  var disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    buttonCallRxFuncs()
    textFieldRxFuncs()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func buttonCallRxFuncs(){
    let buttonTapFuncs = btnTap.rx.tap
    buttonTapFuncs.asDriver().throttle(3).drive(onNext: { (_) in
      print("Tapped")
    }, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    
    //    buttonTapFuncs.asDriver().debounce(3).drive(onNext: { (_) in
    //      print("Debounce")
    //    }, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
  }
  
  func textFieldRxFuncs(){
    let txtFunc = dataTxtFld.rx.text
    txtFunc.map({"Hey \($0 ?? "")"}).bind(to: dataLbl.rx.text).disposed(by: disposeBag)
  }
}

