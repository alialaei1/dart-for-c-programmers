# Example 15: Mixin (Only)

## مفهوم
`mixin` برای اشتراک گذاری رفتار بین چند کلاس است، بدون اینکه حتما رابطه وراثتی مستقیم داشته باشند.

## سوال
یک `mixin` به نام `Logger` بساز که متد `logMessage()` داشته باشد.  
دو کلاس `AuthService` و `OrderService` از این mixin استفاده کنند.

## راهنمای مرحله‌ای
1. `mixin Logger` تعریف کن.
2. متد مشترک `logMessage` را داخل آن بنویس.
3. کلاس ها را با `with Logger` بساز.
4. در متدهای کلاس ها از `logMessage` استفاده کن.

## جواب کامل (Dart)
```dart
mixin Logger {
  void logMessage(String text) {
    print('[LOG] $text');
  }
}

class AuthService with Logger {
  void login(String username) {
    logMessage('User $username logged in.');
  }
}

class OrderService with Logger {
  void createOrder(int orderId) {
    logMessage('Order #$orderId created.');
  }
}

void main() {
  final auth = AuthService();
  final order = OrderService();

  auth.login('ali');
  order.createOrder(101);
}
```
