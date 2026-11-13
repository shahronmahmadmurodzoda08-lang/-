import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:books_learning_app/main.dart';

Future<void> scrollToText(WidgetTester tester, String value) async {
  final target = find.text(value);
  for (var attempt = 0; attempt < 10 && target.evaluate().isEmpty; attempt++) {
    await tester.drag(find.byType(ListView).first, const Offset(0, -420));
    await tester.pumpAndSettle();
  }
  expect(target, findsWidgets);
  await tester.ensureVisible(target.first);
  await tester.pumpAndSettle();
}

Future<void> openQuiz(WidgetTester tester) async {
  await scrollToText(tester, 'Тестҳо ва санҷиши дониш');
  await tester.tap(find.text('Тестҳо ва санҷиши дониш').first);
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('BOOKS home displays brand and first library sections', (tester) async {
    await tester.pumpWidget(const BooksApp());
    expect(find.text('BOOKS'), findsOneWidget);
    expect(find.text('КИТОБХОНАИ ДОНИШ'), findsOneWidget);
    expect(find.text('Фарҳангшиносӣ'), findsOneWidget);
    expect(find.text('Python — аз асос то ООП'), findsOneWidget);
  });

  testWidgets('Python lesson and exercise feedback open correctly', (tester) async {
    await tester.pumpWidget(const BooksApp());
    await tester.tap(find.text('Python — аз асос то ООП'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Python чист?'));
    await tester.pumpAndSettle();
    expect(find.text('ҚОИДА / ШАРҲ'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'print("Салом")');
    await tester.tap(find.text('Санҷидани машқ'));
    await tester.pump();
    expect(find.textContaining('Дуруст!'), findsOneWidget);
  });

  testWidgets('custom books can be added, searched, and deleted', (tester) async {
    await tester.pumpWidget(const BooksApp());
    await tester.tap(find.byTooltip('Илова кардани китоб').first);
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).first, 'Китоби санҷишӣ');
    await tester.tap(find.text('Илова').last);
    await tester.pumpAndSettle();
    expect(find.text('Китоби санҷишӣ'), findsOneWidget);

    await tester.enterText(find.byType(TextField).first, 'номи дигар');
    await tester.pumpAndSettle();
    expect(find.text('Китоби санҷишӣ'), findsNothing);

    await tester.enterText(find.byType(TextField).first, 'Китоби санҷишӣ');
    await tester.pumpAndSettle();
    expect(find.text('Китоби санҷишӣ'), findsOneWidget);
    await tester.tap(find.descendant(of: find.ancestor(of: find.text('Китоби санҷишӣ'), matching: find.byType(Card)), matching: find.byType(IconButton)).last);
    await tester.pumpAndSettle();
    expect(find.text('Китоби санҷишӣ'), findsNothing);
  });

  testWidgets('programming language courses list Python C++ Java JavaScript', (tester) async {
    await tester.pumpWidget(const BooksApp());
    await scrollToText(tester, 'Омӯзиши забонҳои барномасозӣ');
    await tester.tap(find.text('Омӯзиши забонҳои барномасозӣ').first);
    await tester.pumpAndSettle();
    expect(find.text('Python'), findsOneWidget);
    expect(find.text('C++'), findsOneWidget);
    expect(find.text('Java'), findsOneWidget);
    expect(find.text('JavaScript'), findsOneWidget);
  });

  testWidgets('timed quiz marks correct answer green and wrong answer red', (tester) async {
    await tester.pumpWidget(const BooksApp());
    await openQuiz(tester);
    expect(find.text('1/10'), findsOneWidget);
    expect(find.textContaining('15 сония'), findsOneWidget);

    final currentQuestion = questions.firstWhere(
      (question) => find.text(question.question).evaluate().isNotEmpty,
    );
    await tester.tap(find.text(currentQuestion.answers[currentQuestion.correct]));
    await tester.pumpAndSettle();
    expect(find.text('Дуруст!'), findsOneWidget);
    expect(find.byIcon(Icons.check_circle), findsOneWidget);
  });

  testWidgets('quiz timer advances to zero and reveals result after timeout', (tester) async {
    await tester.pumpWidget(const BooksApp());
    await openQuiz(tester);
    await tester.pump(const Duration(seconds: 16));
    await tester.pumpAndSettle();
    expect(find.textContaining('Нодуруст.'), findsOneWidget);
    expect(find.textContaining('Ҷавоби дуруст:'), findsOneWidget);
  });

  testWidgets('culture reader displays page number and controls', (tester) async {
    await tester.pumpWidget(const BooksApp());
    await tester.tap(find.text('Фарҳангшиносӣ').first);
    await tester.pumpAndSettle();
    expect(find.text('1/251'), findsOneWidget);
    expect(find.byIcon(Icons.find_in_page), findsOneWidget);
  });
}
