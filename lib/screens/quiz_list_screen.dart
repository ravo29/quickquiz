import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/mock_quiz_data.dart';
import '../widgets/category_card.dart';

class QuizListScreen extends StatefulWidget {
  const QuizListScreen({super.key});

  @override
  State<QuizListScreen> createState() => _QuizListScreenState();
}

class _QuizListScreenState extends State<QuizListScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredCategories = MockQuizData.categories.where((cat) {
      final query = _searchQuery.toLowerCase().trim();
      return cat.title.toLowerCase().contains(query) ||
          cat.description.toLowerCase().contains(query);
    }).toList();

    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    int crossAxisCount = 2;
    double childAspectRatio = 0.9;

    if (screenWidth > 900) {
      crossAxisCount = 4;
      childAspectRatio = 1.1;
    } else if (screenWidth > 600) {
      crossAxisCount = 3;
      childAspectRatio = 1.0;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Thèmes de Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Rechercher un thème (ex: Histoire, Géographie)...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchQuery = '';
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: filteredCategories.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.search_off, size: 64, color: Colors.grey),
                          const SizedBox(height: 12),
                          Text(
                            'Aucun thème ne correspond à "$_searchQuery"',
                            style: const TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ],
                      ),
                    )
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: childAspectRatio,
                      ),
                      itemCount: filteredCategories.length,
                      itemBuilder: (context, index) {
                        final category = filteredCategories[index];
                        return CategoryCard(
                          category: category,
                          onTap: () => context.push('/game/${category.id}'),
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