class Property {
  final String id;
  final String title;
  final String address;
  final int rent;
  final String layout;
  final double size;
  final int builtYear;
  final String imageUrl;
  final List<String> tags;
  final String access;
  final String description;

  Property({
    required this.id,
    required this.title,
    required this.address,
    required this.rent,
    required this.layout,
    required this.size,
    required this.builtYear,
    required this.imageUrl,
    required this.tags,
    required this.access,
    required this.description,
  });

  static List<Property> getDummyProperties() {
    return [
      Property(
        id: '1',
        title: 'サニーサイド代々木公園',
        address: '東京都渋谷区代々木5丁目',
        rent: 145000,
        layout: '1LDK',
        size: 40.5,
        builtYear: 5,
        imageUrl: 'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?auto=format&fit=crop&w=800&q=80',
        tags: ['ペット相談', '大型犬可', 'ドッグラン近'],
        access: '千代田線 代々木公園駅 徒歩5分',
        description: '代々木公園ドッグランまで徒歩5分の好立地！大型犬も相談可能な希少物件です。',
      ),
      Property(
        id: '2',
        title: 'メゾン・ド・シャノワール',
        address: '東京都世田谷区三軒茶屋',
        rent: 98000,
        layout: '1K',
        size: 25.0,
        builtYear: 12,
        imageUrl: 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?auto=format&fit=crop&w=800&q=80',
        tags: ['猫2匹可', 'キャットウォーク付'],
        access: '田園都市線 三軒茶屋駅 徒歩8分',
        description: '猫ちゃん専用のキャットウォークが壁面に設置済み。南向きで日向ぼっこに最適なお部屋です。',
      ),
      // 他のダミーデータ...
    ];
  }
}