//
//  ViewController.swift
//  UID2GoogleIMADevelopmentApp
//
//  See: https://developers.google.com/interactive-media-ads/docs/sdks/ios/client-side#swift
//
//  Created by Brad Leege on 4/12/23.
//

import AVKit
import GoogleInteractiveMediaAds
import UIKit

class ViewController: UIViewController {
  static let ContentURLString = "https://storage.googleapis.com/interactive-media-ads/media/bipbop.m3u8"

  var playerViewController: AVPlayerViewController!

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.black;
    setUpContentPlayer()
  }

  func setUpContentPlayer() {
    // Load AVPlayer with path to your content.
    let contentURL = URL(string: ViewController.ContentURLString)!
    let player = AVPlayer(url: contentURL)
    playerViewController = AVPlayerViewController()
    playerViewController.player = player

    showContentPlayer()
  }

  func showContentPlayer() {
    self.addChild(playerViewController)
    playerViewController.view.frame = self.view.bounds
    self.view.insertSubview(playerViewController.view, at: 0)
    playerViewController.didMove(toParent:self)
  }

  func hideContentPlayer() {
    // The whole controller needs to be detached so that it doesn't capture  events from the remote.
    playerViewController.willMove(toParent:nil)
    playerViewController.view.removeFromSuperview()
    playerViewController.removeFromParent()
  }
}
