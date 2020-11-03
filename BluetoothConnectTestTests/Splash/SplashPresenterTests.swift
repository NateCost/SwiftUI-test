//
//  Created by Ilya Sakalou on 10/31/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import XCTest
@testable import BluetoothConnectTest

class SplashPresenterTest: XCTestCase {
  var view: SplashViewInput?
  
  func testViewDidLoadActivateLoading() {
    let sut = makeSUT()
    sut.viewDidLoad()
    XCTAssertEqual(sut.view.loadController!.state, .active)
  }
  
  func makeSUT(view: SplashViewInput? = SplashViewSpy()) -> SplashPresenter {
    self.view = view
    self.view!.loadController = ActivatableItemControl(item: ActivatableItemSpy())
    let sut = SplashPresenter(view: self.view!)
    
    return sut
  }
  
  final class SplashViewSpy: SplashViewInput {
    var loadController: ActivatableItem?
  }
  
  final class ActivatableItemSpy: Selectable {
    func setState(_ state: ActivationState) {}
  }
}