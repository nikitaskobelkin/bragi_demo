//
//  ImageCacheService.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 26/07/2023.
//

import SwiftUI

class ImageCacheService: ImageCacheServiceProtocol {
    private lazy var imageCache: NSCache<AnyObject, AnyObject> = {
        let cache = NSCache<AnyObject, AnyObject>()
        cache.countLimit = config.countLimit
        return cache
    }()

    private let lock = NSLock()
    private let config: CacheConfig

    init(config: CacheConfig = CacheConfig.defaultConfig) {
        self.config = config
    }
}

// MARK: - Config

struct CacheConfig {
    let countLimit: Int
    let memoryLimit: Int

    static let defaultConfig = CacheConfig(
        countLimit: ImageChacheConstants.max,
        memoryLimit: ImageChacheConstants.memory
    )
}

// MARK: - Methods

extension ImageCacheService {
    func insertImage(_ image: UIImage?, for url: String) {
        guard let image = image else { return removeImage(for: url) }
        lock.lock()
        defer {
            lock.unlock()
        }
        imageCache.setObject(image, forKey: url as AnyObject)
    }

    func removeImage(for url: String) {
        lock.lock()
        defer {
            lock.unlock()
        }
        imageCache.removeObject(forKey: url as AnyObject)
    }

    func image(for url: String) -> UIImage? {
        lock.lock()
        defer {
            lock.unlock()
        }
        guard let image = imageCache.object(forKey: url as AnyObject) as? UIImage else { return nil }
        return image
    }
}
