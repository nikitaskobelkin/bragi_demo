

import NeedleFoundation
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Registration

public func registerProviderFactories() {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->LibraryComponent->MediaItemComponent") { component in
        return MediaItemDependency7eea6553b942143d8e8fProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->LibraryComponent") { component in
        return LibraryDependencydf4b476f51ad8d19a376Provider(component: component)
    }
    
}

// MARK: - Providers

private class MediaItemDependency7eea6553b942143d8e8fBaseProvider: MediaItemDependency {
    var movieManager: MovieManagerProtocol {
        return rootComponent.movieManager
    }
    var imageCacheService: ImageCacheServiceProtocol {
        return rootComponent.imageCacheService
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->LibraryComponent->MediaItemComponent
private class MediaItemDependency7eea6553b942143d8e8fProvider: MediaItemDependency7eea6553b942143d8e8fBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(rootComponent: component.parent.parent as! RootComponent)
    }
}
private class LibraryDependencydf4b476f51ad8d19a376BaseProvider: LibraryDependency {
    var movieManager: MovieManagerProtocol {
        return rootComponent.movieManager
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->LibraryComponent
private class LibraryDependencydf4b476f51ad8d19a376Provider: LibraryDependencydf4b476f51ad8d19a376BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(rootComponent: component.parent as! RootComponent)
    }
}
