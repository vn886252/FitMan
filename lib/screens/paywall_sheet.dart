import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

import '../services/subscription_service.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/glass.dart';
import '../widgets/liquid_notch.dart';
import '../widgets/ui_kit.dart';

Future<void> showPaywallSheet(BuildContext context) {
  return showAppSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (sheet) => const PaywallSheet(),
  );
}

class PaywallSheet extends StatefulWidget {
  const PaywallSheet({super.key});

  @override
  State<PaywallSheet> createState() => _PaywallSheetState();
}

class _PaywallSheetState extends State<PaywallSheet> {
  // 'lifetime' hoặc 'weekly'
  String _selectedPlan = 'lifetime';
  bool _isProcessing = false;

  void _onSelectPlan(String plan) {
    HapticFeedback.selectionClick();
    setState(() => _selectedPlan = plan);
  }

  void _onConfirmPay() {
    if (_isProcessing) return;

    final sub = SubscriptionService.instance;
    final isLifetime = _selectedPlan == 'lifetime';
    final amountText = isLifetime ? '199.000đ' : '20.000đ';
    final rawAmount = isLifetime ? 199000 : 20000;
    final planName = isLifetime ? '${"Trọn Đời VIP"}' : '${"Gói 1 Tuần"}';
    const bankName = 'Techcombank';
    const accountNumber = '3386111168';
    const accountName = 'HO KINH DOANH CUA HANG FITMAN';
    const transferContent = 'FITMAN PRO';

    final qrUrl = 'https://img.vietqr.io/image/TCB-$accountNumber-compact2.png?amount=$rawAmount&addInfo=$transferContent&accountName=${Uri.encodeComponent(accountName)}';

    showAppDialog<void>(
      context: context,
      builder: (dlgContext) => AlertDialog(
        backgroundColor: context.gc.bgRaised,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        titlePadding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        contentPadding: const EdgeInsets.symmetric(horizontal: 18),
        actionsPadding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFE51A24).withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: const Icon(PhosphorIconsFill.qrCode, color: Color(0xFFE51A24), size: 24),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${"Thanh Toán VietQR"}',
                    style: AppTheme.f(17, weight: FontWeight.w800, color: context.gc.text),
                  ),
                  Text(
                    '${"Kích hoạt "} $planName · $amountText',
                    style: AppTheme.f(12.5, weight: FontWeight.w600, color: const Color(0xFFF47E1D)),
                  ),
                ],
              ),
            ),
          ],
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.12),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      qrUrl,
                      width: 230,
                      height: 260,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return const SizedBox(
                          width: 230,
                          height: 260,
                          child: Center(
                            child: CircularProgressIndicator(color: Color(0xFFE51A24), strokeWidth: 2.5),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stack) {
                        return Container(
                          width: 230,
                          height: 180,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(PhosphorIconsRegular.wifiSlash, color: Colors.grey, size: 36),
                              const SizedBox(height: 8),
                              Text(
                                '${"Quý khách vui lòng chuyển khoản theo thông tin bên dưới."}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12, color: Colors.black87),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${"Mở app ngân hàng bất kỳ để quét mã tự động 24/7"}',
                  style: AppTheme.f(11.5, weight: FontWeight.w500, color: context.gc.textTertiary),
                ),
                const SizedBox(height: 14),
                _qrDetailTile(
                  context: dlgContext,
                  label: '${"Ngân hàng"}',
                  value: '$bankName (TCB)',
                ),
                _qrDetailTile(
                  context: dlgContext,
                  label: '${"Số tài khoản"}',
                  value: accountNumber,
                  copyValue: accountNumber,
                ),
                _qrDetailTile(
                  context: dlgContext,
                  label: '${"Chủ tài khoản"}',
                  value: accountName,
                ),
                _qrDetailTile(
                  context: dlgContext,
                  label: '${"Số tiền"}',
                  value: amountText,
                  copyValue: '$rawAmount',
                ),
                _qrDetailTile(
                  context: dlgContext,
                  label: '${"Nội dung chuyển khoản"}',
                  value: transferContent,
                  copyValue: transferContent,
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF54B979).withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(PhosphorIconsRegular.cloudCheck, size: 16, color: Color(0xFF54B979)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '${"Gói VIP tự động đồng bộ lên Cloud ngay khi kích hoạt."}',
                          style: AppTheme.f(11.5, weight: FontWeight.w600, color: const Color(0xFF54B979)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dlgContext),
            child: Text('${"Đóng"}', style: TextStyle(color: context.gc.textTertiary)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF47E1D),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              elevation: 0,
            ),
            onPressed: () async {
              Navigator.pop(dlgContext);
              setState(() => _isProcessing = true);
              await sub.activateVip(plan: _selectedPlan);
              if (!mounted) return;
              setState(() => _isProcessing = false);
              Navigator.of(context).pop();
              showNotchToast(
                context,
                '${"🎉 Kích hoạt thành công "} $planName!',
                subtitle: '${"Toàn bộ tính năng đã được mở khóa vĩnh viễn."}',
                icon: PhosphorIconsFill.crown,
                accent: const Color(0xFFF47E1D),
              );
            },
            child: Text('${"Tôi Đã Chuyển Tiền"}', style: const TextStyle(fontWeight: FontWeight.w800)),
          ),
        ],
      ),
    );
  }

  Widget _qrDetailTile({
    required BuildContext context,
    required String label,
    required String value,
    String? copyValue,
  }) {
    final gc = context.gc;
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: gc.bgRaised2,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: gc.border.withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTheme.f(10.5, weight: FontWeight.w600, color: gc.textTertiary),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: AppTheme.f(13, weight: FontWeight.w700, color: gc.text),
                ),
              ],
            ),
          ),
          if (copyValue != null)
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Clipboard.setData(ClipboardData(text: copyValue));
                HapticFeedback.lightImpact();
                showNotchToast(
                  context,
                  '${"Đã sao chép: "} $copyValue',
                  icon: PhosphorIconsRegular.copy,
                  accent: const Color(0xFFF47E1D),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFFF47E1D).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(PhosphorIconsRegular.copy, size: 16, color: Color(0xFFF47E1D)),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final gc = context.gc;

    return ListenableBuilder(
      listenable: SubscriptionService.instance,
      builder: (context, _) {
        final sub = SubscriptionService.instance;
        final isVip = sub.isVip;
        final isTrial = sub.isTrialActive;
        final trialDays = sub.trialDaysRemaining;
        final earlyBirdSlots = sub.remainingEarlyBirdSlots;
        final timeLeft = sub.earlyBirdTimeRemaining;

        final hoursStr = timeLeft.inHours.toString().padLeft(2, '0');
        final minStr = (timeLeft.inMinutes % 60).toString().padLeft(2, '0');
        final secStr = (timeLeft.inSeconds % 60).toString().padLeft(2, '0');

        return Container(
          padding: EdgeInsets.fromLTRB(20, 16, 20, 24 + MediaQuery.of(context).viewInsets.bottom),
          constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * 0.92),
          decoration: BoxDecoration(
            color: gc.bgRaised,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SheetHandle(),
                const SizedBox(height: 14),

                // Top Status Badge
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: isVip
                          ? const Color(0xFFF47E1D).withValues(alpha: 0.16)
                          : (isTrial
                              ? const Color(0xFF54B979).withValues(alpha: 0.16)
                              : Colors.red.withValues(alpha: 0.16)),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: isVip
                            ? const Color(0xFFF47E1D).withValues(alpha: 0.4)
                            : (isTrial
                                ? const Color(0xFF54B979).withValues(alpha: 0.4)
                                : Colors.red.withValues(alpha: 0.4)),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isVip
                              ? PhosphorIconsFill.crown
                              : (isTrial ? PhosphorIconsFill.timer : PhosphorIconsFill.warningCircle),
                          size: 15,
                          color: isVip
                              ? const Color(0xFFF47E1D)
                              : (isTrial ? const Color(0xFF54B979) : Colors.red),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          isVip
                              ? '${"THÀNH VIÊN VIP CHÍNH THỨC"}'
                              : (isTrial
                                  ? '${"7 NGÀY DÙNG THỬ MIỄN PHÍ · CÒN "} $trialDays ${"NGÀY"}'
                                  : '${"ĐÃ HẾT HẠN DÙNG THỬ"}'),
                          style: AppTheme.f(
                            11.5,
                            weight: FontWeight.w800,
                            color: isVip
                                ? const Color(0xFFF47E1D)
                                : (isTrial ? const Color(0xFF54B979) : Colors.red),
                            letterSpacing: 0.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Main Title & Subtitle
                Center(
                  child: Text(
                    '${"FitMan VIP · Nâng Tầm Thể Hình"}',
                    style: AppTheme.f(23, weight: FontWeight.w900, color: gc.text),
                  ),
                ),
                const SizedBox(height: 6),
                Center(
                  child: Text(
                    '${"Mở khóa toàn diện giáo án cá nhân, thực đơn món Việt và đồng bộ Cloud không giới hạn"}',
                    textAlign: TextAlign.center,
                    style: AppTheme.f(13, weight: FontWeight.w500, color: gc.textSecondary, height: 1.35),
                  ),
                ),
                const SizedBox(height: 18),

                // Early Bird Urgency Card (Chỉ 200 suất · 2 ngày)
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFF47E1D).withValues(alpha: 0.18),
                        const Color(0xFFD6670E).withValues(alpha: 0.08),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: const Color(0xFFF47E1D).withValues(alpha: 0.35)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: Color(0xFFF47E1D),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(PhosphorIconsFill.fire, size: 16, color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${"ƯU ĐÃI EARLY BIRD · GIỚI HẠN 200 SUẤT"}',
                                  style: AppTheme.f(12,
                                      weight: FontWeight.w900,
                                      color: const Color(0xFFF47E1D),
                                      letterSpacing: 0.5),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '${"Chỉ còn "}$earlyBirdSlots${" / 200 suất cuối cùng giảm 60%"}',
                                  style: AppTheme.f(13, weight: FontWeight.w700, color: gc.text),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Progress Bar
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: (200 - earlyBirdSlots) / 200.0,
                          backgroundColor: gc.bgRaised2,
                          color: const Color(0xFFF47E1D),
                          minHeight: 6,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Realtime Countdown Timer (2 Days)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(PhosphorIconsRegular.clockCountdown,
                              size: 15, color: const Color(0xFFF47E1D)),
                          const SizedBox(width: 6),
                          Text(
                            '${"Kết thúc ưu đãi sau: "}',
                            style: AppTheme.f(12, weight: FontWeight.w600, color: gc.textSecondary),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                            decoration: BoxDecoration(
                              color: gc.bgRaised2,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              '$hoursStr : $minStr : $secStr',
                              style: AppTheme.f(12.5,
                                  weight: FontWeight.w900,
                                  color: const Color(0xFFF47E1D),
                                  letterSpacing: 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),

                // 2 GÓI LỰA CHỌN (199k Trọn đời & 20k/Tuần)
                // Gói 1: TRỌN ĐỜI 199k (Best Seller)
                _buildPlanCard(
                  id: 'lifetime',
                  isSelected: _selectedPlan == 'lifetime',
                  title: '${"VIP Trọn Đời (Lifetime)"}',
                  badge: '${"TIẾT KIỆM 60% · HOT NHẤT"}',
                  price: '${"199.000đ"}',
                  originalPrice: '${"500.000đ"}',
                  subtitle: '${"Thanh toán 1 lần duy nhất · Dùng vĩnh viễn, không gia hạn"}',
                  icon: PhosphorIconsFill.crown,
                  accentColor: const Color(0xFFF47E1D),
                  gc: gc,
                ),
                const SizedBox(height: 12),

                // Gói 2: 1 TUẦN 20k
                _buildPlanCard(
                  id: 'weekly',
                  isSelected: _selectedPlan == 'weekly',
                  title: '${"Gói 1 Tuần"}',
                  badge: '${"LINH HOẠT"}',
                  price: '${"20.000đ / tuần"}',
                  subtitle: '${"Chỉ ~2.800đ mỗi ngày · Gia hạn hàng tuần, hủy bất cứ lúc nào"}',
                  icon: PhosphorIconsFill.calendarCheck,
                  accentColor: gc.accent,
                  gc: gc,
                ),
                const SizedBox(height: 20),

                // QUYỀN LỢI ĐẶC QUYỀN VIP
                Text(
                  '${"QUYỀN LỢI ĐẶC QUYỀN DÀNH CHO BẠN:"}',
                  style: AppTheme.f(12, weight: FontWeight.w800, color: gc.textTertiary, letterSpacing: 0.8),
                ),
                const SizedBox(height: 12),
                _buildBenefitRow(
                  icon: PhosphorIconsFill.cloudCheck,
                  iconColor: const Color(0xFF4A9EEB),
                  title: '${"Lưu trên Cloud · Đổi máy đăng nhập tập tiếp"}',
                  desc: '${"Dữ liệu bài tập, thành tích và lịch tuần đồng bộ Google Cloud tức thì, không bao giờ mất."}',
                  gc: gc,
                ),
                const SizedBox(height: 10),
                _buildBenefitRow(
                  icon: PhosphorIconsFill.barbell,
                  iconColor: const Color(0xFFF47E1D),
                  title: '${"Trọn bộ Giáo án Chuyên gia & Cá nhân hóa"}',
                  desc: '${"Mở khóa toàn bộ giáo án Giảm mỡ nhanh, Tăng cơ vạm vỡ, PPL 6 ngày và Calisthenics."}',
                  gc: gc,
                ),
                const SizedBox(height: 10),
                _buildBenefitRow(
                  icon: PhosphorIconsFill.forkKnife,
                  iconColor: const Color(0xFF54B979),
                  title: '${"Thực đơn món Việt 7 ngày chuẩn Macro"}',
                  desc: '${"Tự động phân bổ dinh dưỡng từng bữa ăn món Việt theo chiều cao, cân nặng và mục tiêu của bạn."}',
                  gc: gc,
                ),
                const SizedBox(height: 10),
                _buildBenefitRow(
                  icon: PhosphorIconsFill.chartLineUp,
                  iconColor: const Color(0xFFE8B84B),
                  title: '${"Phân tích Thể hình & Khối lượng tạ chuyên sâu"}',
                  desc: '${"Theo dõi chỉ số Volume nâng tạ, chu kỳ Mesocycle / Deload, 1RM và số đo cơ thể chi tiết."}',
                  gc: gc,
                ),
                const SizedBox(height: 10),
                _buildBenefitRow(
                  icon: PhosphorIconsFill.shieldCheck,
                  iconColor: Colors.purpleAccent,
                  title: '${"Trải nghiệm hoàn toàn không quảng cáo"}',
                  desc: '${"Ứng dụng mượt mà 100%, bảo mật dữ liệu tuyệt đối và hỗ trợ kỹ thuật ưu tiên 24/7."}',
                  gc: gc,
                ),
                const SizedBox(height: 24),

                // NÚT KÍCH HOẠT CHÍNH
                PrimaryButton(
                  label: _selectedPlan == 'lifetime'
                      ? '${"⚡ Nâng Cấp Trọn Đời (199.000đ)"}'
                      : '${"Bắt Đầu Gói Tuần (20.000đ)"}',
                  bg: const Color(0xFFF47E1D),
                  fg: Colors.white,
                  height: 56,
                  onTap: _onConfirmPay,
                ),
                const SizedBox(height: 12),
                Center(
                  child: Text(
                    '${"Cam kết hoàn tiền trong 7 ngày nếu không hài lòng · Hỗ trợ 24/7"}',
                    style: AppTheme.f(11, weight: FontWeight.w500, color: gc.textTertiary),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPlanCard({
    required String id,
    required bool isSelected,
    required String title,
    required String? badge,
    required String price,
    String? originalPrice,
    required String subtitle,
    required IconData icon,
    required Color accentColor,
    required GymColors gc,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _onSelectPlan(id),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? accentColor.withValues(alpha: 0.12) : gc.bgRaised2,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? accentColor : gc.border,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: isSelected ? accentColor : gc.bgRaised,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 22, color: isSelected ? Colors.white : gc.textSecondary),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: AppTheme.f(15.5, weight: FontWeight.w800, color: gc.text),
                        ),
                      ),
                      if (badge != null)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: accentColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            badge,
                            style: const TextStyle(
                                fontSize: 9.5, fontWeight: FontWeight.w900, color: Colors.white),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        price,
                        style: AppTheme.f(18, weight: FontWeight.w900, color: accentColor),
                      ),
                      if (originalPrice != null) ...[
                        const SizedBox(width: 8),
                        Text(
                          originalPrice,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: gc.textTertiary,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: AppTheme.f(12, weight: FontWeight.w500, color: gc.textSecondary),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              isSelected ? PhosphorIconsFill.checkCircle : PhosphorIconsRegular.circle,
              size: 22,
              color: isSelected ? accentColor : gc.textTertiary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefitRow({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String desc,
    required GymColors gc,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha: 0.14),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 18, color: iconColor),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTheme.f(13.5, weight: FontWeight.w700, color: gc.text),
              ),
              const SizedBox(height: 2),
              Text(
                desc,
                style: AppTheme.f(12, weight: FontWeight.w500, color: gc.textSecondary, height: 1.3),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
