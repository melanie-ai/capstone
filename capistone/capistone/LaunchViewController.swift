//
//  LaunchViewController.swift
//  capistone
//
//  Created by Shawneice Salmon on 12/17/24.
//

import UIKit
import Lottie
class LaunchViewController: UIViewController {

   
    // MARK: - Navigation
    private var animationView: LottieAnimationView?

    override func viewDidLoad() {

      super.viewDidLoad()
      
      // 2. Start LottieAnimationView with animation name (without extension)
      
      animationView = .init(name: "coffee")
      
      animationView!.frame = view.bounds
      
      // 3. Set animation content mode
      
      animationView!.contentMode = .scaleAspectFit
      
      // 4. Set animation loop mode
      
      animationView!.loopMode = .loop
      
      // 5. Adjust animation speed
      
      animationView!.animationSpeed = 0.5
      
      view.addSubview(animationView!)
      
      // 6. Play animation
      
      animationView!.play()
      
    }
}
