//
//  URLRequest+Extensions.swift
//  GoodNews
//
//  Created by Ира on 27.07.2020.
//  Copyright © 2020 Irina Lapteva. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct Resourse<T: Decodable> {
    let url: URL
}
extension URLRequest {

static func load<T>(resourse: Resourse<T>) -> Observable<T>{
    return Observable.from([resourse.url])
        .flatMap{ url -> Observable<Data> in
        let request = URLRequest(url: url)
        return URLSession.shared.rx.data(request: request)
    }.map { data -> T in
        return try! JSONDecoder().decode(T.self, from: data)
    }

}
}
