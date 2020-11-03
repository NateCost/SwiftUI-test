//
//  Created by Ilya Sakalou on 10/30/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import Foundation

final class SplashComposer {
  let viewController: SplashVC
  
  class func compose() -> SplashComposer {
    let controller = SplashVC(colorPalette: RegularIOSPalette())
    let presenter = SplashPresenter(
      view: controller
    )
    controller.output = presenter
    return SplashComposer(viewController: controller)
  }
  
  private init(viewController: SplashVC) {
    self.viewController = viewController
  }
}

protocol SplashViewInput: class {
  var loadController: ActivatableItem? { get set }
}

protocol SplashViewOutput: class {
  func viewDidLoad()
}