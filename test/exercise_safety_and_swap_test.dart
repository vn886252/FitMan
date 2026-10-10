import 'package:flutter_test/flutter_test.dart';
import 'package:gymmane/catalog/exercise_catalog.dart';
import 'package:gymmane/state/fit_state.dart';

void main() {
  setUp(() {
    fit.sessions.clear();
    fit.selectedMuscles.clear();
    fit.sessionPicks.clear();
  });

  test('Barbell Good Morning and dangerous lifts are deprioritized for intermediate (6 months) users', () {
    fit.profile.experienceLevel = 'intermediate';

    final goodMorning = kExercises.firstWhere((e) => e.name.toLowerCase().contains('good morning'));
    final rank = fit.rankExerciseForProfile(goodMorning);
    expect(rank, 99, reason: 'Good morning must be ranked 99 for intermediate lifters to prevent injury');

    // Seated leg curl or machine/dumbbell safe exercises should have rank <= 2
    final seatedLegCurl = kExercises.firstWhere((e) => e.name.toLowerCase() == 'seated leg curl');
    expect(fit.rankExerciseForProfile(seatedLegCurl), lessThanOrEqualTo(2));

    // When picking default exercises for hamstrings, Barbell Good Morning must NOT be chosen
    fit.selectedMuscles.clear();
    fit.toggleMuscle('hamstrings');
    fit.trainContinue();
    final picks = fit.sessionPicks;
    expect(picks.contains(goodMorning.id), isFalse, reason: 'Good Morning should not be in default picks for 6-month lifters');
  });

  test('getAlternativeExercises returns safe same-muscle exercises excluding current', () {
    final goodMorning = kExercises.firstWhere((e) => e.name.toLowerCase().contains('good morning'));
    final alts = fit.getAlternativeExercises(goodMorning.id);

    expect(alts, isNotEmpty);
    expect(alts.any((e) => e.id == goodMorning.id), isFalse, reason: 'Current exercise must be excluded');
    expect(alts.every((e) => e.primary == 'hamstrings'), isTrue, reason: 'All alternatives must target the same muscle');

    // The top alternative should be safe (rank <= 3)
    final top = alts.first;
    expect(fit.rankExerciseForProfile(top), lessThanOrEqualTo(3));
  });

  test('swapSessionExercise successfully replaces current exercise in live session', () {
    fit.sessions.clear();
    fit.selectedMuscles.clear();
    fit.toggleMuscle('chest');
    fit.trainContinue();
    fit.startSession();

    final session = fit.session;
    expect(session, isNotNull);
    expect(session!.exercises, isNotEmpty);

    final originalEx = session.exercises.first;
    final alts = fit.getAlternativeExercises(originalEx.id);
    expect(alts, isNotEmpty);

    final targetEx = alts.first;
    expect(targetEx.id, isNot(originalEx.id));

    fit.swapSessionExercise(0, targetEx.id);

    expect(session.exercises.first.id, targetEx.id);
    expect(session.exercises.first.name, targetEx.name);
    expect(session.exercises.first.primary, targetEx.primary);
    expect(session.exercises.first.sets, isNotEmpty);
  });

  test('swapRoutineExercise successfully swaps exercise inside a routine', () {
    fit.routines.clear();
    final rId = fit.createRoutine('Test Routine');
    final bench = kExercises.firstWhere((e) => e.name.toLowerCase().contains('bench press'));
    final dumbbellEx = kExercises.firstWhere((e) => e.equipment.toLowerCase() == 'dumbbell' && e.primary == 'chest');

    fit.toggleRoutineExercise(rId, bench.id);
    expect(fit.routines.single.exerciseIds, contains(bench.id));

    fit.swapRoutineExercise(rId, bench.id, dumbbellEx.id);
    expect(fit.routines.single.exerciseIds, contains(dumbbellEx.id));
    expect(fit.routines.single.exerciseIds, isNot(contains(bench.id)));
  });
}
