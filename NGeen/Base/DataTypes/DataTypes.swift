//
// DataTypes.swift
// Copyright (c) 2014 NGeen
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

// MARK: Api content type

enum ContentType: String {
    case image = "image/"
    case json = "application/json"
    case multiPartForm = "multipart/form-data"
    case textPlain = "text/plain"
    case urlEnconded = "application/x-www-form-urlencoded"
}

// MARK: Api http method

enum HttpMethod: String {
    case delete = "DELETE"
    case head = "HEAD"
    case get = "GET"
    case options = "OPTIONS"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
}

// MARK: Api scheme

enum HttpScheme: String {
    case http = "http"
    case https = "https"
}

// MARK: Closure response

typealias NGeenClosure = ((object: AnyObject?, error : NSError?) -> Void)?

// MARK: Database types

enum DatabaseType: Int {
    case coreData
    case sqlite
}

// MARK: DataTask closure response

typealias NGeenTaskClosure = ((data: NSData!, response: NSURLResponse!, error: NSError!) -> Void)?

// MARK: DataTask progress closure

typealias NGeenProgressTaskClosure = ((Int64!, Int64!, Int64!) -> Void)?

// MARK: DataTask stream closure

typealias NGeenTaskStreamClosure = ((NSURLSession!, NSURLSessionTask!) -> NSInputStream)

// MARK: NGeen options

struct NGeenOptions: RawOptionSetType {
    private var value: UInt = 0
    init(_ value: UInt) { self.value = value }
    var boolValue: Bool { return self.value != 0 }
    func toRaw() -> UInt { return self.value }
    static func fromRaw(raw: UInt) -> NGeenOptions? { return self(raw) }
    static func fromMask(raw: UInt) -> NGeenOptions { return self(raw) }
    static func convertFromNilLiteral() -> NGeenOptions { return self(0) }
    
    static var none: NGeenOptions { return self(1 << 0) }
    static var useURLCache: NGeenOptions { return self(1 << 1) } /* Ignore the ngeen cache use the default behavior of the NSURLCache */
    static var useNGeenCacheReturnCacheDataDontLoad: NGeenOptions { return self(1 << 2) } /* Use the ngeen cache but don't load data from the server */
    static var useNGeenCacheReturnCacheDataContinueLoading: NGeenOptions { return self(1 << 3) } /* Use the ngeen cache and load data from the server */
    static var ignoreCache: NGeenOptions { return self(1 << 4) } /* Ignore both cache */
    static var allowCellularAccess: NGeenOptions { return self(1 << 5) } /* Allow to use cellular access */
    static var allowInvalidCertificates: NGeenOptions { return self(1 << 6) } /* Allow to use invalid certificates */
    static var HTTPShouldHandleCookies: NGeenOptions { return self(1 << 7) } /* Allow the request handle cookies */
    static var HTTPShouldUsePipelining: NGeenOptions { return self(1 << 7) } /* Allow the request use pipelining */
}

// MARK: Overload operators

 func +=<K, V> (inout left: Dictionary<K, V>, right: Dictionary<K, V>) -> Dictionary<K, V> {
    for (k, v) in right {
        left.updateValue(v, forKey: k)
    }
    return left
}

// MARK: Policy

enum Policy {
    case certificate
    case none
    case publicKey
}