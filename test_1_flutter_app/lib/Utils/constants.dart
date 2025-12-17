// lib/utils/constants.dart

import 'package:flutter/material.dart';

/// Couleurs de l'application
class AppColors {
  // Couleurs principales
  static const Color primary = Color(0xFF6200EE);
  static const Color primaryDark = Color(0xFF3700B3);
  static const Color accent = Color(0xFF03DAC6);

  // Couleurs de fond
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Colors.white;

  // Couleurs de texte
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFFBDBDBD);

  // Couleurs pour transactions
  static const Color income = Color(0xFF4CAF50); // Vert pour entrées
  static const Color expense = Color(0xFFF44336); // Rouge pour sorties
  static const Color pending = Color(0xFFFF9800); // Orange pour en attente

  // Couleurs d'état
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);
}

/// Styles de texte
class AppTextStyles {
  // Titres
  static const TextStyle heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Corps de texte
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  // Texte pour montants
  static const TextStyle amountLarge = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle amountMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Boutons
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // Hints et labels
  static const TextStyle hint = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textHint,
  );
}

/// Espacements et dimensions
class AppDimensions {
  // Padding
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;

  // Marges
  static const double marginSmall = 8.0;
  static const double marginMedium = 16.0;
  static const double marginLarge = 24.0;

  // Border radius
  static const double radiusSmall = 4.0;
  static const double radiusMedium = 8.0;
  static const double radiusLarge = 12.0;
  static const double radiusXLarge = 16.0;

  // Tailles d'icônes
  static const double iconSmall = 16.0;
  static const double iconMedium = 24.0;
  static const double iconLarge = 32.0;

  // Hauteur des boutons
  static const double buttonHeight = 48.0;
  static const double buttonHeightSmall = 36.0;

  // Taille des cartes
  static const double cardElevation = 2.0;
  static const double cardBorderRadius = 12.0;
}

/// Messages et textes statiques
class AppStrings {
  // Connexion
  static const String appName = 'Easy Test';
 
  // Transactions
  static const String transactionsTitle = 'Transactions';
  static const String transactionDetail = 'Détail de la transaction';
  static const String noTransactions = 'Aucune transaction';
  // static const String loadingTransactions = 'Chargement...';


  // Types de transactions
  static const String income = 'Crédit';
  static const String expense = 'Débit';
  static const String pending = 'En attente';

}

/// Durées d'animation
class AppDurations {
  static const Duration short = Duration(milliseconds: 200);
  static const Duration medium = Duration(milliseconds: 300);
  static const Duration long = Duration(milliseconds: 500);
  static const Duration veryLong = Duration(milliseconds: 1000);
}


/// Regex pour validation
class AppRegex {
  static final RegExp email = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  static final RegExp phone = RegExp(
    r'^[+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$',
  );
}

// /// Routes (navigation)
// class AppRoutes {
//   static const String login = '/login';
//   static const String transactions = '/transactions';
//   static const String transactionDetail = '/transaction-detail';
// }
