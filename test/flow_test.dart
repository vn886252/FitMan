import 'package:flutter_test/flutter_test.dart';
import 'package:gymmane/models/workout.dart';
import 'package:gymmane/state/fit_state.dart';

void main() {
  test('full workout loop populates real stats', () {

    fit.sessions.clear();
    fit.selectedMuscles.clear();
    fit.route = 'home';

    expect(fit.hasData, false);
    expect(fit.currentStreak, 0);
    expect(fit.weekMask[fit.todayIndex], false);

    fit.startWorkout();
    fit.toggleMuscle('chest');
    expect(fit.selectedMuscles, ['chest']);

    fit.trainContinue();
    expect(fit.trainStep, 'review');
    fit.startSession();
    expect(fit.session, isNotNull);
    expect(fit.session!.exercises, isNotEmpty);

    final s = fit.session!;
    for (final e in s.exercises) {
      for (final st in e.sets) {
        st.done = true;
      }
    }
    fit.finishSession();

    expect(fit.sessions.length, 1);
    expect(fit.hasData, true);
    expect(fit.setsToday, greaterThan(0));
    expect(fit.volume30dKg, greaterThan(0));
    expect(fit.currentStreak, 1);
    expect(fit.weekMask[fit.todayIndex], true, reason: 'today should be checked');
    expect(fit.personalRecords, isNotEmpty);
    expect(fit.muscleSplit, isNotEmpty);

    fit.saveAndExit();
  });

  test('startFocusWorkout pre-selects suggested focus muscles and enters select step', () {
    fit.sessions.clear();
    fit.selectedMuscles.clear();
    fit.route = 'home';

    final suggested = fit.suggestedFocus;
    expect(suggested.muscles, isNotEmpty);

    fit.startFocusWorkout();

    expect(fit.route, 'train');
    expect(fit.trainStep, 'select');
    expect(fit.selectedMuscles, suggested.muscles);

    fit.trainContinue();
    expect(fit.trainStep, 'review');
    expect(fit.sessionPicks, isNotEmpty);
  });

  test('toggleResetPicks clears picks when non-empty, and restores defaults when empty', () {
    fit.sessions.clear();
    fit.selectedMuscles.clear();
    fit.startFocusWorkout();
    fit.trainContinue();

    expect(fit.sessionPicks, isNotEmpty);
    final defaultCount = fit.sessionPicks.length;

    fit.toggleResetPicks();
    expect(fit.sessionPicks, isEmpty);

    fit.toggleResetPicks();
    expect(fit.sessionPicks.length, defaultCount);

    fit.clearPicks();
    expect(fit.sessionPicks, isEmpty);

    fit.resetDefaultPicks();
    expect(fit.sessionPicks.length, defaultCount);
  });

  test('PPL cycle progresses through push, pull, and legs in sequence', () {
    fit.sessions.clear();
    final now = DateTime.now();

    // 1. Add Push session
    fit.sessions.add(LoggedSession(now, 1800, [
      LoggedExercise('bench', 'Bench', 'chest', [LoggedSet(10, 60)]),
    ]));
    // Next should be pull
    expect(fit.suggestedFocus.muscles, ['back', 'biceps', 'trapezius']);

    // 2. Add Pull session
    fit.sessions.add(LoggedSession(now.add(const Duration(minutes: 5)), 1800, [
      LoggedExercise('row', 'Row', 'back', [LoggedSet(10, 50)]),
    ]));
    // Next MUST be legs
    expect(fit.suggestedFocus.muscles, ['quads', 'hamstrings', 'glutes']);

    // 3. Add Legs session
    fit.sessions.add(LoggedSession(now.add(const Duration(minutes: 10)), 1800, [
      LoggedExercise('squat', 'Squat', 'quads', [LoggedSet(10, 70)]),
    ]));
    // Next should cycle back to push
    expect(fit.suggestedFocus.muscles, ['chest', 'shoulders', 'triceps']);
  });
}
