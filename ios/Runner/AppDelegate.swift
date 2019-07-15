import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyC3EudpQrfzhLcwakcfx4r_ZhrGRkw4vOU")  // Add this line!
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}