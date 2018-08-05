import Foundation

extension URLSession {
    func jsonWithURL(url: URL, queue: DispatchQueue, completionHandler: @escaping (Any?, URLResponse?, PNCLogoError?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
            guard error == nil else {
                return queue.async { completionHandler(nil, response, .genericError(error)) }
            }
            guard let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) else {
                return queue.async { completionHandler(nil, response, .unableToDecodeJSON) }
            }
            return queue.async { completionHandler(json, response, nil) }
        })
    }
}
