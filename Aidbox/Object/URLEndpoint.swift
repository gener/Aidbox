//
//  URLEndpoint.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 08.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit
import Alamofire

struct URLEndpoint: URLConvertible {

	var host: String = "https://waveacc.aidbox.io/"
	var path: String

	init(_ path: String) {
		self.path = path
	}

	func asURL() throws -> URL {
		return URL(string: "\(host)\(path)")!
	}

}

struct Endpoint {
	static let oauthCode = URLEndpoint("oauth/authorize")
	static let oauthToken = URLEndpoint("oauth/token")
	static let curretnUser = URLEndpoint("user")

}

extension URL {
	public var queryItems: [String: String] {
		var params = [String: String]()
		return URLComponents(url: self, resolvingAgainstBaseURL: false)?
			.queryItems?
			.reduce([:], { (_, item) -> [String: String] in
				params[item.name] = item.value
				return params
			}) ?? [:]
	}
}
