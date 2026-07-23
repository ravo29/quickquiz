# QuickQuiz - Application de Culture Générale (Flutter)

QuickQuiz est une application mobile multi-écrans Flutter développée dans un cadre académique. Elle intègre le logo de la marque (`assets/images/logoquiz.png`) et propose des séries de quiz sur la **Culture Générale** (Géographie, Histoire, Sciences, Littérature, Cinéma) dans une interface épurée aux couleurs de **Facebook / Messenger**.

---

## 🖼️ Intégration du Logo & Visuals
- **Fichier Logo :** `assets/images/logoquiz.png`
- **Utilisation :** Intégré dans l'AppBar de navigation, dans le conteneur `Stack` de la page d'accueil (`HomeScreen`), ainsi que sur l'écran de résultat (`QuizGameScreen`).

---

## 🎨 Charte Graphique & UI Design
- **Inspiration UI :** Design Facebook/Messenger moderne.
- **Couleur Primaire :** Bleu Facebook (`#1877F2`).
- **Thème Clair :** Fond gris doux (`#F0F2F5`) avec cartes blanches (`#FFFFFF`).
- **Thème Sombre :** Mode Dark style Messenger (`#18191A`) et cartes grises (`#242526`).

---

## 🛠️ Architecture & Démonstration des Widgets

Le projet respecte une architecture modulaire stricte :
- `lib/models/` : Modèles de données purs (`Question`, `QuizCategory`).
- `lib/services/` : Service Mock (`mock_quiz_data.dart`) pour une séparation UI/Data à 100%.
- `lib/widgets/` : Widgets personnalisés et réutilisables.
- `lib/screens/` : Écrans fonctionnels.
- `lib/router/` : Routage déclaratif via `go_router`.
- `lib/themes/` : Thème dynamique via `ValueNotifier`.

### 🧰 Démonstration des 8+ Widgets Distincts Flutter
1. **ListView** : Affichage dynamique des choix de réponses dans `QuizGameScreen`.
2. **GridView** : Disposition adaptative des cartes de thèmes dans `QuizListScreen`.
3. **Stack** : Superposition de l'arrière-plan et du logo `logoquiz.png` sur `HomeScreen`.
4. **Card** : Cartes conteneurs thématiques sur `QuizListScreen` et `QuizGameScreen`.
5. **Container** : Mise en forme et décoration des icônes et boutons.
6. **Column / Row** : Structuration verticale et horizontale du layout.
7. **TextField / TextFormField** : Recherche temps réel et saisie de formulaire.
8. **Form** : Conteneur global du formulaire avec clé de validation `GlobalKey<FormState>`.
9. **LinearProgressIndicator** : Barre de progression du quiz dans `QuizGameScreen`.
10. **ClipRRect / Image** : Affichage et découpe aux coins arrondis de l'image de logo.

---

## 📱 Responsive Design (Mobile / Tablette)
La grille des catégories (`QuizListScreen`) adapte dynamiquement le nombre de colonnes selon la largeur de l'écran (`MediaQuery`) :
- **Mobile (< 600px) :** 2 colonnes
- **Tablette (600px - 900px) :** 3 colonnes
- **Grand Écran / Desktop (> 900px) :** 4 colonnes

---

## 📋 Tableau de Validation des Exigences

| Exigence du Cahier des Charges | Statut | Emplacement / Explication |
|---|---|---|
| Image de Logo | ✅ Validé | Intégration de `assets/images/logoquiz.png` |
| Architecture Modulaire | ✅ Validé | Dossiers `models`, `screens`, `widgets`, `services`, `themes`, `router` |
| Séparation UI / Données | ✅ Validé | Zéro donnée hardcodée dans l'UI. Données centralisées dans `mock_quiz_data.dart` |
| 4 Écrans Distincts | ✅ Validé | `HomeScreen`, `QuizListScreen`, `QuizGameScreen`, `AddQuestionScreen` |
| Recherche / Filtrage en temps réel | ✅ Validé | `TextField` dynamique filtrant la liste sur `QuizListScreen` |
| Formulaire & Validation Avancée | ✅ Validé | Validation complexe sur 5 champs dans `AddQuestionScreen` |
| Navigation `go_router` | ✅ Validé | Routes nommées & passage de paramètre `categoryId` |
| Switch Thème Clair / Sombre | ✅ Validé | `ValueNotifier<ThemeMode>` dans `app_router.dart` |
| Responsive Design | ✅ Validé | Adaptation dynamique Mobile/Tablette via `MediaQuery` |
| Tests Unitaires & Widgets | ✅ Validé | Tests dans le dossier `test/` (`models_test.dart`, `widget_test.dart`) |

---

## 🚀 Instructions de Lancement

1. **Placer le fichier image :**
   S'assurer que l'image `logoquiz.png` est placée sous `assets/images/logoquiz.png`.

2. **Récupérer les dépendances :**
   ```bash
   flutter pub get