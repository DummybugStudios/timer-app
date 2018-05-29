import Cocoa

class MVMainView: NSView {
  
  override init(frame frameRect: NSRect) {
    super.init(frame: frameRect)
    
    let nc = NotificationCenter.default
    nc.addObserver(self, selector: #selector(windowFocusChanged), name: NSWindow.didBecomeKeyNotification, object: nil)
    nc.addObserver(self, selector: #selector(windowFocusChanged), name: NSWindow.didResignKeyNotification, object: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  deinit {
    let nc = NotificationCenter.default
    nc.removeObserver(self)
  }
  
  override func draw(_ dirtyRect: NSRect) {
    super.draw(dirtyRect)
    
    let windowHasFocus = self.window?.isKeyWindow ?? false
    var topColor = NSColor(srgbRed: 0.949, green: 0.9451, blue: 0.949, alpha: 1.0)
    var bottomColor = NSColor(srgbRed: 0.8392, green: 0.8314, blue: 0.8392, alpha: 1.0)
    if !windowHasFocus {
      topColor = NSColor(srgbRed: 0.9647, green: 0.9647, blue: 0.9647, alpha: 1.0)
      bottomColor = NSColor(srgbRed: 0.9647, green: 0.9647, blue: 0.9647, alpha: 1.0)
    }
    
    let gradient = NSGradient(colors: [topColor, bottomColor])
    let radius: CGFloat = 4.53
    let path = NSBezierPath(roundedRect: self.bounds, xRadius: radius, yRadius: radius)
    gradient?.draw(in: path, angle: -90)
  }
  
  @objc func windowFocusChanged(_ notification: Notification) {
    self.needsDisplay = true
  }
  
}
