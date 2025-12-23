import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    // 1. Hide the title and make it transparent
    self.titleVisibility = .hidden
    self.titlebarAppearsTransparent = true
    self.styleMask.insert(.fullSizeContentView)

    // 2. Initial adjustment
    adjustTrafficLights()

    // 3. Listen for resize events to prevent buttons from "snapping back"
    NotificationCenter.default.addObserver(forName: NSWindow.didResizeNotification, object: self, queue: .main) { _ in
        self.adjustTrafficLights()
    }

    RegisterGeneratedPlugins(registry: flutterViewController)
    super.awakeFromNib()
  }

  func adjustTrafficLights() {
    // Standard button types: close, miniaturize, zoom
    let buttons: [NSWindow.ButtonType] = [.closeButton, .miniaturizeButton, .zoomButton]
    
    for buttonType in buttons {
        if let button = self.standardWindowButton(buttonType) {
            var frame = button.frame
            // Modify these values to "nudge" the buttons
            frame.origin.x += 12 // Shift right
            frame.origin.y -= 12 // Shift down (negative is down in macOS coords)
            button.setFrameOrigin(frame.origin)
        }
    }
  }
}
