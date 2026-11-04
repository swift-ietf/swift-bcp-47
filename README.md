# swift-bcp-47

Use this package when you want to refer to language tags such as `zh-Hans-CN` by their best known name, BCP 47. `BCP47.LanguageTag` and `BCP47.Error` are the same types as `RFC_5646.LanguageTag` and `RFC_5646.Error`, so values pass between the two names freely and all parsing and validation rules are those of swift-rfc-5646. Depend on swift-rfc-5646 directly if you prefer the RFC name. If you only need a language, an optional region and an optional script, use swift-locale-standard.
