//
//  UIControl+AddAction.swift
//  Baygur
//
//  Created by Maya Fleischer on 19/06/2022.
//  Copyright © 2022 Lightricks. All rights reserved.
//

public extension UIControl {
  /// Performs the provided `closure` whenever the receiver receives the given `controlEvents`.
  ///
  /// See the following example:
  /// ``` swift
  /// let button = UIButton(frame: .zero)
  /// button.lt_addAction {
  ///   print("Touched")
  /// }
  /// ```
  ///
  /// It prints `Touched` whenever the `.touchUpInside` event is sent to the `button`. It's possible
  /// to provide custom `UIControl.Event` using the `lt_addAction(for:,_:)` method.
  @objc(lt_addActionFor:block:)
  func lt_addAction(
    for controlEvents: UIControl.Event = .touchUpInside,
    _ closure: @escaping () -> Void
  ) {
    if #available(iOS 14.0, *) {
      addAction(UIAction { _ in closure() }, for: controlEvents)
      return
    }
    @objc class ClosureWrapper: NSObject {
      let closure: () -> Void

      init(_ closure: @escaping () -> Void) {
        self.closure = closure
      }

      @objc func invoke() {
        closure()
      }
    }
    let wrapper = ClosureWrapper(closure)
    addTarget(wrapper, action: #selector(ClosureWrapper.invoke), for: controlEvents)
    objc_setAssociatedObject(
      self,
      "\(UUID())",
      wrapper,
      objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
    )
  }
}
