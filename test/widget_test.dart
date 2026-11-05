import 'package:flutter_test/flutter_test.dart';
import 'package:books_learning_app/main.dart';
void main() {
 testWidgets('BOOKS library shows core modules', (tester) async {
  await tester.pumpWidget(const BooksApp());
  expect(find.text('Фарҳангшиносӣ'), findsOneWidget);
  expect(find.text('Python — аз асос то ООП'), findsOneWidget);
  expect(find.text('Тестҳо ва санҷиши дониш'), findsOneWidget);
 });
}
