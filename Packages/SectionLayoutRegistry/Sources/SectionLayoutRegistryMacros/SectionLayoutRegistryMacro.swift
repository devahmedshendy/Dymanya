import SwiftSyntax
import SwiftCompilerPlugin
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct SectionRegistryMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {

        // 1. Extract the array argument
        guard let arguments = node.arguments?.as(LabeledExprListSyntax.self),
              let arrayExpr = arguments.first?.expression.as(ArrayExprSyntax.self)
        else { return [] }

        var cases: [String] = []

        // 2. Iterate over the Tuples provided in the code
        // e.g. (.square, SquareView.self)
        for element in arrayExpr.elements {
            guard let tuple = element.expression.as(TupleExprSyntax.self),
                  tuple.elements.count == 2,
                  let enumCase = tuple.elements.first?.expression, // e.g., .square
                  let viewType = tuple.elements.last?.expression   // e.g., SquareView.self
            else { continue }

            // 3. Generate the Case Code
            cases.append("""
            case \(enumCase):
                \(viewType)(items: section.items)
            """)
        }

        // 4. Generate the 'body' property
        // We assume the parent View has a property named 'section'
        let code = """
        var body: some View {
            switch section.type {
            \(cases.joined(separator: "\n"))
            default:
                EmptyView()
            }
        }
        """

        return [DeclSyntax(stringLiteral: code)]
    }
}

@main
struct SectionLayoutRegistryPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        SectionRegistryMacro.self
    ]
}
