//  Copyright © 2017 One by AOL : Publishers. All rights reserved.

import UIKit
import OneMobileSDK
import PlayerControls

class ViewController: UIViewController {
    @IBAction func playVideoTouched(_ sender: Any) {
        OneSDK.Provider.default.getSDK()
            .then { $0.getPlayer(playlistID: "577cc27b88d2ff0d0f5acc71") }
            .dispatch(on: .main)
            .onSuccess {
                let playerViewController = PlayerViewController()
                playerViewController.contentControlsViewController = DefaultControlsViewController()
                playerViewController.player = $0
                self.navigationController?.pushViewController(playerViewController, animated: true)
            }
            .onError { error in
                let alert = UIAlertController(title: "Error",
                                              message: "\(error)",
                    preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK",
                                              style: .default,
                                              handler: nil))
                self.present(alert, animated: true, completion: nil)
        }
    }
}

