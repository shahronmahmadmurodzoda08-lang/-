import 'package:flutter/material.dart';

void main() {
  runApp(const FarhangshinosApp());
}

class FarhangshinosApp extends StatelessWidget {
  const FarhangshinosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Фарҳангшиносӣ',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F1E8),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF315A3A),
        ),
      ),
      home: const BookHome(),
    );
  }
}

class BookHome extends StatelessWidget {
  const BookHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 24),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Image.asset(
                    'assets/cover.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'ФАРҲАНГШИНОСӢ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 7),
                const Text(
                  'Н. Тоҷов • К. Ҳусейнов • Р. Назаров • М. Тоҷев',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 18),
                FilledButton.icon(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(54),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ReaderScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.menu_book_rounded),
                  label: const Text(
                    'ХОНДАНИ КИТОБ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '251 саҳифа • офлайн • zoom • swipe',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReaderScreen extends StatefulWidget {
  const ReaderScreen({super.key});

  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  static const int totalPages = 251;

  late final PageController controller;
  int current = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void goToPage() {
    final input = TextEditingController(
      text: '${current + 1}',
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Ба саҳифа гузар'),
          content: TextField(
            controller: input,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Рақами саҳифа',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Бекор'),
            ),
            FilledButton(
              onPressed: () {
                final page = int.tryParse(input.text);

                if (page != null &&
                    page >= 1 &&
                    page <= totalPages) {
                  Navigator.pop(context);

                  controller.jumpToPage(page - 1);
                }
              },
              child: const Text('Гузар'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Фарҳангшиносӣ'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Ба саҳифа гузар',
            onPressed: goToPage,
            icon: const Icon(Icons.find_in_page_rounded),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Text('${current + 1}/$totalPages'),
            ),
          ),
        ],
      ),
      body: PageView.builder(
        controller: controller,
        itemCount: totalPages,
        onPageChanged: (index) {
          setState(() {
            current = index;
          });
        },
        itemBuilder: (_, index) {
          final asset =
              'assets/pages/${(index + 1).toString().padLeft(3, '0')}.jpg';

          return Container(
            color: Colors.white,
            child: InteractiveViewer(
              minScale: 1.0,
              maxScale: 4.0,
              panEnabled: true,
              scaleEnabled: true,
              boundaryMargin: const EdgeInsets.all(20),
              child: Center(
                child: Image.asset(
                  asset,
                  fit: BoxFit.contain,
                  errorBuilder: (_, error, stackTrace) {
                    return const Center(
                      child: Text(
                        'Саҳифа ёфт нашуд',
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 6, 12, 10),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: current == 0
                      ? null
                      : () {
                          controller.previousPage(
                            duration:
                                const Duration(milliseconds: 220),
                            curve: Curves.easeOut,
                          );
                        },
                  icon: const Icon(Icons.chevron_left),
                  label: const Text('Пешина'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FilledButton.icon(
                  onPressed: current == totalPages - 1
                      ? null
                      : () {
                          controller.nextPage(
                            duration:
                                const Duration(milliseconds: 220),
                            curve: Curves.easeOut,
                          );
                        },
                  icon: const Icon(Icons.chevron_right),
                  label: const Text('Баъдӣ'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
