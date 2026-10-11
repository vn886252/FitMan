// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get languageName => 'Tiếng Việt';

  @override
  String vsLastMonthLabel(String pct) {
    return '$pct% vs last month';
  }

  @override
  String levelStreakLabel(int level, String streak) {
    return 'Cấp $level · Chuỗi $streak';
  }

  @override
  String get save => 'LƯU';

  @override
  String get cancel => 'HỦY';

  @override
  String get cancelCaps => 'HỦY';

  @override
  String get deleteCaps => 'XÓA';

  @override
  String get done => 'XONG';

  @override
  String get set => 'ĐẶT';

  @override
  String get home => 'TRANG CHỦ';

  @override
  String get progress => 'TIẾN ĐỘ';

  @override
  String get exercises => 'BÀI TẬP';

  @override
  String get settings => 'Cài đặt';

  @override
  String get today => 'Hôm nay';

  @override
  String get thisWeek => 'TUẦN NÀY';

  @override
  String get recommended => 'GỢI Ý CHO BẠN';

  @override
  String get goal => 'MỤC TIÊU';

  @override
  String get volume => 'KHỐI LƯỢNG';

  @override
  String get setsToday => 'HIỆP HÔM NAY';

  @override
  String get prs => 'KỶ LỤC CÁ NHÂN';

  @override
  String get todaysFocus => 'TRỌNG TÂM HÔM NAY';

  @override
  String get todaysRoutine => 'GIÁO ÁN HÔM NAY';

  @override
  String get startWorkout => 'BẮT ĐẦU BUỔI TẬP';

  @override
  String get routines => 'Giáo án';

  @override
  String get tools => 'Công cụ';

  @override
  String get firstSessionHint => 'Chọn nhóm cơ và ghi lại buổi tập đầu tiên của bạn';

  @override
  String exerciseCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(n, locale: localeName, other: '$n bài tập');
    return '$_temp0';
  }

  @override
  String get pushDay => 'NGÀY ĐẨY (PUSH)';

  @override
  String get pullDay => 'NGÀY KÉO (PULL)';

  @override
  String get legDay => 'NGÀY CHÂN (LEGS)';

  @override
  String get pushFocus => 'Ngực · Vai · Tay sau';

  @override
  String get pullFocus => 'Lưng · Tay trước · Cầu vai';

  @override
  String get legFocus => 'Đùi trước · Đùi sau · Mông';

  @override
  String get train => 'TẬP LUYỆN';

  @override
  String get step1 => 'BƯỚC 1 / 2';

  @override
  String get step2 => 'BƯỚC 2 / 2';

  @override
  String get chooseFocus => 'CHỌN NHÓM CƠ TẬP TRUNG';

  @override
  String get buildSession => 'LÊN BUỔI TẬP';

  @override
  String get tapMuscles => 'Chạm vào các nhóm cơ bạn muốn tập — mặt trước và sau.';

  @override
  String get noMusclesYet => 'Chưa chọn nhóm cơ nào — chạm vào cơ thể để bắt đầu.';

  @override
  String get continueBtn => 'TIẾP TỤC';

  @override
  String get nothingForFocus => 'Chưa có bài tập cho nhóm cơ này';

  @override
  String get goBackPick => 'Quay lại và chọn nhóm cơ có sẵn bài tập trong thư viện.';

  @override
  String pickedHint(int n) {
    return 'FitMan đã gợi ý buổi tập cho bạn — chạm để thêm hoặc bớt trong số $n bài.';
  }

  @override
  String get pickAnExercise => 'CHỌN BÀI TẬP';

  @override
  String get searchAllExercises => 'Tìm kiếm bài tập bất kỳ…';

  @override
  String get noExercisesMatch => 'Không tìm thấy bài tập phù hợp';

  @override
  String get createItInstead => 'Tạo bài tập mới theo ý bạn';

  @override
  String startCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(n, locale: localeName, other: '$n BÀI TẬP');
    return 'BẮT ĐẦU · $_temp0';
  }

  @override
  String get inProgress => 'ĐANG TẬP';

  @override
  String get paused => 'TẠM DỪNG';

  @override
  String get last => 'GẦN NHẤT';

  @override
  String get rest => 'NGHỈ';

  @override
  String get skip => 'BỎ QUA';

  @override
  String get addSet => 'Thêm hiệp';

  @override
  String get finishSession => 'KẾT THÚC BUỔI TẬP';

  @override
  String get setDone => 'HOÀN THÀNH HIỆP';

  @override
  String get nextExercise => 'Bài tập tiếp theo';

  @override
  String get skipExercise => 'Bỏ qua bài tập này?';

  @override
  String skipExerciseBody(String name) {
    return 'Bạn chưa đánh dấu hoàn thành hiệp nào, nên sẽ không lưu dữ liệu cho bài \"$name\".';
  }

  @override
  String get dropExerciseAction => 'Bỏ bài tập';

  @override
  String get restOff => 'Tắt';

  @override
  String get setCol => '#';

  @override
  String get repsCol => 'SỐ LẦN';

  @override
  String weightCol(String unit) {
    return 'MỨC TẠ';
  }

  @override
  String get repsTitle => 'SỐ LẦN';

  @override
  String weightTitle(String unit) {
    return 'MỨC TẠ ($unit)';
  }

  @override
  String get sessionComplete => 'ĐÃ LƯU BUỔI TẬP';

  @override
  String get finishHeadlinePr => 'Kỷ lục mới được thiết lập!';

  @override
  String get finishHeadlineGoal => 'Đã hoàn thành mục tiêu hôm nay!';

  @override
  String get finishHeadlineStreak => 'Giữ vững chuỗi tập luyện';

  @override
  String get finishHeadlineDefault => 'Hoàn thành xuất sắc!';

  @override
  String finishBodyPr(int prs) {
    String _temp0 = intl.Intl.pluralLogic(prs, locale: localeName, other: '$prs bài tập');
    return 'Bạn đã nâng mức tạ kỷ lục mới ở $_temp0. Đã được lưu vào hồ sơ cá nhân.';
  }

  @override
  String get finishBodyGoal => 'Bạn đã hoàn thành đủ số buổi tập đặt ra trong tuần này.';

  @override
  String finishBodyStreak(int streak) {
    return '$streak ngày liên tiếp. Kiên trì là chìa khóa của thành công.';
  }

  @override
  String get finishBodyDefault => 'Đã ghi nhận buổi tập. Sự kiên trì sẽ đưa bạn đến đích.';

  @override
  String get vsLastTime => 'SO VỚI LẦN TRƯỚC';

  @override
  String get firstTime => 'Lần đầu ghi nhận';

  @override
  String prCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(n, locale: localeName, other: '$n kỷ lục mới');
    return '$_temp0';
  }

  @override
  String get saveAndExit => 'LƯU VÀ THOÁT';

  @override
  String get duration => 'THỜI GIAN';

  @override
  String get setsCaps => 'HIỆP';

  @override
  String exerciseXofY(int i, int n) {
    return 'BÀI $i / $n';
  }

  @override
  String get decrease => 'Giảm';

  @override
  String get increase => 'Tăng';

  @override
  String markSet(int n) {
    return 'Đánh dấu hiệp $n xong';
  }

  @override
  String get pauseWorkout => 'TẠM DỪNG';

  @override
  String get resumeWorkout => 'TIẾP TỤC TẬP';

  @override
  String get discardTitle => 'Hủy bỏ buổi tập?';

  @override
  String get discardBody => 'Các hiệp tập của buổi này sẽ không được lưu.';

  @override
  String get keepTraining => 'Tiếp tục tập';

  @override
  String get discard => 'Hủy bỏ';

  @override
  String get notifRestChannel => 'Đồng hồ đếm giờ nghỉ';

  @override
  String get notifRestChannelWhy => 'Báo chuông và rung khi hết thời gian nghỉ giữa hiệp';

  @override
  String get notifAlertChannel => 'Hết giờ nghỉ (Cảnh báo)';

  @override
  String get notifAlertChannelWhy => 'Hiện banner ngay khoảnh khắc hết giờ nghỉ';

  @override
  String get restOverTitle => 'Hết giờ nghỉ!';

  @override
  String get restOverBody => 'Quay lại thôi — hiệp tiếp theo đang chờ bạn.';

  @override
  String get totalVolume30d => 'TỔNG KHỐI LƯỢNG · 30 NGÀY';

  @override
  String get volumeCumulative => 'Tổng cộng số kg bạn đã nâng';

  @override
  String get volumeChartEmpty => 'Ghi nhận buổi tập và đường cong tiến trình sẽ bắt đầu tại đây';

  @override
  String get weekRhythm => 'NHỊP ĐIỆU TUẦN';

  @override
  String get weekRhythmHint => 'Các ngày trong tuần bạn thực sự đến phòng tập.';

  @override
  String weekRhythmBest(String day) {
    return '$day is your day';
  }

  @override
  String get weekRhythmEmpty => 'Ghi nhận buổi tập và lịch tuần của bạn sẽ hình thành tại đây.';

  @override
  String get allTime => 'TOÀN BỘ THỜI GIAN';

  @override
  String get allTimeSessions => 'BUỔI TẬP';

  @override
  String get allTimeTime => 'THỜI GIAN';

  @override
  String get allTimeVolume => 'KHỐI LƯỢNG';

  @override
  String get allTimeSets => 'HIỆP TẬP';

  @override
  String allTimeAvg(String time) {
    return '$time a session on average';
  }

  @override
  String hoursShort(int n, Object h) {
    return '${h}h';
  }

  @override
  String get consistency => 'TÍNH ĐỀU ĐẶN';

  @override
  String sessionsLogged(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n sessions logged',
      one: '$n session logged',
    );
    return '$_temp0';
  }

  @override
  String streakDays(int n) {
    return 'Chuỗi ngày tập';
  }

  @override
  String get bodyweight => 'CÂN NẶNG CƠ THỂ';

  @override
  String get notLoggedYet => 'Chưa ghi nhận';

  @override
  String get logShort => '+ GHI NHẬN';

  @override
  String get logBodyweight => 'GHI NHẬN CÂN NẶNG';

  @override
  String get trackWeight => 'Theo dõi cân nặng theo thời gian';

  @override
  String get muscleMap => 'BẢN ĐỒ CƠ BẮP';

  @override
  String get days7 => '7 NGÀY';

  @override
  String get days30 => '30 NGÀY';

  @override
  String get heatLow => 'Chưa tập';

  @override
  String get heatHigh => 'Đạt khối lượng';

  @override
  String get muscleMapEmpty => 'Ghi nhận buổi tập và các nhóm cơ trên cơ thể sẽ sáng lên tại đây.';

  @override
  String get muscleMapHint => 'Chạm vào một nhóm cơ để xem chi tiết buổi tập.';

  @override
  String muscleMapBehind(String names) {
    return 'Cần tập thêm: $names';
  }

  @override
  String ofTarget(int pct) {
    return '$pct% of target';
  }

  @override
  String get muscleSplit => 'PHÂN BỐ NHÓM CƠ';

  @override
  String get splitEmpty => 'Tập luyện để xem khối lượng tạ phân bổ giữa các nhóm cơ.';

  @override
  String get personalRecords => 'KỶ LỤC CÁ NHÂN (PR)';

  @override
  String get prEmpty => 'Kỷ lục sức mạnh sẽ xuất hiện tại đây khi bạn hoàn thành các hiệp tập.';

  @override
  String get strength1rm => 'SỨC MẠNH · ƯỚC TÍNH 1RM';

  @override
  String get strengthEmpty => 'Tập bài tập này 2 lần và đường cong sức mạnh sẽ hiển thị tại đây.';

  @override
  String oneRmEst(String w) {
    return 'Ước tính 1RM: $w';
  }

  @override
  String get restDayShort => 'Nghỉ ngơi';

  @override
  String get restDay => 'Hôm nay là ngày nghỉ — cơ bắp đang phục hồi và phát triển.';

  @override
  String get delete => 'Xóa';

  @override
  String get deleteEntry => 'Xóa mục này?';

  @override
  String deleteEntryBody(String name) {
    return '\"$name\" sẽ bị xóa khỏi ngày này, cùng với các kỷ lục và biểu đồ liên quan.';
  }

  @override
  String get bodyweightHistory => 'LỊCH SỬ CÂN NẶNG';

  @override
  String get noBodyweightYet => 'Chưa có dữ liệu cân nặng nào.';

  @override
  String get exercisesCaps => 'BÀI TẬP';

  @override
  String get timeCaps => 'THỜI GIAN';

  @override
  String libraryCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n exercises in your library',
      one: '$n exercise in your library',
    );
    return '$_temp0';
  }

  @override
  String get searchExercises => 'Tìm kiếm bài tập…';

  @override
  String get muscleFilter => 'NHÓM CƠ';

  @override
  String get levelFilter => 'TRÌNH ĐỘ';

  @override
  String get newExercise => 'BÀI TẬP MỚI';

  @override
  String get exerciseName => 'Tên bài tập';

  @override
  String get equipmentLabel => 'THIẾT BỊ';

  @override
  String get addExercise => 'THÊM BÀI TẬP';

  @override
  String get advanced => 'NÂNG CAO';

  @override
  String get demoMedia => 'HÌNH ẢNH / VIDEO MẪU';

  @override
  String get addMedia => 'Thêm tệp media';

  @override
  String get mediaHint => 'Hình ảnh, GIF hoặc video hướng dẫn';

  @override
  String get changeMedia => 'Thay đổi';

  @override
  String get videoSelected => 'Đã chọn video';

  @override
  String get favouritesOnly => 'Mục yêu thích';

  @override
  String get noFavouritesYet => 'Chưa có bài tập yêu thích';

  @override
  String get noFavouritesHint => 'Chạm vào biểu tượng ngôi sao ở bài tập để lưu vào danh sách này.';

  @override
  String get clearFilters => 'Xóa bộ lọc';

  @override
  String get noExercisesFound => 'Không tìm thấy bài tập nào';

  @override
  String get noExercisesHint => 'Hãy thử tìm bằng từ khóa khác hoặc xóa bộ lọc thiết bị/nhóm cơ.';

  @override
  String get personalRecord => 'KỶ LỤC CÁ NHÂN';

  @override
  String get history => 'LỊCH SỬ';

  @override
  String get noHistory => 'Chưa có buổi tập nào. Hãy tập bài này để bắt đầu ghi nhận lịch sử.';

  @override
  String get notes => 'GHI CHÚ';

  @override
  String get notePlaceholder => 'Kỹ thuật, cảm giác cơ, mức tạ mục tiêu lần tới…';

  @override
  String showAllNotes(int n) {
    return 'Xem tất cả $n ghi chú';
  }

  @override
  String notHere(String gear, String place) {
    return 'Không có $gear tại $place';
  }

  @override
  String get notHereWhy => 'Hãy đổi sang bài tập sử dụng dụng cụ có sẵn tại địa điểm này.';

  @override
  String get altHere => 'BÀI TẬP CÓ THỂ TẬP TẠI ĐÂY';

  @override
  String get places => 'ĐỊA ĐIỂM TẬP';

  @override
  String get placesShort => 'Địa điểm';

  @override
  String get placesHint => 'Chọn thiết bị có ở từng nơi để thư viện chỉ hiện bài tập bạn thực sự tập được.';

  @override
  String get placeAll => 'Mọi nơi';

  @override
  String get placeNew => 'Địa điểm mới';

  @override
  String get placeNameLabel => 'TÊN ĐỊA ĐIỂM';

  @override
  String get placeNamePlaceholder => 'Phòng gym, ở nhà, công viên…';

  @override
  String get placeGearLabel => 'THIẾT BỊ CÓ SẴN';

  @override
  String placeGearCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n kinds of kit',
      one: '1 kind of kit',
      zero: 'Nothing ticked',
    );
    return '$_temp0';
  }

  @override
  String placeExercises(int n) {
    return '$n exercises here';
  }

  @override
  String get placeEmptyTitle => 'Tập luyện ở bất cứ đâu';

  @override
  String get placeEmptyBody =>
      'Địa điểm là danh sách dụng cụ bạn có. Chọn một mẫu để bắt đầu và chỉnh sửa sau.';

  @override
  String get placeDeleteTitle => 'Xóa địa điểm';

  @override
  String get placeDeleteBody =>
      'Chỉ xóa địa điểm — các bài tập và dữ liệu buổi tập của bạn vẫn được giữ nguyên.';

  @override
  String get placeGym => 'Phòng Gym';

  @override
  String get placeHome => 'Tại nhà';

  @override
  String get placeOutdoors => 'Ngoài trời';

  @override
  String get placeFilterLabel => 'ĐỊA ĐIỂM';

  @override
  String get noGearOnly => 'Không cần dụng cụ';

  @override
  String placeActive(String name) {
    return 'Đang tập tại $name';
  }

  @override
  String get journal => 'Nhật ký';

  @override
  String noteCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(n, locale: localeName, other: '$n ghi chú');
    return '$_temp0';
  }

  @override
  String get noteKindNote => 'Ghi chú';

  @override
  String get noteKindPlan => 'Kế hoạch';

  @override
  String get noteKindDone => 'Thành tích';

  @override
  String get noteKindPain => 'Đau / Chấn thương';

  @override
  String get noteFilterAll => 'Tất cả';

  @override
  String get newNote => 'Viết ghi chú mới';

  @override
  String get editNote => 'Chỉnh sửa ghi chú';

  @override
  String get addNote => 'THÊM GHI CHÚ';

  @override
  String get noteEmptyTitle => 'Chưa có ghi chú nào';

  @override
  String get noteEmptyBody =>
      'Ghi lại mẹo kỹ thuật, kế hoạch lần sau, cảm nhận buổi tập — kèm ảnh hoặc video.';

  @override
  String get noteNoneForExercise => 'Chưa có ghi chú nào cho bài tập này.';

  @override
  String get noteKindLabel => 'LOẠI GHI CHÚ';

  @override
  String get noteTextLabel => 'GHI CHÚ';

  @override
  String get noteDateLabel => 'NGÀY';

  @override
  String get noteExerciseLabel => 'BÀI TẬP LIÊN QUAN';

  @override
  String get noteMediaLabel => 'HÌNH ẢNH & VIDEO';

  @override
  String get noteGeneral => 'Ghi chú chung (Không gắn bài tập)';

  @override
  String get noteAttach => 'Đính kèm';

  @override
  String get noteRemoveMedia => 'Xóa tệp đính kèm';

  @override
  String get deleteNoteTitle => 'Xóa ghi chú';

  @override
  String get deleteNoteBody => 'Ghi chú này cùng toàn bộ tệp đính kèm sẽ bị xóa vĩnh viễn.';

  @override
  String get noteToday => 'Hôm nay';

  @override
  String get noteYesterday => 'Hôm qua';

  @override
  String get noteAllNotes => 'Tất cả ghi chú';

  @override
  String get noteCalendar => 'Lịch ghi chú';

  @override
  String get noteNoneOnDay => 'Chưa có ghi chú nào trong ngày này';

  @override
  String get noteAddOnDay => 'Thêm ghi chú cho ngày này';

  @override
  String get notePrevMonth => 'Tháng trước';

  @override
  String get noteNextMonth => 'Tháng sau';

  @override
  String noteMonthCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n notes this month',
      one: '1 note this month',
      zero: 'No notes this month',
    );
    return '$_temp0';
  }

  @override
  String get measures => 'SỐ ĐO CƠ THỂ';

  @override
  String get measuresHint => 'Từ cổ đến bắp chân — theo dõi sự thay đổi vóc dáng của bạn.';

  @override
  String measureCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n readings',
      one: '1 reading',
      zero: 'Nothing logged',
    );
    return '$_temp0';
  }

  @override
  String get measureNoneYet => 'Chưa ghi nhận số đo';

  @override
  String get measureHistory => 'LỊCH SỬ SỐ ĐO';

  @override
  String get measureNeck => 'Cổ';

  @override
  String get measureShoulders => 'Vai';

  @override
  String get measureChest => 'Ngực';

  @override
  String get measureArm => 'Bắp tay';

  @override
  String get measureForearm => 'Cẳng tay';

  @override
  String get measureWaist => 'Eo';

  @override
  String get measureHips => 'Hông';

  @override
  String get measureThigh => 'Đùi';

  @override
  String get measureCalf => 'Bắp chân';

  @override
  String get measureBodyfat => 'Tỷ lệ mỡ (% Bodyfat)';

  @override
  String get timeline => 'DÒNG THỜI GIAN';

  @override
  String get timelineHint =>
      'Cùng góc chụp, cùng vị trí, cùng ánh sáng. Sau 1 năm bạn sẽ bất ngờ trước sự thay đổi.';

  @override
  String get timelineEmptyTitle => 'Bức ảnh đầu tiên đánh dấu hành trình';

  @override
  String photoCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n photos',
      one: '1 photo',
      zero: 'No photos',
    );
    return '$_temp0';
  }

  @override
  String get poseFront => 'Mặt trước';

  @override
  String get poseSide => 'Mặt bên';

  @override
  String get poseBack => 'Mặt sau';

  @override
  String get photoEvery => 'NHẮC CHỤP ẢNH';

  @override
  String photoEveryDays(int n) {
    return 'Mỗi $n ngày';
  }

  @override
  String get photoEveryOff => 'Không nhắc';

  @override
  String get timelineEvery => 'GOM NHÓM THEO';

  @override
  String get custom => 'Tùy chỉnh';

  @override
  String photoNextIn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Next photo in $n days',
      one: 'Next photo tomorrow',
    );
    return '$_temp0';
  }

  @override
  String get photoDueNow => 'Đến lịch chụp ảnh thể hình hôm nay';

  @override
  String get addTodayPhotos => 'THÊM ẢNH HÔM NAY';

  @override
  String posePhoto(String pose) {
    return '$pose photo';
  }

  @override
  String get compare => 'SO SÁNH';

  @override
  String get compareNeedTwo => 'Chụp cùng một tư thế vào hai ngày khác nhau để so sánh sự thay đổi tại đây.';

  @override
  String dayNumber(int n) {
    return 'Ngày $n';
  }

  @override
  String daysApart(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n days apart',
      one: '1 day apart',
      zero: 'Same day',
    );
    return '$_temp0';
  }

  @override
  String get deleteEntryTitle => 'Xóa ngày này';

  @override
  String get deleteDayBody => 'Các ảnh chụp của ngày này cũng sẽ bị xóa vĩnh viễn.';

  @override
  String get timelinePhotos => 'Hình ảnh vóc dáng';

  @override
  String get timelineBody => 'Bản đồ cơ bắp';

  @override
  String get timelineBodyEmpty => 'Ghi nhận buổi tập và bản đồ cơ bắp sẽ hiển thị tại đây theo thời gian.';

  @override
  String get timelineBodyHint => 'Tự động tổng hợp từ các hiệp tập của bạn — không cần tải lên.';

  @override
  String timelineWindow(String from, String to) {
    return '$from – $to';
  }

  @override
  String sessionCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n sessions',
      one: '1 session',
      zero: 'No sessions',
    );
    return '$_temp0';
  }

  @override
  String get notifPhotoChannel => 'Ảnh theo dõi tiến trình';

  @override
  String get notifPhotoChannelWhy => 'Nhắc nhở khi đến lịch chụp ảnh theo dõi vóc dáng tiếp theo.';

  @override
  String get notifPhotoTitle => 'Đến lúc chụp ảnh theo dõi vóc dáng rồi';

  @override
  String notifPhotoBody(int n) {
    return 'Chụp nhanh một tấm để lưu lại tiến trình phát triển của bạn.';
  }

  @override
  String get share => 'CHIA SẺ';

  @override
  String get sharePick => 'Bạn muốn chia sẻ nội dung gì?';

  @override
  String get shareSession => 'Buổi tập gần nhất';

  @override
  String get shareStreak => 'Chuỗi ngày tập & Tính đều đặn';

  @override
  String get shareBody => 'Các nhóm cơ đã tập';

  @override
  String get shareCompare => 'Trước & Sau';

  @override
  String get shareHint =>
      'Thẻ chia sẻ được tạo trực tiếp trên máy bạn. Không có dữ liệu nào bị gửi đi trừ khi bạn chọn nơi chia sẻ.';

  @override
  String get shareFailed => 'Không thể tạo thẻ chia sẻ';

  @override
  String get shareWeekOf => '7 NGÀY GẦN NHẤT';

  @override
  String get shareStreakLabel => 'CHUỖI NGÀY';

  @override
  String get shareSessionsLabel => 'BUỔI TẬP';

  @override
  String get shareVolumeLabel => 'Khối lượng';

  @override
  String get shareSetsLabel => 'Hiệp';

  @override
  String get shareNothing => 'Hãy ghi nhận một buổi tập trước — chưa có dữ liệu để hiển thị';

  @override
  String get restForExercise => 'THỜI GIAN NGHỈ BÀI TẬP NÀY';

  @override
  String get restUsingDefault => 'Đang dùng thời gian nghỉ mặc định';

  @override
  String get restCustom => 'Chỉ áp dụng cho bài tập này';

  @override
  String get setType => 'LOẠI HIỆP';

  @override
  String get setTypeNormal => 'Hiệp chính';

  @override
  String get setTypeWarmup => 'Khởi động';

  @override
  String get setTypeDrop => 'Drop set';

  @override
  String get setTypeFailure => 'Đến thất bại (Failure)';

  @override
  String get setTypeHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get addWarmup => 'KHỞI ĐỘNG';

  @override
  String platesPerSide(String plates) {
    return 'Đĩa tạ mỗi bên:';
  }

  @override
  String get howTo => 'HƯỚNG DẪN KỸ THUẬT';

  @override
  String get similar => 'TƯƠNG TỰ';

  @override
  String get primaryLabel => 'CƠ CHÍNH';

  @override
  String get secondaryLabel => 'CƠ PHỤ';

  @override
  String get none => 'Không có';

  @override
  String setCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(n, locale: localeName, other: '$n sets', one: '$n set');
    return '$_temp0';
  }

  @override
  String volumeSuffix(String v) {
    return '$v volume';
  }

  @override
  String get weeklyPlan => 'LỊCH TẬP TUẦN';

  @override
  String get yourRoutines => 'GIÁO ÁN CỦA BẠN';

  @override
  String get noRoutines => 'Chưa có giáo án nào. Hãy tạo giáo án và thêm bài tập.';

  @override
  String get newRoutine => 'TẠO GIÁO ÁN MỚI';

  @override
  String get routineName => 'Tên giáo án';

  @override
  String get schedule => 'LỊCH TẬP';

  @override
  String get addFromList => 'Thêm bài tập từ danh sách bên dưới.';

  @override
  String get addExercises => 'Thêm bài tập';

  @override
  String get deleteRoutine => 'Xóa giáo án';

  @override
  String exercisesWithCount(int n) {
    return 'BÀI TẬP · $n';
  }

  @override
  String setDay(String day) {
    return 'ĐẶT $day';
  }

  @override
  String get newRoutineName => 'Giáo án mới';

  @override
  String get dragToReorder => 'Nhấn và kéo để sắp xếp lại thứ tự bài tập.';

  @override
  String reorderHandle(String name) {
    return 'Sắp xếp lại $name';
  }

  @override
  String get removeFromRoutine => 'Xóa khỏi giáo án';

  @override
  String get dropExercise => 'Bỏ bài tập này?';

  @override
  String dropExerciseBody(String name) {
    return '\"$name\" sẽ rời khỏi buổi tập này. Các hiệp đã ghi nhận không bị mất.';
  }

  @override
  String get drop => 'Bỏ bài';

  @override
  String get addToWorkout => 'THÊM BÀI TẬP';

  @override
  String get resetData => 'Xóa toàn bộ dữ liệu & Đặt lại';

  @override
  String get resetTitle => 'Xóa toàn bộ dữ liệu?';

  @override
  String get resetBody =>
      'Các buổi tập, kỷ lục, giáo án, ghi chú và hồ sơ sẽ bị xóa hoàn toàn. Hãy sao lưu trước nếu cần.';

  @override
  String get resetConfirm => 'Xóa toàn bộ dữ liệu';

  @override
  String get resetDone => 'Đã xóa toàn bộ dữ liệu';

  @override
  String get support => 'HỖ TRỢ & ĐÓNG GÓP';

  @override
  String get reportBug => 'Báo lỗi ứng dụng';

  @override
  String get requestFeature => 'Đề xuất tính năng mới';

  @override
  String get starOnGithub => 'Đánh giá sao trên GitHub';

  @override
  String get buyCoffee => 'Ủng hộ tác giả một ly cà phê';

  @override
  String get cantOpenLink => 'Không thể mở liên kết này';

  @override
  String get preferences => 'TÙY CHỌN ỨNG DỤNG';

  @override
  String get theme => 'Giao diện';

  @override
  String get darkTheme => 'Giao diện tối (Dark)';

  @override
  String get lightTheme => 'Giao diện sáng (Light)';

  @override
  String get languageLabel => 'Ngôn ngữ';

  @override
  String get unitsLabel => 'Đơn vị đo';

  @override
  String get restTimer => 'Đồng hồ nghỉ';

  @override
  String get alarmBlockedTitle => 'Thông báo đang bị tắt';

  @override
  String get alarmBlockedBody => 'Chuông báo nghỉ sẽ không reo khi màn hình bị khóa';

  @override
  String get alarmBlockedAction => 'BẬT LÊN';

  @override
  String get alarmSound => 'Âm thanh báo hết giờ nghỉ';

  @override
  String get alarmDefaultName => 'Chuông mặc định';

  @override
  String get alarmSoundHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get alarmChoose => 'Chọn âm thanh…';

  @override
  String get alarmPreview => 'Nghe thử âm thanh';

  @override
  String get alarmReset => 'Đặt lại mặc định';

  @override
  String get alarmTooLong => 'Âm thanh dài quá 15 giây';

  @override
  String get alarmInvalid => 'Không thể đọc tệp âm thanh này';

  @override
  String alarmChanged(String name) {
    return 'Đã đổi âm báo thành \"$name\"';
  }

  @override
  String get alarmChangedDefault => 'Đã quay về âm báo mặc định';

  @override
  String get homeWidgets => 'TIỆN ÍCH MÀN HÌNH CHÍNH (WIDGETS)';

  @override
  String get addActivityWidget => 'Tiện ích biểu đồ tần suất tập';

  @override
  String get addStatsWidget => 'Tiện ích thống kê tổng quan';

  @override
  String get pinUnsupported => 'Thêm widget từ màn hình chính của máy';

  @override
  String get background => 'Hình nền';

  @override
  String get bgNone => 'Không có';

  @override
  String get bgDots => 'Chấm bi';

  @override
  String get bgGrid => 'Lưới kẻ';

  @override
  String get data => 'DỮ LIỆU & BỘ NHỚ';

  @override
  String get exportCsv => 'Xuất dữ liệu ra file CSV';

  @override
  String get exportBackup => 'Sao lưu toàn bộ ứng dụng (ZIP)';

  @override
  String get importBackup => 'Khôi phục dữ liệu từ bản sao lưu';

  @override
  String get importHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get import => 'Nhập dữ liệu';

  @override
  String get chooseFile => 'Chọn tệp tin';

  @override
  String get importFromApp => 'Nhập dữ liệu từ Hevy / Strong / FitNotes';

  @override
  String get importUnknownFormat => 'Tệp tin cần các cột: ngày, bài tập, số lần và mức tạ';

  @override
  String get importZipNoWeights => 'Tệp ZIP không chứa dữ liệu mức tạ';

  @override
  String importWeights(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Imported $n weigh-ins',
      one: 'Imported $n weigh-in',
    );
    return '$_temp0';
  }

  @override
  String get importReadFailed => 'Không thể đọc tệp tin này';

  @override
  String get importUnitTitle => 'Đơn vị mức tạ trong tệp tin?';

  @override
  String get importUnitBody => 'Tệp xuất không ghi rõ đơn vị tạ là kg hay lb.';

  @override
  String get importNothing => 'Không có dữ liệu mới để nhập';

  @override
  String importDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Imported $n sessions',
      one: 'Imported $n session',
    );
    return '$_temp0';
  }

  @override
  String get aboutGymmane => 'Giới thiệu về FitMan';

  @override
  String get yourProfile => 'HỒ SƠ CỦA BẠN';

  @override
  String get autofills => 'Giúp tự động điền các mức tạ và chỉ số phù hợp với bạn.';

  @override
  String get nameLabel => 'HỌ TÊN';

  @override
  String get sexLabel => 'Giới tính';

  @override
  String get macroProtein => 'ĐẠM (PROTEIN)';

  @override
  String get macroCarbs => 'TINH BỘT (CARBS)';

  @override
  String get macroFat => 'CHẤT BÉO (FAT)';

  @override
  String get male => 'Nam';

  @override
  String get female => 'Nữ';

  @override
  String get ageLabel => 'Tuổi';

  @override
  String get heightLabel => 'Chiều cao';

  @override
  String get weightLabel => 'Cân nặng';

  @override
  String get weeklyGoal => 'Mục tiêu tuần';

  @override
  String get activityLabel => 'HOẠT ĐỘNG';

  @override
  String get addPhoto => 'Thêm ảnh';

  @override
  String get removePhoto => 'Xóa ảnh';

  @override
  String get takePhoto => 'Chụp ảnh mới';

  @override
  String get chooseGallery => 'Chọn từ thư viện ảnh';

  @override
  String get backupCopied => 'Đã sao chép bản sao lưu vào bộ nhớ tạm';

  @override
  String get backupImported => 'Đã khôi phục bản sao lưu thành công';

  @override
  String get backupFailed => 'Không thể đọc bản sao lưu này';

  @override
  String get nothingToExport => 'Chưa có dữ liệu để xuất — hãy tập một buổi trước';

  @override
  String get athlete => 'Vận động viên';

  @override
  String calculatorsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(n, locale: localeName, other: '$n công cụ hữu ích');
    return '$_temp0';
  }

  @override
  String get result => 'KẾT QUẢ';

  @override
  String get weightLifted => 'MỨC TẠ ĐÃ NÂNG';

  @override
  String get repsPerformed => 'SỐ LẦN ĐÃ ĐẠT';

  @override
  String get neck => 'Cổ';

  @override
  String get waist => 'VÒNG EO';

  @override
  String get hip => 'VÒNG HÔNG (dành cho nữ)';

  @override
  String get targetWeight => 'Cân nặng mục tiêu';

  @override
  String get workingWeight => 'MỨC TẠ CHÍNH';

  @override
  String get activityLevel => 'MỨC ĐỘ VẬN ĐỘNG';

  @override
  String get barWeight => 'KHỐI LƯỢNG ĐÒN';

  @override
  String get perSide => 'MỖI BÊN';

  @override
  String get justTheBar => 'Chỉ dùng thanh đòn.';

  @override
  String perSideCount(int n) {
    return '× $n mỗi bên';
  }

  @override
  String rampSet(String pct, int reps) {
    return '$pct · $reps reps';
  }

  @override
  String get toolNameRm => 'Tính 1RM';

  @override
  String get toolNameBmi => 'Tính BMI';

  @override
  String get toolNameCal => 'Tính TDEE & Calo';

  @override
  String get toolNameBf => 'Tỷ lệ mỡ (Body Fat)';

  @override
  String get toolNamePlate => 'Máy tính xếp bánh tạ';

  @override
  String get toolNameWarmup => 'Khởi động làm nóng';

  @override
  String get toolTitleRm => 'ƯỚC TÍNH MỨC TẠ TỐI ĐA 1RM';

  @override
  String get toolTitleBmi => 'CHỈ SỐ KHỐI CƠ THỂ (BMI)';

  @override
  String get toolTitleCal => 'CALO TIÊU THỤ HÀNG NGÀY (TDEE)';

  @override
  String get toolTitleBf => 'ƯỚC TÍNH TỶ LỆ MỠ CƠ THỂ';

  @override
  String get toolTitlePlate => 'CÁCH XẾP BÁNH TẠ ĐÒN';

  @override
  String get toolTitleWarmup => 'CÁC HIỆP KHỞI ĐỘNG (WARM-UP)';

  @override
  String get toolHintRm => 'Mức tạ nặng nhất bạn có thể nâng 1 lần chuẩn kỹ thuật';

  @override
  String get toolHintCal => 'Nhu cầu calo duy trì, tăng cơ hoặc giảm mỡ';

  @override
  String get toolHintBf => 'Đo bằng phương pháp US Navy chính xác';

  @override
  String get toolHintPlate => 'Chỉ dẫn gắn bánh tạ mỗi bên đòn thanh tạ';

  @override
  String get toolHintWarmup => 'Lộ trình khởi động tăng dần tạ trước hiệp chính';

  @override
  String get toolDescRm => 'Tính toán 1RM dựa trên số rep và mức tạ nâng được';

  @override
  String get toolDescBmi => 'Tính BMI và phân loại gầy, chuẩn, thừa cân';

  @override
  String get toolDescCal => 'Tính BMR và TDEE dựa trên mức độ vận động';

  @override
  String get toolDescBf => 'Tính phần trăm mỡ dựa trên số đo vòng eo, cổ, hông';

  @override
  String get toolDescPlate => 'Tính số bánh tạ cần xếp mỗi bên thanh đòn';

  @override
  String get toolDescWarmup => 'Gợi ý các hiệp khởi động giúp khớp sẵn sàng';

  @override
  String get bmiUnderweight => 'Thiếu cân';

  @override
  String get bmiNormal => 'Bình thường';

  @override
  String get bmiOverweight => 'Thừa cân';

  @override
  String get bmiObese => 'Béo phì';

  @override
  String get actSedentary => 'Ít vận động';

  @override
  String get actLight => 'Vận động nhẹ';

  @override
  String get actActive => 'Năng động';

  @override
  String get actModerate => 'Vận động vừa';

  @override
  String get muscleChest => 'Ngực';

  @override
  String get muscleBack => 'Quay lại';

  @override
  String get muscleShoulders => 'Vai';

  @override
  String get muscleBiceps => 'Tay trước';

  @override
  String get muscleTriceps => 'Tay sau';

  @override
  String get muscleForearm => 'Cẳng tay';

  @override
  String get muscleTrapezius => 'Cầu vai';

  @override
  String get muscleAbdomen => 'Bụng';

  @override
  String get muscleObliques => 'Cơ liên sườn';

  @override
  String get muscleQuads => 'Đùi trước';

  @override
  String get muscleHamstrings => 'Đùi sau';

  @override
  String get muscleGlutes => 'Mông';

  @override
  String get muscleCalves => 'Bắp chân';

  @override
  String get mgChest => 'Ngực';

  @override
  String get mgBack => 'Quay lại';

  @override
  String get mgLegs => 'Chân';

  @override
  String get mgShoulders => 'Vai';

  @override
  String get mgArms => 'Tay';

  @override
  String get mgCore => 'Cơ lõi / Bụng';

  @override
  String get equipBarbell => 'Tạ đòn';

  @override
  String get equipDumbbell => 'Tạ đơn';

  @override
  String get equipCable => 'Dây cáp';

  @override
  String get equipMachine => 'Máy tập';

  @override
  String get equipBodyweight => 'Trọng lượng cơ thể';

  @override
  String get equipWeighted => 'Tạ đeo thêm';

  @override
  String get equipBand => 'Dây kháng lực';

  @override
  String get equipKettlebell => 'Tạ bình vôi';

  @override
  String get equipRings => 'Vòng treo (Rings)';

  @override
  String get equipOther => 'Dụng cụ khác';

  @override
  String get diffBeginner => 'Mới bắt đầu';

  @override
  String get diffAdvanced => 'Nâng cao';

  @override
  String get diffIntermediate => 'Trung cấp';

  @override
  String get about => 'GIỚI THIỆU';

  @override
  String version(String v) {
    return 'Phiên bản';
  }

  @override
  String get aboutBlurb => 'Được xây dựng bởi người tập gym, dành cho người tập gym.';

  @override
  String get freeForever => 'Không bao giờ có quảng cáo';

  @override
  String get freeForeverWhy => 'Tập trung 100% vào việc tập luyện, trải nghiệm mượt mà không bị làm phiền.';

  @override
  String get fullyOffline => 'Hoạt động Offline 100%';

  @override
  String get fullyOfflineWhy => 'Dữ liệu lưu an toàn trên máy bạn, tập luyện mọi nơi không cần Internet.';

  @override
  String get yoursToTake => 'Dữ liệu là của bạn';

  @override
  String get yoursToTakeWhy => 'Xuất và sao lưu dữ liệu bất kỳ lúc nào theo định dạng chuẩn.';

  @override
  String get whatsInside => 'TÍNH NĂNG NỔI BẬT';

  @override
  String exercisesInside(int n) {
    return '$n exercises';
  }

  @override
  String get exercisesInsideWhy => 'Mỗi bài tập đều có hình động và hướng dẫn chi tiết từng bước.';

  @override
  String get calculatorsInside => 'Máy tính 1RM, Calo, Bánh tạ...';

  @override
  String get calculatorsInsideWhy =>
      '1RM, đĩa tạ, BMI, calo, body fat và khởi động — với công thức chuẩn khoa học.';

  @override
  String get mathInside => 'Toán học minh bạch';

  @override
  String get mathInsideWhy => 'Khối lượng, kỷ lục và chuỗi ngày đều tính từ hiệp tập thật của bạn.';

  @override
  String get yourNumbers => 'CHỈ SỐ CỦA BẠN';

  @override
  String get sessionsCaps => 'BUỔI TẬP';

  @override
  String get liftedCaps => 'TỔNG TẠ';

  @override
  String get streakCaps => 'CHUỖI TẬP';

  @override
  String daysUnit(int n) {
    String _temp0 = intl.Intl.pluralLogic(n, locale: localeName, other: '$n ngày', one: '$n ngày');
    return '$_temp0';
  }

  @override
  String get restDefaultLabel => 'Thời gian nghỉ';

  @override
  String restDefault(int s) {
    return 'Mặc định là $s giây — đổi trong Cài đặt';
  }

  @override
  String get reset => 'ĐẶT LẠI';

  @override
  String get welcomeKicker => 'CHÀO MỪNG BẠN ĐẾN VỚI';

  @override
  String get welcomeBlurb =>
      'Ứng dụng theo dõi tập gym thông minh, chuẩn khoa học và tối giản nhất cho hành trình phát triển thể hình của bạn.';

  @override
  String get welcomeStart => 'BẮT ĐẦU NGAY';

  @override
  String onbStep(int i, int n) {
    return 'BƯỚC $i / $n';
  }

  @override
  String get onbNameTitle => 'Bạn tên là gì?';

  @override
  String get onbNameHint => 'Tên của bạn';

  @override
  String get onbNameWhy => 'Chỉ dùng để xưng hô thân mật. Dữ liệu chỉ lưu trên thiết bị của bạn.';

  @override
  String get onbBodyTitle => 'Một vài chỉ số cơ bản';

  @override
  String get onbBodyWhy =>
      'Dùng để tính toán lượng calo, chỉ số BMI và mức tạ. Bạn có thể thay đổi bất kỳ lúc nào trong Cài đặt.';

  @override
  String get onbGoalTitle => 'Bạn dự định tập mấy buổi 1 tuần?';

  @override
  String get onbGoalWhy =>
      'Thiết lập vòng mục tiêu hàng tuần của bạn. Hãy chọn số buổi phù hợp và duy trì đều đặn.';

  @override
  String perWeek(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n buổi một tuần',
      one: '$n buổi một tuần',
    );
    return '$_temp0';
  }

  @override
  String get onbUnitsTitle => 'Bạn dùng Kilogram hay Pound?';

  @override
  String get next => 'TIẾP TỤC';

  @override
  String get back => 'QUAY LẠI';

  @override
  String get skip2 => 'Bỏ qua';

  @override
  String get madeWithLoveBy => 'ĐƯỢC PHÁT TRIỂN VỚI TÂM HUYẾT BỞI';

  @override
  String get sourceCode => 'MÃ NGUỒN MỞ';

  @override
  String get suggested => 'GỢI Ý';

  @override
  String get results => 'KẾT QUẢ TÌM KIẾM';

  @override
  String get noMatches => 'Không có bài tập nào khớp với tìm kiếm.';

  @override
  String get tapToEdit => 'Chạm vào bút chì để sửa, hoặc thùng rác để xóa.';

  @override
  String get editEntry => 'Chỉnh sửa';

  @override
  String get editEntryHint => 'Sửa số lần hoặc mức tạ của bất kỳ hiệp nào.';

  @override
  String get removeSet => 'Xóa hiệp';

  @override
  String get continueWorkout => 'TIẾP TỤC';

  @override
  String get continueWorkoutBody => 'Buổi tập sẽ tiếp tục diễn ra với các hiệp đã đánh dấu hoàn thành.';

  @override
  String get addBodyWidget => 'Thêm tiện ích bản đồ cơ';

  @override
  String get repsOnly => 'Chỉ tính số lần (Bodyweight)';

  @override
  String get repsOnlyHint => 'Ghi nhận bài tập này không dùng thêm tạ ngoài.';

  @override
  String get useDefaultArt => 'Quay lại hình mặc định';

  @override
  String daysShort(int n) {
    return '$n ngày';
  }

  @override
  String get focusCard => 'Mục tiêu hôm nay';

  @override
  String get autoAdvance => 'Tự động chuyển bài tập';

  @override
  String get keepScreenOn => 'Giữ màn hình luôn sáng khi tập';

  @override
  String get lockWorkout => 'Khóa màn hình tập';

  @override
  String get unlockWorkout => 'Mở khóa';

  @override
  String get lockedCaps => 'ĐÃ KHÓA';

  @override
  String get holdToUnlock => 'Nhấn giữ để mở khóa';

  @override
  String get liveChannel => 'Buổi tập đang diễn ra';

  @override
  String get liveChannelWhy => 'Hiển thị bài tập, số hiệp và thời gian nghỉ trên thanh thông báo';

  @override
  String liveSet(int n, int total) {
    return 'Hiệp $n / $total';
  }

  @override
  String get liveResting => 'Đang nghỉ';

  @override
  String get liveAllDone => 'Đã hoàn thành tất cả các hiệp';

  @override
  String get autoAdvanceHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get autoProgress => 'Tăng tạ vào lần tới';

  @override
  String autoProgressHint(String w) {
    return 'Thông tin hướng dẫn tính năng.';
  }

  @override
  String get placePlates => 'Đĩa tạ và đòn';

  @override
  String get platesAll => 'Mọi đĩa tạ có sẵn';

  @override
  String platesOwned(int n) {
    String _temp0 = intl.Intl.pluralLogic(n, locale: localeName, other: '$n sizes', one: '$n size');
    return '$_temp0';
  }

  @override
  String get platePairs => 'CẶP ĐĨA TẠ';

  @override
  String plateAchievable(String w) {
    return 'Mức tạ gần nhất có thể lắp: $w';
  }

  @override
  String get autoWarmup => 'Bắt đầu với các hiệp khởi động';

  @override
  String get autoWarmupHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get trainReminder => 'Nhắc nhở tập luyện';

  @override
  String get trainReminderHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get notifTrainChannel => 'Nhắc nhở tập luyện';

  @override
  String get notifTrainChannelWhy => 'Nhắc nhở bạn tập luyện vào những ngày đã lên lịch.';

  @override
  String get notifTrainTitle => 'Đến giờ tập luyện rồi!';

  @override
  String get notifTrainBody => 'Giáo án tập hôm nay đang chờ bạn.';

  @override
  String get exportCatalog => 'Xuất danh sách bài tập';

  @override
  String get importRoutine => 'Nhập giáo án (JSON)';

  @override
  String get planIntro => 'Lên giúp tôi một giáo án tập luyện chỉ dùng các bài tập trong danh sách này.';

  @override
  String get planFormat => 'Chỉ trả lời bằng JSON theo mẫu sau:';

  @override
  String planImported(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n exercises added to the routine',
      one: '$n exercise added to the routine',
    );
    return '$_temp0';
  }

  @override
  String get planNothing => 'Không có bài tập nào trong tệp khớp với thư viện của bạn';

  @override
  String get planFailed => 'Tệp tin không đúng định dạng giáo án';

  @override
  String get routineGroup => 'Nhóm';

  @override
  String get newGroup => 'Nhóm mới';

  @override
  String get noGroup => 'Chưa có nhóm';

  @override
  String get groupNameHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get filters => 'Bộ lọc';

  @override
  String get setsPlannedHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get nextTime => 'Tiếp tục';

  @override
  String get nextHold => 'giữ nguyên mức tạ đến khi hoàn thành đủ số rep';

  @override
  String get bgPhoto => 'Ảnh của bạn';

  @override
  String get bgPhotoPick => 'Chọn một bức ảnh';

  @override
  String get bgPhotoChange => 'Thay đổi ảnh';

  @override
  String get bgPhotoRemove => 'Xóa ảnh nền';

  @override
  String get bgDim => 'ĐỘ TỐI';

  @override
  String get dimSoft => 'Nhẹ';

  @override
  String get dimMedium => 'Vừa';

  @override
  String get dimStrong => 'Tối nhiều';

  @override
  String get bgPhotoHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get reminderSmart => 'Thông minh';

  @override
  String get reminderFixed => 'Giờ cố định';

  @override
  String get reminderSmartHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get reminderSmartEmpty => 'Chưa có dữ liệu nào tại đây.';

  @override
  String habitFocus(String day) {
    return 'những gì bạn thường tập vào $day';
  }

  @override
  String get duplicateRoutine => 'Nhân bản giáo án';

  @override
  String copySuffix(String name) {
    return '$name (copy)';
  }

  @override
  String get saveAsRoutine => 'LƯU THÀNH GIÁO ÁN';

  @override
  String get savedAsRoutine => 'Lưud as a routine';

  @override
  String get templates => 'Giáo án có sẵn';

  @override
  String get templatesHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String templateAdded(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n routines added',
      one: '$n routine added',
    );
    return '$_temp0';
  }

  @override
  String get tplFullbody => 'Full body 3 ngày một tuần. Rất phù hợp để bắt đầu.';

  @override
  String get tplPpl => 'Push, Pull và Legs. 3 hoặc 6 ngày một tuần.';

  @override
  String get tplUpperlower => 'Thân trên và thân dưới, 4 ngày một tuần.';

  @override
  String get tplStronglifts => 'StrongLifts: Hai buổi tập luân phiên, 5 hiệp 5 lần.';

  @override
  String get tplStartingstrength => 'Starting Strength: Squat mỗi buổi, 2 buổi luân phiên.';

  @override
  String get tplHome => 'Tập tại nhà: Chỉ cần sàn nhà và một thanh xà đơn.';

  @override
  String dayCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(n, locale: localeName, other: '$n days', one: '$n day');
    return '$_temp0';
  }

  @override
  String get logRpe => 'Ghi nhận độ gắng sức (RPE)';

  @override
  String get rpeTitle => 'ĐỘ GẮNG SỨC (RPE)';

  @override
  String get rpeHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get superset => 'Superset';

  @override
  String get supersetLink => 'Ghép cặp với bài tập kế tiếp';

  @override
  String get supersetHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get aiRoutine => 'Tạo giáo án với AI';

  @override
  String get aiIntro =>
      'FitMan tôn trọng quyền riêng tư. Bạn chỉ cần xuất danh sách bài tập, dán vào ChatGPT / Claude và nhập kết quả lại.';

  @override
  String get aiStep1 =>
      'Xuất danh sách bài tập. Nếu đã chọn địa điểm, file chỉ chứa bài tập có dụng cụ tại đó.';

  @override
  String get aiStep2 => 'Gửi file đó cho bất kỳ AI nào và yêu cầu lên giáo án.';

  @override
  String get aiStep3 => 'Lưu câu trả lời thành tệp JSON hoặc văn bản thuần.';

  @override
  String get aiStep4 => 'Nhập vào đây. Tên bài tập sẽ tự động liên kết với thư viện để dựng giáo án.';

  @override
  String aiMissing(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n names were not in your library',
      one: '1 name was not in your library',
    );
    return '$_temp0';
  }

  @override
  String get importApps => 'Ứng dụng tương thích';

  @override
  String get importOtherCsv => 'Bất kỳ file CSV nào có ngày, bài tập, số lần và mức tạ';

  @override
  String get importAskApp => 'Cần thêm ứng dụng khác? Hãy gửi yêu cầu';

  @override
  String get awardFirstStepName => 'Bước đầu tiên';

  @override
  String get awardFirstStepLine => 'Chào mừng bạn đến với FitMan. Khởi đầu hành trình mới.';

  @override
  String get awardFirstWorkoutName => 'Buổi tập đầu tiên';

  @override
  String get awardFirstWorkoutLine => 'Buổi tập đầu tiên đã hoàn thành. Khởi đầu luôn là bước khó nhất.';

  @override
  String get awardFirstRoutineName => 'Giáo án đầu tiên';

  @override
  String get awardFirstRoutineLine => 'Bạn đã có kế hoạch rõ ràng để kiên trì theo đuổi.';

  @override
  String get awardFirstRecordName => 'Kỷ lục đầu tiên';

  @override
  String get awardFirstRecordLine => 'Bạn đã phá vỡ mức tạ tốt nhất của một bài tập.';

  @override
  String get awardStreak3Name => 'Ba ngày liên tiếp';

  @override
  String get awardStreak3Line => 'Ba ngày tập liên tục. Thói quen tốt đang hình thành.';

  @override
  String get awardTonne1Name => 'Một tấn tạ';

  @override
  String get awardTonne1Line => 'Tổng mức tạ nâng đạt 1.000 kg qua các hiệp tập.';

  @override
  String get awardSets100Name => 'Một trăm hiệp';

  @override
  String get awardSets100Line => 'Đã hoàn thành 100 hiệp tập xuất sắc.';

  @override
  String get awardHours10Name => 'Mười giờ tập';

  @override
  String get awardHours10Line => 'Mười giờ cống hiến cho sức khỏe và cơ bắp.';

  @override
  String get awardWorkouts50Name => 'Năm mươi buổi tập';

  @override
  String get awardWorkouts50Line => 'Đã hoàn thành 50 buổi tập luyện kiên trì.';

  @override
  String get awardHours50Name => 'Năm mươi giờ';

  @override
  String get awardHours50Line => '50 giờ bền bỉ trong phòng tập.';

  @override
  String get awardsTitle => 'Huy hiệu thành tích';

  @override
  String get awardWon => 'Đã đạt';

  @override
  String get yearTitle => 'Năm của bạn';

  @override
  String get yearBestMonth => 'Tháng tập tốt nhất';

  @override
  String get yearMonths => 'tháng';

  @override
  String get awardSpinHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get awardUnlocked => 'Huy hiệu mới đã mở khóa!';

  @override
  String get awardNice => 'Tuyệt vời!';

  @override
  String get awardSaveImage => 'Lưu image';

  @override
  String get awardSaved => 'Lưud to your gallery';

  @override
  String get awardStreakBottom => 'chuỗi';

  @override
  String get awardStreak7Top => 'bảy ngày';

  @override
  String get awardStreak7Name => 'Bảy ngày liên tục';

  @override
  String get awardStreak7Line => 'Trọn vẹn một tuần không bỏ lỡ ngày tập nào.';

  @override
  String get awardStreak30Top => 'ba mươi ngày';

  @override
  String get awardStreak30Name => 'Ba mươi ngày liên tục';

  @override
  String get awardStreak30Line => 'Một tháng kiên trì. Đây đã trở thành lối sống của bạn.';

  @override
  String get awardWorkouts100Top => 'một trăm';

  @override
  String get awardWorkouts100Bottom => 'buổi tập';

  @override
  String get awardWorkouts100Name => 'Một trăm buổi tập';

  @override
  String get awardWorkouts100Line => '100 buổi tập được ghi nhận từ đầu đến cuối.';

  @override
  String get awardTonnes100Top => 'một trăm';

  @override
  String get awardTonnes100Bottom => 'tấn tạ';

  @override
  String get awardTonnes100Name => 'Một trăm tấn tạ';

  @override
  String get awardTonnes100Line => 'Tổng khối lượng bạn đã nâng lên tới 100.000 kg.';

  @override
  String get awardSets1000Top => 'một nghìn';

  @override
  String get awardSets1000Bottom => 'Hiệp';

  @override
  String get awardSets1000Name => 'Một nghìn hiệp tập';

  @override
  String get awardSets1000Line => '1.000 hiệp tập từng bước đưa bạn đến đỉnh cao.';

  @override
  String get profile => 'CÁ NHÂN';

  @override
  String get editProfile => 'Chỉnh sửa hồ sơ';

  @override
  String get pickBadge => 'Huy hiệu';

  @override
  String get badgeTitle => 'Huy hiệu của bạn';

  @override
  String get statWorkouts => 'Buổi tập';

  @override
  String get statTrained => 'Đã tập';

  @override
  String get statSets => 'Hiệp';

  @override
  String get statLifted => 'Đã nâng';

  @override
  String get statStreak => 'Chuỗi ngày';

  @override
  String get statDays => 'ngày';

  @override
  String get unitHours => 'giờ';

  @override
  String get unitDays => 'ngày';

  @override
  String get snapshots => 'Hình ảnh';

  @override
  String get snapNow => 'Chụp ngay';

  @override
  String get calendarLegend => 'Đã tập · hình ảnh';

  @override
  String get addCover => 'Thêm ảnh bìa';

  @override
  String get addTodayWidget => 'Tiện ích bài tập hôm nay';

  @override
  String get monthTitle => 'Tháng này';

  @override
  String get photosCard => 'Ảnh thể hình của bạn';

  @override
  String get handleLabel => 'Tên người dùng';

  @override
  String get setupTitle => 'Điền các thông tin này để hoàn tất trang cá nhân';

  @override
  String get setupHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get setupWorkout => 'Ghi nhận buổi tập đầu tiên';

  @override
  String get setupWeight => 'Ghi lại cân nặng cơ thể';

  @override
  String get setupMeasures => 'Đo các chỉ số vòng cơ thể';

  @override
  String get setupPhoto => 'Chụp bức ảnh vóc dáng đầu tiên';

  @override
  String get progressTitle => 'Tiến trình';

  @override
  String get tileVolume30 => 'Khối lượng · 30 ngày';

  @override
  String get tileAddWeight => 'Thêm cân nặng';

  @override
  String get heatToneTitle => 'Màu biểu đồ nhiệt';

  @override
  String get heatToneHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get thisWeekTitle => 'Tuần này';

  @override
  String get momentsEmptyTitle => 'Chưa có dữ liệu nào tại đây.';

  @override
  String get deletePhotoTitle => 'Xóa this photo?';

  @override
  String get deletePhotoBody => 'Bức ảnh này sẽ bị xóa khỏi dòng thời gian.';

  @override
  String get awardsEarned => 'Đã mở khóa';

  @override
  String get awardsLocked => 'Chưa đạt';

  @override
  String get awardStreak100Name => 'Một trăm ngày';

  @override
  String get awardWorkouts10Name => 'Mười buổi tập';

  @override
  String get awardWorkouts10Line => 'Mười buổi tập đầu tiên định hình sự kỷ luật.';

  @override
  String get awardWorkouts365Name => 'Ba trăm sáu mươi lăm buổi';

  @override
  String get awardWorkouts365Line => 'Một buổi tập cho mỗi ngày trong năm, từng bước vững chắc.';

  @override
  String get awardTonnes10Name => 'Mười tấn tạ';

  @override
  String get awardTonnes10Line => 'Mười nghìn kg tạ đã được bạn chinh phục.';

  @override
  String get awardHours100Name => 'Một trăm giờ';

  @override
  String get awardHours100Line => '100 giờ rèn luyện nghiêm túc dưới thanh tạ.';

  @override
  String awardWonOn(String date) {
    return 'Đạt được vào $date';
  }

  @override
  String awardProgressLabel(String value, String goal) {
    return '$value of $goal';
  }

  @override
  String badgeName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'gold': 'Gold',
      'blue': 'Blue',
      'green': 'Green',
      'other': 'Badge',
    });
    return '$_temp0';
  }

  @override
  String memberSince(String date) {
    return 'Thành viên từ $date';
  }

  @override
  String levelShort(int n) {
    return 'Cấp $n';
  }

  @override
  String levelToNext(int n, int next) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n workouts to level $next',
      one: '1 workout to level $next',
    );
    return '$_temp0';
  }

  @override
  String heightCm(int n) {
    return '$n cm';
  }

  @override
  String heatToneName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'ember': 'Ember',
      'green': 'Green',
      'blue': 'Blue',
      'mono': 'Grey',
      'other': 'Colour',
    });
    return '$_temp0';
  }

  @override
  String setsThisWeek(int n) {
    return '$n sets';
  }

  @override
  String weekOfGoal(int n, int goal) {
    return '$n of $goal this week';
  }

  @override
  String momentCount(int n) {
    return '$n photos';
  }

  @override
  String get badgeHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get momentsEmptyHint => 'Chưa có dữ liệu nào tại đây.';

  @override
  String get awardStreak100Line =>
      '100 ngày liên tục. Đây không còn là động lực nhất thời, đây là chính con người bạn.';

  @override
  String get coverLabel => 'ẢNH BÌA';

  @override
  String get removeCover => 'Xóa ảnh bìa';

  @override
  String get startTitle => 'Bắt đầu tập luyện';

  @override
  String get logTitle => 'Ghi nhận buổi tập';

  @override
  String get logHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get orStartFrom => 'Hoặc bắt đầu từ';

  @override
  String get pickExercisesOption => 'Chọn bài tập';

  @override
  String get chooseFocusOption => 'Chọn nhóm cơ tập hôm nay';

  @override
  String get plannedRoutine => 'ĐÃ LÊN KẾ HOẠCH';

  @override
  String get logWorkoutAction => 'GHI BUỔI TẬP';

  @override
  String get logging => 'ĐANG GHI';

  @override
  String get placesLabel => 'Địa điểm của tôi';

  @override
  String get undo => 'Hoàn tác';

  @override
  String get deleteSet => 'Xóa set';

  @override
  String get setDeleted => 'Set xóad';

  @override
  String get removeWarmup => 'Xóa khởi động';

  @override
  String get addWeightAction => 'Thêm mức tạ';

  @override
  String get workoutOverview => 'Buổi tập này';

  @override
  String get allExercisesShort => 'Tất cả';

  @override
  String setsDoneOf(int done, int total) {
    return '$done/$total sets';
  }

  @override
  String get nowLabel => 'Hiện tại';

  @override
  String get deleteWorkout => 'Xóa workout';

  @override
  String get deleteWorkoutBody => 'Buổi tập này và tất cả các hiệp tập sẽ bị xóa khỏi lịch sử.';

  @override
  String get themeAuto => 'Tự động theo hệ thống';

  @override
  String get themeAutoHint => 'Khớp với chế độ sáng tối của điện thoại.';

  @override
  String get demoSizeTitle => 'Kích thước hình minh họa';

  @override
  String get demoLarge => 'Lớn';

  @override
  String get demoSmall => 'Nhỏ';

  @override
  String get demoOff => 'Tắt';

  @override
  String get alarmStyleTitle => 'Kiểu thông báo nghỉ';

  @override
  String get alarmStyleLoud => 'Chuông lớn + Rung';

  @override
  String get alarmStyleQuiet => 'Chuông nhỏ';

  @override
  String get alarmStyleVibrate => 'Chỉ rung';

  @override
  String get alarmStyleHint => 'Tùy chỉnh cách báo khi kết thúc thời gian nghỉ giữa hiệp.';

  @override
  String get suggestedPicks => 'Gợi ý cho bạn';

  @override
  String get moreOptions => 'Tùy chọn khác';

  @override
  String get suggestInWorkouts => 'Gợi ý trong buổi tập nhanh';

  @override
  String get suggestInWorkoutsHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get dontSuggest => 'Không gợi ý lại';

  @override
  String get noLongerSuggested => 'Sẽ không gợi ý lại bài này';

  @override
  String get onbPlaceTitle => 'Bạn thường tập luyện ở đâu?';

  @override
  String get onbPlaceWhy => 'Chọn tất cả nơi bạn tập. Chúng tôi chỉ gợi ý các bài bạn có thể tập ở đó.';

  @override
  String get onbPlaceGear => 'Nơi đó có những dụng cụ gì?';

  @override
  String distanceCol(String unit) {
    return 'QUÃNG ĐƯỜNG ($unit)';
  }

  @override
  String get timeCol => 'THỜI GIAN';

  @override
  String get timeMinutesTitle => 'Thời gian (phút)';

  @override
  String get timeSecondsTitle => 'Thời gian (giây)';

  @override
  String distanceTitle(String unit) {
    return 'Quãng đường ($unit)';
  }

  @override
  String get holdLabel => 'Giữ';

  @override
  String get stopLabel => 'Dừng';

  @override
  String startHold(String time) {
    return 'Bắt đầu · $time';
  }

  @override
  String get exerciseTypeLabel => 'Cách tính bài tập';

  @override
  String get typeReps => 'Số lần & Mức tạ';

  @override
  String get typeTime => 'Thời gian';

  @override
  String get typeCardio => 'Quãng đường & Thời gian';

  @override
  String get exerciseTypeHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get howToLabel => 'Hướng dẫn thực hiện (tùy chọn)';

  @override
  String get howToHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get editExercise => 'Chỉnh sửa exercise';

  @override
  String get saveChanges => 'Lưu thay đổi';

  @override
  String get noStepsYet => 'Chưa có các bước hướng dẫn. Hãy tự viết theo cách tập của bạn.';

  @override
  String get addSteps => 'Viết các bước hướng dẫn';

  @override
  String get setTypeRestPause => 'Rest-pause';

  @override
  String get planFormatNotes =>
      'Dùng đúng tên bài tập trong danh sách. \"sets\", \"reps\", \"weight\" (theo đơn vị đã chọn), \"rest\" theo giây.';

  @override
  String get planSets => 'Lên lịch hiệp tập';

  @override
  String get planSetsHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get autoValue => 'Tự động';

  @override
  String get clearPlan => 'Xóa kế hoạch';

  @override
  String get planChip => 'Kế hoạch';

  @override
  String get shareRoutine => 'Chia sẻ giáo án';

  @override
  String get shareWeek => 'Chia sẻ tuần của tôi';

  @override
  String get shareWeekHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String shareMessage(String name) {
    return '$name — open the file with FitMan to add it.';
  }

  @override
  String get importRoutines => 'Nhập giáo án';

  @override
  String get importPasteHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get pasteAction => 'Dán';

  @override
  String routineCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(n, locale: localeName, other: '$n giáo án');
    return '$_temp0';
  }

  @override
  String get useTheirSchedule => 'Áp dụng cả lịch tập tuần';

  @override
  String get useTheirScheduleHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get addToMyRoutines => 'Thêm vào giáo án của tôi';

  @override
  String routinesAdded(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n routines added',
      one: '1 routine added',
    );
    return '$_temp0';
  }

  @override
  String get nothingToImport => 'Không có nội dung nào FitMan có thể đọc được';

  @override
  String get aiStepCopy => 'Sao chép yêu cầu. Nội dung gồm danh sách bài tập và định dạng FitMan hiểu được.';

  @override
  String get aiStepAsk => 'Dán vào bất kỳ AI nào và nêu yêu cầu: số ngày/tuần, mục tiêu, lộ trình.';

  @override
  String get aiStepPaste => 'Dán câu trả lời của AI vào bên dưới và nhập vào. Không cần lưu file.';

  @override
  String get copyForAi => 'Sao chép cho AI';

  @override
  String get copiedDone => 'Đã sao chép';

  @override
  String get aiPasteHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get importAction => 'Nhập vào';

  @override
  String get showFormat => 'Xem định dạng mẫu';

  @override
  String get shareAsFile => 'Chia sẻ dưới dạng tệp tin';

  @override
  String get recoveryTab => 'Phục hồi';

  @override
  String recoveryOverall(int pct) {
    return 'Cơ thể đã phục hồi $pct%';
  }

  @override
  String get recoveryAllFresh => 'Toàn bộ cơ bắp đã phục hồi. Hôm nay rất thích hợp để tập luyện!';

  @override
  String recoveryStill(String muscles) {
    return 'Còn đang phục hồi: $muscles';
  }

  @override
  String get recoveryTired => 'Mệt mỏi';

  @override
  String get recoveryFresh => 'Sung sức';

  @override
  String get recoveryHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String recoveryPct(int pct) {
    return '$pct% recovered';
  }

  @override
  String readyInHours(int h) {
    return 'sẵn sàng sau ~$h giờ';
  }

  @override
  String get tplAbcd => 'Lịch 4 ngày: Ngực - Tay sau, Lưng - Tay trước, Chân, Vai - Bụng.';

  @override
  String get tplAbcde => 'Lịch 5 ngày, mỗi ngày 1 nhóm cơ: Ngực, Lưng, Chân, Vai, Tay.';

  @override
  String get elapsedCaps => 'ĐÃ TẬP';

  @override
  String get tapToSkip => 'Chạm để bỏ qua';

  @override
  String get tapToStop => 'Chạm để dừng lại';

  @override
  String get screenLocked => 'Màn hình đã khóa';

  @override
  String get lockedHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get liveDoneSet => 'Đã xong hiệp';

  @override
  String get liveSkipRest => 'Bỏ qua nghỉ';

  @override
  String get livePause => 'Tạm dừng';

  @override
  String get liveResume => 'Tiếp tục';

  @override
  String get liveNext => 'Tiếp tục';

  @override
  String liveUpNext(String name) {
    return 'Bài tiếp theo: $name';
  }

  @override
  String get stickerOpen => 'Chia sẻ cùng ảnh';

  @override
  String get stickerNoPhoto => 'Không có ảnh';

  @override
  String get stickerWorkout => 'Buổi tập';

  @override
  String get stickerStreak => 'Chuỗi ngày';

  @override
  String get stickerDate => 'Ngày tập';

  @override
  String get stickerHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get stickerSaved => 'Lưud to your gallery';

  @override
  String get stickerWeek => 'Tuần này';

  @override
  String get getReady => 'Chuẩn bị';

  @override
  String get stickerGallery => 'Thư viện ảnh';

  @override
  String get stickerCamera => 'Máy ảnh';

  @override
  String get shareIntroTitle => 'Chia sẻ giáo án này';

  @override
  String get shareIntroBody =>
      'Gửi cho bạn bè hoặc người tập cùng. Họ có thể mở và thêm ngay vào FitMan với đầy đủ hiệp và mức tạ.';

  @override
  String get removedFromRoutine => 'Đã xóa khỏi giáo án';

  @override
  String get radarTitle => 'Tháng này';

  @override
  String get radarHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get radarEmpty => 'Chưa có dữ liệu nào tại đây.';

  @override
  String get radarBalanced => 'Khối lượng tập phân bổ rất cân bằng';

  @override
  String radarFocus(String list) {
    return 'Cần tập thêm: $list';
  }

  @override
  String get countdownReady => 'Chuẩn bị bắt đầu';

  @override
  String get countdownSkip => 'Chạm để bắt đầu ngay';

  @override
  String get countdownSetting => 'Đếm ngược 3 giây trước hiệp';

  @override
  String get effortSetting => 'Thang đo độ gắng sức';

  @override
  String get effortHint => 'RPE (Mức độ gắng sức 1-10) hoặc RIR (Số lần còn có thể tập trước khi thất bại).';

  @override
  String get rirTitle => 'REP DỰ TRỮ (RIR)';

  @override
  String get rirHint => 'Thông tin hướng dẫn tính năng.';

  @override
  String get addWeekWidget => 'Tiện ích tiến trình tuần';

  @override
  String get gamificationSetting => 'Huy hiệu & Thành tích';

  @override
  String get vietnameseMealsTitle => 'BỮA ĂN MÓN VIỆT';

  @override
  String get vietnameseMealsDesc => 'Dinh dưỡng thể hình chuẩn người Việt';

  @override
  String get vietnameseMealsHomeTitle => 'Thực đơn món Việt hôm nay';

  @override
  String get vietnameseMealsHomeSub => 'Phở, Cơm tấm, Ức gà, Bún chả... Tích chọn & đếm Macros';

  @override
  String get viewMeals => 'Xem bữa ăn';
}
