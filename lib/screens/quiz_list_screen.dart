import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../router/app_router.dart';
import '../services/mock_quiz_data.dart';
import '../models/quiz_category.dart';
import '../widgets/category_card.dart';

class QuizListScreen extends StatefulWidget {
  const QuizListScreen({super.key});

  @override
  State<QuizListScreen> createState() => _QuizListScreenState();
}

class _QuizListScreenState extends State<QuizListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<QuizCategory> get _filteredCategories {
    if (_query.trim().isEmpty) return MockQuizData.categories;
    final q = _query.toLowerCase();
    return MockQuizData.categories
        .where((c) =>
            c.title.toLowerCase().contains(q) ||
            c.description.toLowerCase().contains(q))
        .toList();
  }

  int _crossAxisCountFor(double width) {
    if (width >= 900) return 4; // grand écran / tablette paysage
    if (width >= 600) return 3; // tablette
    return 2; // mobile
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = _crossAxisCountFor(width);
    final categories = _filteredCategories;

    return Scaffold(
      appBar: AppBar(title: const Text('Thèmes de culture générale')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: (value) => setState(() => _query = value),
              decoration: const InputDecoration(
                hintText: 'Rechercher un thème...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: categories.isEmpty
                  ? const Center(child: Text('Aucun thème trouvé.'))
                  : GridView.builder(
                      itemCount: categories.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.95,
                      ),
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return CategoryCard(
                          category: category,
                          onTap: () => context.goNamed(
                            AppRouter.quizGame,
                            pathParameters: {'categoryId': category.id},
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}