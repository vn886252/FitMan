const String kDefaultName = 'FitMan';
const String kDefaultHandle = 'fitman';

class Profile {
  Profile({
    this.name = kDefaultName,
    this.sex = 'male',
    this.age = 28,
    this.heightCm = 175,
    this.weightKg = 75,
    this.activity = 1.55,
    this.weeklyGoal = 4,
    this.fitnessGoal = 'bulk',
    this.experienceLevel = 'beginner',
    this.photo = '',
    this.handle = '',
    this.badge = 'blue',
    this.banner = '',
    this.since,
  });

  String name;
  String sex;
  int age;
  double heightCm;
  double weightKg;
  double activity;
  int weeklyGoal;
  String fitnessGoal; // 'bulk', 'cut', 'maintain'
  String experienceLevel; // 'beginner', 'intermediate', 'advanced'
  String photo;
  String handle;
  String badge;
  String banner;
  DateTime? since;

  bool get isBeginner => experienceLevel == 'beginner';
  bool get isIntermediate => experienceLevel == 'intermediate';
  bool get isAdvanced => experienceLevel == 'advanced';

  String get experienceTitle {
    switch (experienceLevel) {
      case 'advanced':
        return 'Chuyên nghiệp (2+ năm)';
      case 'intermediate':
        return 'Đã có kinh nghiệm (6 tháng - 2 năm)';
      case 'beginner':
      default:
        return 'Người mới bắt đầu (< 6 tháng)';
    }
  }

  /// Tính toán chỉ số BMR theo công thức Mifflin-St Jeor
  double get bmr {
    final s = sex.toLowerCase() == 'female' ? -161.0 : 5.0;
    return (10.0 * weightKg) + (6.25 * heightCm) - (5.0 * age) + s;
  }

  /// Tổng năng lượng tiêu thụ hàng ngày (TDEE)
  double get tdee => bmr * (activity > 0 ? activity : 1.55);

  /// Mục tiêu Calories theo mục tiêu thể hình
  int get targetCalories {
    switch (fitnessGoal) {
      case 'cut':
        return (tdee - 450).round();
      case 'maintain':
        return tdee.round();
      case 'bulk':
      default:
        return (tdee + 350).round();
    }
  }

  /// Mục tiêu Protein (g) cho thể hình: 2.0g/kg
  int get targetProtein => (weightKg * 2.0).round().clamp(100, 300);

  /// Mục tiêu Fat (g): ~25% tổng calo (9 kcal / g)
  int get targetFat => ((targetCalories * 0.25) / 9.0).round();

  /// Mục tiêu Carbs (g): Phần calo còn lại (4 kcal / g)
  int get targetCarbs {
    final rem = targetCalories - (targetProtein * 4) - (targetFat * 9);
    return (rem / 4.0).round().clamp(50, 600);
  }

  /// Nước uống mục tiêu hàng ngày (lít)
  double get targetWaterLiters => (weightKg * 0.04).clamp(2.5, 4.5);

  Map<String, dynamic> toJson() => {
        'name': name,
        'sex': sex,
        'age': age,
        'h': heightCm,
        'w': weightKg,
        'act': activity,
        'goal': weeklyGoal,
        'fitGoal': fitnessGoal,
        'exp': experienceLevel,
        if (photo.isNotEmpty) 'photo': photo,
        if (handle.isNotEmpty) 'handle': handle,
        'badge': badge,
        if (banner.isNotEmpty) 'banner': banner,
        if (since != null) 'since': since!.toIso8601String(),
      };
  factory Profile.fromJson(Map<String, dynamic> j) => Profile(
        name: (j['name'] as String?) ?? kDefaultName,
        sex: (j['sex'] as String?) ?? 'male',
        age: (j['age'] as num?)?.toInt() ?? 28,
        heightCm: (j['h'] as num?)?.toDouble() ?? 175,
        weightKg: (j['w'] as num?)?.toDouble() ?? 75,
        activity: (j['act'] as num?)?.toDouble() ?? 1.55,
        weeklyGoal: (j['goal'] as num?)?.toInt() ?? 4,
        fitnessGoal: (j['fitGoal'] as String?) ?? 'bulk',
        experienceLevel: (j['exp'] as String?) ?? 'beginner',
        photo: (j['photo'] as String?) ?? '',
        handle: (j['handle'] as String?) ?? '',
        badge: (j['badge'] as String?) ?? 'blue',
        banner: (j['banner'] as String?) ?? '',
        since: DateTime.tryParse((j['since'] as String?) ?? ''),
      );
}
