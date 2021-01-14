//
//  Singleton.swift
//  FZObserver_Example
//
//  Created by FranZhou on 2020/7/31.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import FZObserver

class Singleton {

    /// @FZObserver修饰之后，会生成一个 _store 属性， 类型是 FZObserver<UInt32?>，只能在内部访问到
    @FZObserver public var store: UInt32?

    var storeObserver: FZObserver<UInt32?> {
        get {
            return _store
        }
    }

    /// 常规的构建方式
    public var observer: FZObserver<UInt32?> = FZObserver(wrappedValue: nil)

    /// 单例
    static let singleton = Singleton()

    class func share() -> Singleton {

        return Singleton.singleton
    }

    private init() {

    }

}
