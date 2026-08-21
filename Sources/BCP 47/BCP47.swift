@_exported import RFC_5646
import Standard_Library_Extensions

public enum BCP47 {}

extension BCP47 {

    public typealias LanguageTag = RFC_5646.LanguageTag

    public typealias Error = RFC_5646.Error
}
