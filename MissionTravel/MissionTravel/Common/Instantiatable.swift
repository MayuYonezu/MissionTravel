//  Created by anies1212 on 2022/10/30.
//

import UIKit

protocol Instantiatable {
    associatedtype Input
    init?(coder: NSCoder, input: Input)
    init?(input: Input)
}

extension Instantiatable where Self: UIViewController {
    init?(coder: NSCoder, input: Input) {
        fatalError("\(String(describing: Self.self)) is required any initializer")
    }

    init?(input: Input) {
        nil
    }

    static func instantiate(with input: Input) -> Self {
        if let vc = Self(input: input) {
            return vc
        }

        let storyboardName = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: self))
        guard let vc = storyboard.instantiateInitialViewController(creator: { coder in
                Self(coder: coder, input: input)
            }) else {
            fatalError("Unable to create \(storyboardName)")
        }
        return vc
    }
}

extension Instantiatable where  Self: UIViewController, Input == Void {
    static func instantiate() -> Self {
        instantiate(with: ())
    }
}
