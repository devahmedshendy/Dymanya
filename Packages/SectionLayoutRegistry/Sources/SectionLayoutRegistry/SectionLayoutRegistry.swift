@attached(member, names: named(body))
public macro SectionLayoutRegistry<T>(
    _ routes: [(T, any SectionLayoutView.Type)]
) = #externalMacro(module: "SectionLayoutRegistryMacros", type: "SectionRegistryMacro")

