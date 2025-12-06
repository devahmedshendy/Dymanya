struct SquareLayoutView: SectionLayoutView {
    let title: String
    let items: [any SectionItem]

    var body: some View {
        VStack(spacing: 0) {
            Text(title)

            VStack {
                ForEach(items, id: \.id) { item in
                    Text(item.title)
                }
            }
        }
    }
}