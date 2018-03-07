import UIKit

let label = UILabel(frame: CGRect(x: 0, y: 0, width: 1, height: 1))

func tick() {
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
        label.text = Date().description
        label.textColor = .red
        label.font = label.font.withSize(44) 
        label.sizeToFit()
        label
        tick()
    }
}

tick()

import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


