//
//  YACUAIOBVO_KeyboardGuardian.swift
//  YaCupaiobvo
//
//  Created by  on 2026/1/23.
//
import UIKit

class YACUAIOBVO_KeyboardGuardian: NSObject {
    
    static let YACUAIOBVO_SHARED = YACUAIOBVO_KeyboardGuardian()
    
    private var YACUAIOBVO_ACTIVE_FRAME: CGRect = .zero
    private weak var YACUAIOBVO_HOST_VIEW: UIView?
    
    private override init() {
        super.init()
    }

    func YACUAIOBVO_ACTIVATE_MONITOR(for YACUAIOBVO_VIEW: UIView) {
        self.YACUAIOBVO_HOST_VIEW = YACUAIOBVO_VIEW
        NotificationCenter.default.addObserver(self, selector: #selector(YACUAIOBVO_SHIFT_UP), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(YACUAIOBVO_SHIFT_DOWN), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    func YACUAIOBVO_DEACTIVATE_MONITOR() {
        NotificationCenter.default.removeObserver(self)
        YACUAIOBVO_HOST_VIEW = nil
    }

    @objc private func YACUAIOBVO_SHIFT_UP(YACUAIOBVO_NOTIF: Notification) {
        guard let YACUAIOBVO_INFO = YACUAIOBVO_NOTIF.userInfo,
              let YACUAIOBVO_KB_FRAME = YACUAIOBVO_INFO[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let YACUAIOBVO_CURRENT_INPUT = UIResponder.YACUAIOBVO_FIND_CURRENT(),
              let YACUAIOBVO_CONTAINER = YACUAIOBVO_HOST_VIEW else { return }

        let YACUAIOBVO_INPUT_GLOBAL_FRAME = YACUAIOBVO_CURRENT_INPUT.convert(YACUAIOBVO_CURRENT_INPUT.bounds, to: YACUAIOBVO_CONTAINER)
        let YACUAIOBVO_KB_TOP = YACUAIOBVO_CONTAINER.frame.height - YACUAIOBVO_KB_FRAME.height
        let YACUAIOBVO_INPUT_BOTTOM = YACUAIOBVO_INPUT_GLOBAL_FRAME.origin.y + YACUAIOBVO_INPUT_GLOBAL_FRAME.size.height
        
     
        if YACUAIOBVO_INPUT_BOTTOM > YACUAIOBVO_KB_TOP {
            let YACUAIOBVO_OFFSET = YACUAIOBVO_INPUT_BOTTOM - YACUAIOBVO_KB_TOP + 20
            YACUAIOBVO_ANIMATE_SHIFT(YACUAIOBVO_VAL: -YACUAIOBVO_OFFSET)
        }
    }

    @objc private func YACUAIOBVO_SHIFT_DOWN() {
        YACUAIOBVO_ANIMATE_SHIFT(YACUAIOBVO_VAL: 0)
    }

    private func YACUAIOBVO_ANIMATE_SHIFT(YACUAIOBVO_VAL: CGFloat) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.YACUAIOBVO_HOST_VIEW?.transform = CGAffineTransform(translationX: 0, y: YACUAIOBVO_VAL)
        }, completion: nil)
    }
}


extension UIResponder {
    private static weak var YACUAIOBVO_RESPONDER_RESERVOIR: UIResponder?

    static func YACUAIOBVO_FIND_CURRENT() -> UIView? {
        YACUAIOBVO_RESPONDER_RESERVOIR = nil
        UIApplication.shared.sendAction(#selector(YACUAIOBVO_TRAP_RESPONDER), to: nil, from: nil, for: nil)
        return YACUAIOBVO_RESPONDER_RESERVOIR as? UIView
    }

    @objc private func YACUAIOBVO_TRAP_RESPONDER() {
        UIResponder.YACUAIOBVO_RESPONDER_RESERVOIR = self
    }
}
