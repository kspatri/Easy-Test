import 'package:easy_test/Models/transaction.dart';
import 'package:easy_test/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  final VoidCallback onTap;

  const TransactionCard({
    Key? key,
    required this.transaction,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isRevenu = transaction.type == TypeTransaction.REVENU;
    final montantColor = isRevenu ? AppColors.income : AppColors.expense;
    final montantPrefix = isRevenu ? '+' : '-';

final NumberFormat fcfaFormat = NumberFormat.currency(
      locale: 'fr_FR',
      symbol: 'FCFA',
      decimalDigits: 0,
    );


    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
      child: Container(
        margin: EdgeInsets.only(bottom: AppDimensions.marginMedium),
        padding: EdgeInsets.all(AppDimensions.paddingMedium),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icône
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: transaction.iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
              ),
              child: Center(
                child: FaIcon(
                  transaction.icon,
                  color: transaction.iconColor,
                  size: AppDimensions.iconMedium,
                ),
              ),
            ),
            SizedBox(width: AppDimensions.paddingMedium),
            // Description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.description,
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    transaction.categorie ?? '',
                    style: AppTextStyles.bodySmall,
                  ),
                ],
              ),
            ),
            // Montant
            Text(
             '$montantPrefix${fcfaFormat.format(transaction.montant)}',
              style: AppTextStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: montantColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
