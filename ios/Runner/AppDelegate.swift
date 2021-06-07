import UIKit
import Flutter
import CoreNFC

private var nfcChannel: FlutterMethodChannel?

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, NFCTagReaderSessionDelegate {
    var flResult: FlutterResult?
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    
    // バッテリーのチャンネル
    let batteryChannel = FlutterMethodChannel(name: "samples.flutter.dev/battery",
                                              binaryMessenger: controller.binaryMessenger)
    
    // Flutterで呼び出されたときに下のコードが呼び出される。
    batteryChannel.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
      // Note: this method is invoked on the UI thread.
      guard call.method == "getBatteryLevel" else {
        result(FlutterMethodNotImplemented)
        return
      }
      self?.receiveBatteryLevel(result: result)
    })
    
    nfcChannel = FlutterMethodChannel(name: "samples.flutter.dev/nfc",
                                              binaryMessenger: controller.binaryMessenger)
    
    nfcChannel!.setMethodCallHandler({
        [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      // Note: this method is invoked on the UI thread.
      guard call.method == "getNfcTag" else {
        result(FlutterMethodNotImplemented)
        return
      }
    
        self?.flResult = result
        self?.scanNfcTag(result: result)
        
    })
    
    
    
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
   /*
     * NFCタグの実装
     */
    private var session: NFCTagReaderSession?
    
    func tagReaderSessionDidBecomeActive(_ session: NFCTagReaderSession) {
        print("Session Begun!")
    }
    
    func tagReaderSession(_ session: NFCTagReaderSession, didInvalidateWithError error: Error) {
        print("Error with Launching Session")
    }
    
    func tagReaderSession(_ session: NFCTagReaderSession, didDetect tags: [NFCTag]) {
        print("Connecting To Tag")
        
        if tags.count > 1 {
            session.alertMessage = "More Than One Tag Detected, Please try again"
            session.invalidate()
        }
        
        let tag = tags.first!
        session.connect(to: tag) { (error) in
            if nil != error {
                session.invalidate(errorMessage: "Connection Failed")
            }
            
            if case let .miFare(sTag) = tag{
                let UID = sTag.identifier.map{ String(format: "%.2hhx", $0)}.joined()
                
                print("UID:", UID)
                print(sTag.identifier)
                session.alertMessage = "UID Captured"
                self.flResult!(String(UID))
                session.invalidate()

            }
        }
    }
    
    private func scanNfcTag(result: FlutterResult) {
        print("開始")
        self.session = NFCTagReaderSession(pollingOption: .iso14443, delegate: self)
        
        self.session?.alertMessage = "Hold Your Phone Near the NFC Tag"
        self.session?.begin()
    }
    
    
    private func receiveBatteryLevel(result: FlutterResult) {
      let device = UIDevice.current
      device.isBatteryMonitoringEnabled = true
      if device.batteryState == UIDevice.BatteryState.unknown {
        result(FlutterError(code: "UNAVAILABLE",
                            message: "Battery info unavailable",
                            details: nil))
      } else {
        result(Int(device.batteryLevel * 100))
      }
    }
    
    
}
