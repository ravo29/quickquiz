# QuickQuiz

Application Flutter de Quiz de Culture Générale, avec une charte graphique inspirée de Facebook (bleu `#1877F2`, mode clair/sombre style Messenger).

## 📱 Aperçu

QuickQuiz permet à l'utilisateur de tester ses connaissances sur 5 thèmes de culture générale : Géographie, Histoire, Sciences & Nature, Arts & Littérature et Cinéma. L'application propose également l'ajout de nouvelles questions via un formulaire validé.

### Fonctionnalités principales

- **5 catégories de quiz** : Géographie, Histoire, Sciences & Nature, Arts & Littérature, Cinéma
- **Interface responsive** : Adaptée pour mobile, tablette et desktop
- **Mode clair/sombre** : Thème dynamique avec persistance
- **Recherche et filtrage** : Recherche en temps réel des catégories
- **Ajout de questions** : Formulaire avec validation avancée
- **Animation et feedback** : Animations fluides et retour visuel immédiat
- **Score et statistiques** : Affichage détaillé des résultats avec performance

## 🏗️ Architecture du projet

Le projet suit une architecture en couches avec une séparation claire des responsabilités :

```
lib/
├── main.dart                 # Point d'entrée de l'application
├── models/                  # Modèles de données
│   ├── question.dart        # Modèle Question avec sérialisation
│   └── quiz_category.dart   # Modèle QuizCategory
├── screens/                 # Écrans de l'application
│   ├── home_screen.dart     # Écran d'accueil
│   ├── quiz_list_screen.dart # Liste des catégories avec recherche
│   ├── quiz_game_screen.dart # Écran de jeu de quiz
│   └── add_question_screen.dart # Formulaire d'ajout de question
├── widgets/                 # Widgets réutilisables
│   ├── answer_button.dart   # Bouton de réponse avec états
│   ├── category_card.dart   # Carte de catégorie
│   ├── custom_input_field.dart # Champ de saisie personnalisé
│   ├── progress_bar.dart    # Barre de progression
│   ├── score_card.dart      # Carte de score avec performance
│   ├── theme_toggle.dart    # Bouton de changement de thème
│   ├── filter_chip.dart     # Chip de filtrage
│   └── quiz_timer.dart      # Timer de quiz
├── services/                # Services et logique métier
│   ├── mock_quiz_data.dart  # Données mockées
│   └── theme_notifier.dart  # Gestion du thème
└── router/                  # Configuration de navigation
    └── app_router.dart      # Routes avec go_router
```

### Modèles de données

**Question** : Représente une question de quiz avec ses options et la réponse correcte
- `id` : Identifiant unique
- `categoryId` : Catégorie associée
- `questionText` : Texte de la question
- `options` : Liste des options de réponse
- `correctAnswerIndex` : Index de la réponse correcte
- Méthodes : `isCorrect()`, `fromMap()`, `toMap()`

**QuizCategory** : Représente une catégorie de quiz
- `id` : Identifiant unique
- `title` : Titre de la catégorie
- `description` : Description détaillée
- `icon` : Icône Material Design
- `color` : Couleur thème de la catégorie

### Navigation

L'application utilise `go_router` pour la navigation déclarative :
- `/` : HomeScreen (accueil)
- `/quiz-list` : QuizListScreen (liste des catégories)
- `/quiz-game/:categoryId` : QuizGameScreen (jeu de quiz)
- `/add-question` : AddQuestionScreen (ajout de question)

### Widgets personnalisés

L'application utilise **8+ widgets distincts** pour démontrer la variété de composants Flutter :

1. **CategoryCard** : Carte affichant une catégorie avec icône et description
2. **AnswerButton** : Bouton de réponse avec 4 états visuels (neutre, sélectionné, correct, incorrect)
3. **CustomInputField** : Champ de saisie avec label et validation intégrée
4. **ProgressBar** : Barre de progression personnalisable avec label
5. **ScoreCard** : Carte de score avec performance et actions
6. **ThemeToggle** : Bouton de basculement de thème avec animation
7. **FilterChip** : Chip de filtrage avec sélection
8. **QuizTimer** : Timer avec alerte visuelle

## 📦 Dépendances

```yaml
dependencies:
  flutter:
    sdk: flutter
  go_router: ^14.2.0        # Navigation déclarative
  cupertino_icons: ^1.0.6   # Icônes iOS

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.0.0     # Linting et analyse de code
```

## 🧪 Tests

Le projet dispose d'une suite complète de tests :

### Tests unitaires (modèles)
- `test/models/question_test.dart` : Tests du modèle Question
- `test/models/quiz_category_test.dart` : Tests du modèle QuizCategory

### Tests de widgets
- `test/widgets/category_card_test.dart` : Tests du widget CategoryCard
- `test/widgets/answer_button_test.dart` : Tests du widget AnswerButton
- `test/widgets/custom_input_field_test.dart` : Tests du widget CustomInputField

### Tests d'intégration (écrans)
- `test/screens/home_screen_test.dart` : Tests de l'écran d'accueil
- `test/screens/quiz_list_screen_test.dart` : Tests de l'écran de liste
- `test/screens/quiz_game_screen.dart` : Tests de l'écran de jeu
- `test/screens/add_question_screen_test.dart` : Tests du formulaire

### Lancer les tests

```bash
# Lancer tous les tests
flutter test

# Lancer les tests avec couverture
flutter test --coverage

# Lancer un fichier de test spécifique
flutter test test/models/question_test.dart
```

## 🎨 Design et Responsive Design

L'application est conçue pour s'adapter à différentes tailles d'écran :

### Breakpoints
- **Mobile** : < 600px
- **Tablette** : 600px - 900px
- **Desktop** : >= 900px

### Adaptations
- Taille de police dynamique
- Espacement proportionnel
- Grille responsive (2-4 colonnes selon la largeur)
- Hauteur des boutons adaptée
- Padding ajusté

### Thème
- **Couleur principale** : `#1877F2` (bleu Facebook)
- **Mode clair** : Fond clair, texte sombre
- **Mode sombre** : Fond sombre, texte clair
- **Couleurs de feedback** : Vert (succès), Rouge (erreur), Orange (avertissement)

## 🚀 Installation et lancement

### Prérequis
- Flutter SDK (>= 3.0.0)
- Un émulateur Android/iOS ou un navigateur (Chrome) configuré
- Git pour cloner le dépôt

### Étapes d'installation

```bash
# 1. Cloner le dépôt
git clone https://github.com/<votre-utilisateur>/quickquiz.git
cd quickquiz

# 2. Installer les dépendances
flutter pub get

# 3. Vérifier que le logo est présent (optionnel)
# -> assets/images/logoquiz.png
# Si absent, un fallback avec icône sera utilisé

# 4. Lancer l'application
flutter run

# Pour un appareil spécifique
flutter run -d chrome
flutter run -d windows
flutter run -d android
```

### Lancer les tests

```bash
# Lancer tous les tests
flutter test

# Lancer avec couverture de code
flutter test --coverage

# Voir le rapport de couverture
genhtml coverage/lcov.info -o coverage/html
```

### Analyse de code

```bash
# Lancer l'analyse statique
flutter analyze

# Formater le code
flutter format .
```

## 📝 Utilisation

### Démarrer un quiz

1. Lancez l'application
2. Cliquez sur "Commencer un quiz"
3. Sélectionnez une catégorie parmi les 5 disponibles
4. Répondez aux questions en cliquant sur les options
5. Visualisez votre score à la fin

### Ajouter une question

1. Depuis l'accueil, cliquez sur "Ajouter une question"
2. Sélectionnez une catégorie dans le menu déroulant
3. Renseignez la question (minimum 3 caractères, maximum 200)
4. Ajoutez au moins 2 options de réponse
5. Indiquez la réponse correcte (doit correspondre exactement à une option)
6. Cliquez sur "Enregistrer"

### Rechercher une catégorie

1. Accédez à la liste des quiz
2. Utilisez la barre de recherche en haut
3. Tapez le nom ou la description de la catégorie
4. Les résultats se mettent à jour en temps réel

### Changer le thème

1. Cliquez sur l'icône de thème en haut à droite de l'écran d'accueil
2. Le thème bascule entre clair et sombre
3. La préférence est conservée pendant la session

## 🔧 Configuration

### Personnalisation des couleurs

Modifiez les couleurs dans `lib/services/theme_notifier.dart` :

```dart
static const Color primaryColor = Color(0xFF1877F2);
static const Color successColor = Color(0xFF42B72A);
static const Color errorColor = Color(0xFFE41E3F);
```

### Ajouter des catégories

Modifiez `lib/services/mock_quiz_data.dart` pour ajouter de nouvelles catégories :

```dart
static const List<QuizCategory> categories = [
  // ... catégories existantes
  QuizCategory(
    id: 'new-category',
    title: 'Nouvelle Catégorie',
    description: 'Description de la nouvelle catégorie',
    icon: Icons.category,
    color: Color(0xFFYourColor),
  ),
];
```

### Ajouter des questions

Ajoutez des questions dans `lib/services/mock_quiz_data.dart` :

```dart
static const List<Question> questions = [
  // ... questions existantes
  Question(
    id: 'q-new',
    categoryId: 'new-category',
    questionText: 'Votre question ?',
    options: ['Option A', 'Option B', 'Option C', 'Option D'],
    correctAnswerIndex: 0,
  ),
];
```

## 🛠️ Développement

### Structure de code

Le projet suit les conventions Flutter :
- **Naming** : `lowerCamelCase` pour les variables, `UpperCamelCase` pour les classes
- **Fichiers** : `snake_case.dart`
- **Commentaires** : Documentation au-dessus des classes et méthodes importantes

### Bonnes pratiques

- Utilisez des widgets const lorsque possible
- Séparez la logique métier des widgets
- Écrivez des tests pour les nouvelles fonctionnalités
- Utilisez `flutter analyze` avant de commit
- Formatez le code avec `flutter format`

### Extension du projet

Pour ajouter un nouvel écran :

1. Créez le fichier dans `lib/screens/`
2. Définissez la route dans `lib/router/app_router.dart`
3. Ajoutez la navigation depuis les écrans existants
4. Créez les tests correspondants dans `test/screens/`

## 📄 Licence

Ce projet est développé dans un cadre académique.

## 👤 Auteur

Projet académique développé dans le cadre du cours de développement mobile Flutter.

## 🙏 Remerciements

- Équipe Flutter pour le framework excellent
- Communauté Flutter pour les ressources et documentation
- Facebook Design pour l'inspiration du thème

