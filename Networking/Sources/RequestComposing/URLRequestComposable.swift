import Foundation

/*
 * This protocol is supposed to be conformed by any object that is responsible
 * to provide fully composed URLRequest
 */

public protocol URLRequestComposable {
    var composer: URLRequestComposer { get set }
    init(composer: URLRequestComposer)
}
