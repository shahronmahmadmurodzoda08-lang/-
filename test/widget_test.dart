import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:books_learning_app/main.dart';

void main() {
  testWidgets('BOOKS library renders core modules', (tester) async {
    await tester.pumpWidget(const BooksApp());
    expect(find.text('BOOKS'), findsOneWidget);
    expect(find.text('Python — аз асос то ООП'), findsOneWidget);
    expect(find.text('Фарҳангшиносӣ'), findsOneWidget);
    expect(find.text('Тестҳо ва санҷиши дониш'), findsOneWidget);
    expect(find.text('Омӯзиши забонҳои барномасозӣ'), findsOneWidget);
  });

  testWidgets('Python course opens lesson detail and exercise checker', (tester) async {
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

  testWidgets('user can add, search, and delete a custom book', (tester) async {
    await tester.pumpWidget(const BooksApp());
    await tester.tap(find.byTooltip('Илова кардани китоб').first);
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).first, 'Китоби санҷишӣ');
    await tester.tap(find.text('Илова').last);
    await tester.pumpAndSettle();
    expect(find.text('Китоби санҷишӣ'), findsOneWidget);
    await tester.enterText(find.byType(TextField).first, 'номаълум');
    await tester.pumpAndSettle();
    expect(find.text('Китоби санҷишӣ'), findsNothing);
    await tester.enterText(find.byType(TextField).first, 'Китоби санҷишӣ');
    await tester.pumpAndSettle();
    expect(find.text('Китоби санҷишӣ'), findsOneWidget);
    await tester.tap(find.byTooltip('Нест кардан'));
    await tester.pumpAndSettle();
    expect(find.text('Китоби санҷишӣ'), findsNothing);
  });


  testWidgets('programming language paths show Python C++ Java JavaScript', (tester) async {
    await tester.pumpWidget(const BooksApp());
    await tester.scrollUntilVisible(find.text('Омӯзиши забонҳои барномасозӣ'), 350, scrollable: find.byType(Scrollable).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Омӯзиши забонҳои барномасозӣ'));
    await tester.pumpAndSettle();
    expect(find.text('Python'), findsOneWidget);
    expect(find.text('C++'), findsOneWidget);
    expect(find.text('Java'), findsOneWidget);
    expect(find.text('JavaScript'), findsOneWidget);
  });

  testWidgets('timed quiz displays countdown and color feedback', (tester) async {
    await tester.pumpWidget(const BooksApp());
    await tester.scrollUntilVisible(find.text('Тестҳо ва санҷиши дониш'), 350, scrollable: find.byType(Scrollable).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Тестҳо ва санҷиши дониш'));
    await tester.pumpAndSettle();
    expect(find.textContaining('15 сония'), findsOneWidget);
  });

  testWidgets('culture reader shows page navigation', (tester) async {
    await tester.pumpWidget(const BooksApp());
    await tester.tap(find.text('Фарҳангшиносӣ').last);
    await tester.pumpAndSettle();
    expect(find.text('1/251'), findsOneWidget);
    expect(find.text('Баъдӣ'), findsOneWidget);
  });

  testWidgets('quiz starts with ten questions', (tester) async {
    await tester.pumpWidget(const BooksApp());
    await tester.ensureVisible(find.text('Тестҳо ва санҷиши дониш'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Тестҳо ва санҷиши дониш'));
    await tester.pumpAndSettle();
    expect(find.text('1/10'), findsOneWidget);
  });
}