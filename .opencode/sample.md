import SwiftUI

// MARK: - 1. The Data Models (Pragmatic Approach)
struct ContentItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let caption: String? // For timestamps or extra info
    let imageUrl: String
    let avatarUrl: String? // For social posts or host icons
    let badgeText: String? // "New", "1h 30m"
}

struct SectionData: Identifiable {
    let id = UUID()
    let title: String
    let type: SectionType
    let items: [ContentItem]
}

enum SectionType {
    case queue
    case standardRow
    case verticalList
    case wideCards
    case socialFeed
}

// MARK: - 2. The Views

struct HomeWithRealDataView: View {
    // Mock Data Source
    let sections = MockDataFactory.createSections()

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Dark Theme Background

            ScrollView {
                VStack(spacing: 32) {

                    // Header Simulation
                    HStack {
                        Image(systemName: "bell.badge")
                        Spacer()
                        Text("مساء الخير، عبدالرحمن")
                            .font(.headline)
                        Image(systemName: "person.crop.circle.fill")
                            .font(.title2)
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.top)

                    // Iterate over sections
                    ForEach(sections) { section in
                        VStack(alignment: .leading, spacing: 16) {

                            // Section Title
                            if !section.title.isEmpty {
                                HStack {
                                    Text(section.title)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Image(systemName: "chevron.left") // Points left in RTL
                                        .foregroundColor(.gray)
                                }
                                .padding(.horizontal)
                            }

                            // Render specific layout based on type
                            switch section.type {
                            case .queue:
                                QueueSectionView(item: section.items.first!)
                                    .padding(.horizontal)

                            case .standardRow:
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(alignment: .top, spacing: 12) {
                                        ForEach(section.items) { item in
                                            StandardCardView(item: item)
                                        }
                                    }
                                    .padding(.horizontal)
                                }

                            case .verticalList:
                                TwoRowGridSection(items: section.items)
                                    .padding(.horizontal)

                            case .wideCards:
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 12) {
                                        ForEach(section.items) { item in
                                            WideCardView(item: item)
                                        }
                                    }
                                    .padding(.horizontal)
                                }

                            case .socialFeed:
                                HorizontalSocialSection(items: section.items)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
                .padding(.bottom, 50)
            }
        }
        .environment(\.layoutDirection, .rightToLeft) // Force Arabic Layout
        .environment(\.colorScheme, .dark)
    }
}

// MARK: - 3. Component Views

// Section 1: The Queue (Hero Card)
struct QueueSectionView: View {
    let item: ContentItem

    var body: some View {
        HStack(spacing: 0) {
            // Content
            VStack(alignment: .leading, spacing: 8) {
                Text(item.title)
                    .font(.headline)
                    .lineLimit(2)
                    .foregroundColor(.white)

                Text(item.subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)

                Spacer()

                Button(action: {}) {
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 44))
                        .foregroundColor(.white)
                }
            }
            .padding()

            Spacer()

            // Stacked Images Art
            ZStack {
                // Background Cards
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 100, height: 120)
                    .rotationEffect(.degrees(10))
                    .offset(x: -20)

                // Main Image
                AsyncImage(url: URL(string: item.imageUrl)) { image in
                    image.resizable().aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray
                }
                .frame(width: 100, height: 120)
                .cornerRadius(8)
                .rotationEffect(.degrees(-5))
            }
            .padding(.trailing, 20)
        }
        .frame(height: 150)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(16)
    }
}

struct TwoRowGridSection: View {
    let items: [ContentItem]

    // Define 2 rows, each 110pt high (fits the ListRowView height)
    let rows = [
        GridItem(.fixed(110), spacing: 8),
        GridItem(.fixed(110), spacing: 8)
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, alignment: .top, spacing: 16) {
                ForEach(items) { item in
                    ListRowView(item: item)
                        .frame(width: 340) // Fixed width is required for HGrid items
                        .background(Color.white.opacity(0.05)) // Optional: slight bg for contrast
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct HorizontalSocialSection: View {
    let items: [ContentItem]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(items) { item in
                    SocialCardView(item: item)
                        .frame(width: 320) // Limit width so you can see the next card peeking
                }
            }
            .padding(.horizontal)
        }
    }
}

// Section 2: Standard Vertical Card
struct StandardCardView: View {
    let item: ContentItem

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Image
            AsyncImage(url: URL(string: item.imageUrl)) { image in
                image.resizable().aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 140, height: 140)
            .cornerRadius(12)
            .overlay(alignment: .topLeading) {
                if let avatar = item.avatarUrl {
                    AsyncImage(url: URL(string: avatar)) { img in
                        img.resizable()
                    } placeholder: { Color.black }
                        .frame(width: 24, height: 24)
                        .clipShape(Circle())
                        .padding(8)
                }
            }

            // Text
            Text(item.title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .lineLimit(2)
                .foregroundColor(.white)
                .frame(width: 140, alignment: .leading)

            Spacer()

            HStack {
                Text(item.subtitle)
                Spacer()
                Text(item.badgeText ?? "")
            }
            .font(.caption2)
            .foregroundColor(.gray)
            .frame(width: 140)
        }
    }
}

// Section 3: List Row
struct ListRowView: View {
    let item: ContentItem

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            AsyncImage(url: URL(string: item.imageUrl)) { image in
                image.resizable().aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 80, height: 80)
            .cornerRadius(8)

            VStack(alignment: .leading, spacing: 6) {
                Text(item.caption ?? "")
                    .font(.caption2)
                    .foregroundColor(.gray)

                Text(item.title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .lineLimit(2)

                HStack {
                    Image(systemName: "list.bullet")
                        .font(.caption2)
                    Text(item.badgeText ?? "")
                        .font(.caption)

                    Spacer()

                    Image(systemName: "ellipsis")
                }
                .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 12)
    }
}

// Section 4: Wide Card
struct WideCardView: View {
    let item: ContentItem

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: item.imageUrl)) { image in
                image.resizable().aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 280, height: 160)
            .clipped()

            // Gradient Overlay
            LinearGradient(colors: [.black.opacity(0.8), .clear], startPoint: .bottom, endPoint: .top)

            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(item.badgeText ?? "")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding()
        }
        .cornerRadius(12)
    }
}

// Section 5: Social Feed
struct SocialCardView: View {
    let item: ContentItem

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                AsyncImage(url: URL(string: item.avatarUrl ?? "")) { img in img.resizable() } placeholder: { Color.gray }
                .frame(width: 36, height: 36).clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(item.subtitle).fontWeight(.bold).foregroundColor(.white)
                    Text(item.caption ?? "").font(.caption).foregroundColor(.gray)
                }
            }
            Text(item.title).font(.subheadline).foregroundColor(.white.opacity(0.9)).lineLimit(2).lineSpacing(4)
            HStack {
                AsyncImage(url: URL(string: item.imageUrl)) { img in img.resizable() } placeholder: { Color.gray }
                .frame(width: 40, height: 40).cornerRadius(6)
                VStack(alignment: .leading) {
                    Text("الإبل من الحنين إلى النجاة").font(.caption).fontWeight(.bold).foregroundColor(.white)
                    Text("1 س و 30 د").font(.caption2).foregroundColor(.gray)
                }
            }.padding(10).background(Color.white.opacity(0.1)).cornerRadius(8)
        }
        .padding()
        .background(Color(UIColor.systemGray6))
        .cornerRadius(16)
    }
}

// MARK: - 4. Mock Data Factory (Arabic Content)
class MockDataFactory {
    static func createSections() -> [SectionData] {
        return [
            // Section 1: Queue
            SectionData(title: "الطابور", type: .queue, items: [
                ContentItem(
                    title: "السفر الصامت وضوضاء الإعلانات وتأثيرها",
                    subtitle: "4 حلقات . 7 س 23 د",
                    caption: nil,
                    imageUrl: "https://images.unsplash.com/photo-1478737270239-2f02b77ac6d5?auto=format&fit=crop&w=300&q=80",
                    avatarUrl: nil,
                    badgeText: nil
                )
            ]),

            // Section 2: Listen Before People (Standard Grid)
            SectionData(title: "اسمع قبل الناس", type: .standardRow, items: [
                ContentItem(
                    title: "كيف تنجو من الغرق في الديون؟",
                    subtitle: "فنجان",
                    caption: nil,
                    imageUrl: "https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?auto=format&fit=crop&w=300&q=80",
                    avatarUrl: "https://randomuser.me/api/portraits/men/32.jpg",
                    badgeText: "22 س 30 د"
                ),
                ContentItem(
                    title: "بولندا من الفقر إلى الغنى",
                    subtitle: "بودكاست جادي",
                    caption: nil,
                    imageUrl: "https://images.unsplash.com/photo-1526304640152-d4619684e484?auto=format&fit=crop&w=300&q=80",
                    avatarUrl: "https://randomuser.me/api/portraits/men/45.jpg",
                    badgeText: "1 س 30 د"
                ),
                ContentItem(
                    title: "قصة شركة أرامكو",
                    subtitle: "أصوات",
                    caption: nil,
                    imageUrl: "https://images.unsplash.com/photo-1519389950473-47ba0277781c?auto=format&fit=crop&w=300&q=80",
                    avatarUrl: "https://randomuser.me/api/portraits/women/44.jpg",
                    badgeText: "45 د"
                )
            ]),

            // Section 3: New Episodes (Vertical List)
            SectionData(title: "الحلقات الجديدة", type: .verticalList, items: [
                ContentItem(
                    title: "د. فيصل الرفاعي | هل استطاع الإنسان مواكبة التطور؟",
                    subtitle: "جادي",
                    caption: "قبل 5 ساعات",
                    imageUrl: "https://images.unsplash.com/photo-1555449372-b883395d9c24?auto=format&fit=crop&w=300&q=80",
                    avatarUrl: nil,
                    badgeText: "1 س 30 د"
                ),
                ContentItem(
                    title: "فخ الاشتراكات الشهرية - The Subscription Trap",
                    subtitle: "Planet Money",
                    caption: "قبل 6 ساعات",
                    imageUrl: "https://images.unsplash.com/photo-1611162617474-5b21e879e113?auto=format&fit=crop&w=300&q=80",
                    avatarUrl: nil,
                    badgeText: "25 د"
                ),
                ContentItem(
                    title: "لماذا نفشل في التخطيط الشخصي؟",
                    subtitle: "خطوة",
                    caption: "قبل يوم واحد",
                    imageUrl: "https://images.unsplash.com/photo-1506784983877-45594efa4cbe?auto=format&fit=crop&w=300&q=80",
                    avatarUrl: nil,
                    badgeText: "50 د"
                )
            ]),

            // Section 4: Recommendations (Wide)
            SectionData(title: "توصيات الفريق", type: .wideCards, items: [
                ContentItem(
                    title: "من ذاكرة تاريخ العرب",
                    subtitle: "",
                    caption: nil,
                    imageUrl: "https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?auto=format&fit=crop&w=600&q=80",
                    avatarUrl: nil,
                    badgeText: "20 حلقة"
                ),
                ContentItem(
                    title: "إذا ودك تضحك",
                    subtitle: "",
                    caption: nil,
                    imageUrl: "https://images.unsplash.com/photo-1531206715517-5c0ba140b2b8?auto=format&fit=crop&w=600&q=80",
                    avatarUrl: nil,
                    badgeText: "10 حلقات"
                )
            ]),

            // Section 5: From the Hall (Social)
            SectionData(title: "من الصالة", type: .socialFeed, items: [
                ContentItem(
                    title: "حلقة شاعرية كالعادة تحرك الأشجان والمشاعر. وعلاقة العرب بالإبل والخيل الأصيلة كعلاقة الغرب بالخنازير.",
                    subtitle: "عبدالرحمن",
                    caption: "قبل 5 ساعات",
                    imageUrl: "https://images.unsplash.com/photo-1550989460-0adf9ea622e2?auto=format&fit=crop&w=300&q=80",
                    avatarUrl: "https://randomuser.me/api/portraits/men/86.jpg",
                    badgeText: nil
                )
            ])
        ]
    }
}

// MARK: - 5. Preview
#Preview {
    HomeWithRealDataView()
}

