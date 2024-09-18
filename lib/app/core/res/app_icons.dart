class AppIcons {
  AppIcons._internal();
  static final AppIcons _instance = AppIcons._internal();
  factory AppIcons() => _instance;

  static const String path = 'assets/icons/';

  static const String icArrowDown = '${path}arrow_down.svg';
  static const String icBudget = '${path}budget.svg';
  static const String icExpense = '${path}expenses.svg';
  static const String icHome = '${path}home.svg';
  static const String icIncome = '${path}income.svg';
  static const String icNotification = '${path}notification.svg';
  static const String icTransaction = '${path}transaction.svg';
  static const String icUser = '${path}user.svg';
  static const String icTransfer = '${path}transfer.svg';
  static const String icFood = '${path}food.svg';
  static const String icShopping = '${path}shopping.svg';
  static const String icSubscription = '${path}subscription.svg';
}
