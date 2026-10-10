class ProgramDay {
  const ProgramDay(this.name, this.exercises, {this.weekday});

  final String name;
  final List<(String, int)> exercises;
  final int? weekday;
}

class ProgramTemplate {
  const ProgramTemplate(this.id, this.name, this.days);

  final String id;
  final String name;
  final List<ProgramDay> days;
}

const List<ProgramTemplate> kProgramTemplates = [
  // ─── PUSH PULL LEGS (3 NGÀY) ────────────────────────────────────────────────
  ProgramTemplate('ppl', 'Push Pull Legs', [
    ProgramDay('Push', [
      ('Barbell Bench Press', 4),
      ('Incline Dumbbell Press', 3),
      ('Overhead Press', 3),
      ('Lateral Raise', 3),
      ('Triceps Pushdown', 3),
    ], weekday: 1),
    ProgramDay('Pull', [
      ('Pull Up', 4),
      ('Barbell Row', 4),
      ('Lat Pulldown', 3),
      ('Face Pull', 3),
      ('Barbell Curl', 3),
      ('Hammer Curl', 2),
    ], weekday: 3),
    ProgramDay('Legs', [
      ('Barbell Squat', 4),
      ('Romanian Deadlift', 4),
      ('Leg Extension', 3),
      ('Leg Curl', 3),
      ('Standing Calf Raise', 4),
    ], weekday: 5),
  ]),

  // ─── GIÁO ÁN GIẢM CÂN · ĐỐT MỠ NHANH (CHO NGƯỜI THỪA CÂN / CUT) ─────────
  ProgramTemplate('weight_loss_cut', 'Giảm Cân & Đốt Mỡ Nhanh (Fat Burn)', [
    ProgramDay('Ngày 1 · Đốt Mỡ Toàn Thân & Core', [
      ('Leg Press', 4),
      ('Incline Dumbbell Press', 4),
      ('Lat Pulldown', 4),
      ('Lateral Raise', 3),
      ('Plank', 3),
    ], weekday: 1),
    ProgramDay('Ngày 2 · Thân Trên & Nhịp Tim Cao', [
      ('Seated Cable Row', 4),
      ('Cable Fly', 4),
      ('Dumbbell Standing Overhead Press', 3),
      ('Hammer Curl', 3),
      ('Triceps Pushdown', 3),
      ('Plank', 3),
    ], weekday: 3),
    ProgramDay('Ngày 3 · Thân Dưới Săn Chắc & Calo', [
      ('Leg Press', 4),
      ('Romanian Deadlift', 4),
      ('Leg Extension', 3),
      ('Leg Curl', 3),
      ('Standing Calf Raise', 4),
      ('Plank', 3),
    ], weekday: 5),
  ]),

  // ─── GIÁO ÁN TĂNG CÂN & TĂNG KHỐI CƠ (CHO NGƯỜI THIẾU CÂN / BULK) ─────────
  ProgramTemplate('mass_gain_bulk', 'Tăng Cân & Xây Khối Cơ (Mass Building)', [
    ProgramDay('Ngày 1 · Ngực & Tay Sau Khối Lượng', [
      ('Barbell Bench Press', 4),
      ('Incline Dumbbell Press', 4),
      ('Cable Fly', 3),
      ('Triceps Pushdown', 4),
    ], weekday: 1),
    ProgramDay('Ngày 2 · Lưng Xô & Tay Trước Dày Cơ', [
      ('Deadlift', 3),
      ('Barbell Row', 4),
      ('Lat Pulldown', 4),
      ('Barbell Curl', 4),
      ('Hammer Curl', 3),
    ], weekday: 2),
    ProgramDay('Ngày 3 · Chân Mông To Toàn Diện', [
      ('Barbell Squat', 4),
      ('Leg Press', 4),
      ('Romanian Deadlift', 4),
      ('Standing Calf Raise', 4),
    ], weekday: 4),
    ProgramDay('Ngày 4 · Vai Vạm Vỡ & Bắp Tay', [
      ('Overhead Press', 4),
      ('Lateral Raise', 4),
      ('Face Pull', 3),
      ('Barbell Curl', 3),
      ('Triceps Pushdown', 3),
    ], weekday: 5),
  ]),

  // ─── GIÁO ÁN CHO NGƯỜI MỚI (BEGINNER FRIENDLY · AN TOÀN & DỄ TẬP) ─────────
  ProgramTemplate('beginner_friendly', 'Người Mới Bắt Đầu · Toàn Thân An Toàn', [
    ProgramDay('Ngày 1 · Chân & Ngực (Máy & Tạ đơn)', [
      ('Leg Press', 3),
      ('Incline Dumbbell Press', 3),
      ('Lat Pulldown', 3),
      ('Dumbbell Standing Overhead Press', 3),
      ('Hammer Curl', 2),
      ('Plank', 2),
    ], weekday: 1),
    ProgramDay('Ngày 2 · Lưng & Vai (Cáp & Tạ đơn)', [
      ('Seated Cable Row', 3),
      ('Cable Fly', 3),
      ('Lateral Raise', 3),
      ('Triceps Pushdown', 3),
      ('Standing Calf Raise', 3),
      ('Plank', 2),
    ], weekday: 3),
    ProgramDay('Ngày 3 · Thể Lực Toàn Thân (Máy tập)', [
      ('Leg Extension', 3),
      ('Leg Curl', 3),
      ('Lat Pulldown', 3),
      ('Incline Dumbbell Press', 3),
      ('Hammer Curl', 2),
      ('Triceps Pushdown', 2),
    ], weekday: 5),
  ]),

  // ─── FULL BODY TRUYỀN THỐNG (3 NGÀY) ───────────────────────────────────────
  ProgramTemplate('fullbody', 'Full Body', [
    ProgramDay('Full Body', [
      ('Barbell Squat', 3),
      ('Barbell Bench Press', 3),
      ('Barbell Row', 3),
      ('Overhead Press', 3),
      ('Romanian Deadlift', 3),
      ('Plank', 3),
    ], weekday: 1),
    ProgramDay('Full Body', [
      ('Barbell Squat', 3),
      ('Barbell Bench Press', 3),
      ('Barbell Row', 3),
      ('Overhead Press', 3),
      ('Romanian Deadlift', 3),
      ('Plank', 3),
    ], weekday: 3),
    ProgramDay('Full Body', [
      ('Barbell Squat', 3),
      ('Barbell Bench Press', 3),
      ('Barbell Row', 3),
      ('Overhead Press', 3),
      ('Romanian Deadlift', 3),
      ('Plank', 3),
    ], weekday: 5),
  ]),

  // ─── FULL BODY PHÂN KỲ A/B (TỐI ƯU CƠ BẮP) ──────────────────────────────────
  ProgramTemplate('fullbody_ab', 'Full Body A/B (Periodized)', [
    ProgramDay('Full Body A · Squat & Chest', [
      ('Barbell Squat', 4),
      ('Barbell Bench Press', 4),
      ('Barbell Row', 4),
      ('Overhead Press', 3),
      ('Standing Calf Raise', 4),
      ('Plank', 3),
    ], weekday: 1),
    ProgramDay('Full Body B · Deadlift & Pull', [
      ('Romanian Deadlift', 4),
      ('Incline Dumbbell Press', 4),
      ('Pull Up', 4),
      ('Dumbbell Standing Overhead Press', 3),
      ('Leg Press', 3),
      ('Hanging Leg Raise', 3),
    ], weekday: 3),
    ProgramDay('Full Body A2 · Quad & Arms', [
      ('Front Squat', 3),
      ('Barbell Bench Press', 3),
      ('Lat Pulldown', 3),
      ('Lateral Raise', 4),
      ('Barbell Curl', 3),
      ('Triceps Pushdown', 3),
    ], weekday: 5),
  ]),


  // ─── PUSH PULL LEGS 6 NGÀY (HYPERTROPHY SPLIT VĐV) ──────────────────────────
  ProgramTemplate('ppl_6day', 'PPL 6-Day Hypertrophy', [
    ProgramDay('Push A · Chest Focus', [
      ('Barbell Bench Press', 4),
      ('Incline Dumbbell Press', 4),
      ('Overhead Press', 3),
      ('Cable Fly', 3),
      ('Triceps Pushdown', 4),
    ], weekday: 1),
    ProgramDay('Pull A · Back Width & Bi', [
      ('Deadlift', 3),
      ('Pull Up', 4),
      ('Barbell Row', 4),
      ('Face Pull', 3),
      ('Barbell Curl', 4),
    ], weekday: 2),
    ProgramDay('Legs A · Quad & Calves', [
      ('Barbell Squat', 4),
      ('Leg Press', 4),
      ('Leg Extension', 3),
      ('Leg Curl', 3),
      ('Standing Calf Raise', 4),
    ], weekday: 3),
    ProgramDay('Push B · Shoulder & Upper Chest', [
      ('Dumbbell Standing Overhead Press', 4),
      ('Incline Dumbbell Press', 4),
      ('Lateral Raise', 4),
      ('Triceps Dip', 3),
      ('Skull Crushers', 3),
    ], weekday: 4),
    ProgramDay('Pull B · Back Thickness & Rear Delt', [
      ('Barbell Row', 4),
      ('Lat Pulldown', 4),
      ('Seated Cable Row', 3),
      ('Face Pull', 3),
      ('Hammer Curl', 4),
    ], weekday: 5),
    ProgramDay('Legs B · Hamstrings & Glutes', [
      ('Romanian Deadlift', 4),
      ('Barbell Squat', 3),
      ('Leg Curl', 4),
      ('Leg Extension', 3),
      ('Standing Calf Raise', 4),
    ], weekday: 6),
  ]),

  // ─── UPPER LOWER (4 NGÀY) ───────────────────────────────────────────────────
  ProgramTemplate('upperlower', 'Upper Lower', [
    ProgramDay('Upper', [
      ('Barbell Bench Press', 4),
      ('Barbell Row', 4),
      ('Overhead Press', 3),
      ('Lat Pulldown', 3),
      ('Barbell Curl', 3),
      ('Triceps Pushdown', 3),
    ], weekday: 1),
    ProgramDay('Lower', [
      ('Barbell Squat', 4),
      ('Romanian Deadlift', 3),
      ('Leg Press', 3),
      ('Leg Curl', 3),
      ('Standing Calf Raise', 4),
    ], weekday: 2),
    ProgramDay('Upper', [
      ('Incline Dumbbell Press', 4),
      ('Pull Up', 4),
      ('Dumbbell Standing Overhead Press', 3),
      ('Seated Cable Row', 3),
      ('Hammer Curl', 3),
      ('Triceps Dip', 3),
    ], weekday: 4),
    ProgramDay('Lower', [
      ('Deadlift', 3),
      ('Front Squat', 3),
      ('Leg Extension', 3),
      ('Leg Curl', 3),
      ('Standing Calf Raise', 4),
    ], weekday: 5),
  ]),

  // ─── ABCD SPLIT (4 NGÀY) ────────────────────────────────────────────────────
  ProgramTemplate('abcd', 'ABCD Split', [
    ProgramDay('A · Chest & Triceps', [
      ('Barbell Bench Press', 4),
      ('Incline Dumbbell Press', 3),
      ('Cable Fly', 3),
      ('Triceps Pushdown', 3),
      ('Skull Crushers', 3),
    ], weekday: 1),
    ProgramDay('B · Back & Biceps', [
      ('Pull Up', 4),
      ('Barbell Row', 4),
      ('Lat Pulldown', 3),
      ('Face Pull', 3),
      ('Barbell Curl', 3),
      ('Hammer Curl', 3),
    ], weekday: 2),
    ProgramDay('C · Legs', [
      ('Barbell Squat', 4),
      ('Romanian Deadlift', 3),
      ('Leg Press', 3),
      ('Leg Curl', 3),
      ('Standing Calf Raise', 4),
    ], weekday: 4),
    ProgramDay('D · Shoulders & Abs', [
      ('Overhead Press', 4),
      ('Lateral Raise', 4),
      ('Dumbbell Standing Overhead Press', 3),
      ('Hanging Leg Raise', 3),
      ('Plank', 3),
    ], weekday: 5),
  ]),

  // ─── ABCDE SPLIT (5 NGÀY) ───────────────────────────────────────────────────
  ProgramTemplate('abcde', 'ABCDE Split', [
    ProgramDay('A · Chest', [
      ('Barbell Bench Press', 4),
      ('Incline Dumbbell Press', 4),
      ('Cable Fly', 3),
      ('Triceps Dip', 3),
    ], weekday: 1),
    ProgramDay('B · Back', [
      ('Deadlift', 3),
      ('Pull Up', 4),
      ('Barbell Row', 4),
      ('Seated Cable Row', 3),
      ('Face Pull', 3),
    ], weekday: 2),
    ProgramDay('C · Legs', [
      ('Barbell Squat', 4),
      ('Leg Press', 4),
      ('Leg Extension', 3),
      ('Leg Curl', 3),
      ('Standing Calf Raise', 4),
    ], weekday: 3),
    ProgramDay('D · Shoulders', [
      ('Overhead Press', 4),
      ('Dumbbell Standing Overhead Press', 3),
      ('Lateral Raise', 4),
      ('Face Pull', 3),
    ], weekday: 4),
    ProgramDay('E · Arms', [
      ('Barbell Curl', 4),
      ('Skull Crushers', 4),
      ('Hammer Curl', 3),
      ('Triceps Pushdown', 3),
    ], weekday: 5),
  ]),

  // ─── STRONGLIFTS 5×5 ────────────────────────────────────────────────────────
  ProgramTemplate('stronglifts', 'StrongLifts 5×5', [
    ProgramDay('Workout A', [
      ('Barbell Squat', 5),
      ('Barbell Bench Press', 5),
      ('Barbell Row', 5),
    ], weekday: 1),
    ProgramDay('Workout B', [
      ('Barbell Squat', 5),
      ('Overhead Press', 5),
      ('Deadlift', 1),
    ], weekday: 3),
  ]),

  // ─── STARTING STRENGTH ──────────────────────────────────────────────────────
  ProgramTemplate('startingstrength', 'Starting Strength', [
    ProgramDay('Workout A', [
      ('Barbell Squat', 3),
      ('Barbell Bench Press', 3),
      ('Deadlift', 1),
    ], weekday: 1),
    ProgramDay('Workout B', [
      ('Barbell Squat', 3),
      ('Overhead Press', 3),
      ('Barbell Row', 3),
    ], weekday: 3),
  ]),

  // ─── HOME (NO KIT) ──────────────────────────────────────────────────────────
  ProgramTemplate('home', 'No Kit', [
    ProgramDay('Home A', [
      ('Push Up', 3),
      ('Pull Up', 3),
      ('Bodyweight Squat', 3),
      ('Plank', 3),
    ], weekday: 2),
    ProgramDay('Home B', [
      ('Triceps Dip', 3),
      ('Chin Up', 3),
      ('Lunge', 3),
      ('Hanging Leg Raise', 3),
    ], weekday: 5),
  ]),
];
