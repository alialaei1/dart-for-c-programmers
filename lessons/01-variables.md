# درس 01: متغیرها در Dart (با نگاه C + Flutter)

در این درس، متغیرها را از دید یک برنامه نویس C بررسی می کنیم: چه چیزهایی شبیه است، چه چیزهایی متفاوت است، و در Flutter چطور استفاده می شود.

---

## 1) تعریف متغیر با نوع صریح

مثل C می توانید نوع را واضح بنویسید:

```dart
int age = 25;
double price = 49.99;
String username = 'ali_dev';
bool isActive = true;
```

### تفاوت با C

- `String` و `bool` در Dart نوع های اصلی زبان هستند.
- در Dart همه چیز آبجکت است (حتی `int` و `double`).

### کاربرد در Flutter

```dart
String title = 'Profile';
bool isLoading = true;
```

- `title` می تواند در `AppBar` نمایش داده شود.
- `isLoading` برای نمایش یا مخفی کردن `CircularProgressIndicator` استفاده می شود.

---

## 2) `var` و استنتاج نوع

در Dart می توانید به جای نوشتن نوع، از `var` استفاده کنید:

```dart
var count = 0;        // int
var message = 'Hi';   // String
```

کامپایلر نوع را از مقدار اولیه تشخیص می دهد.

### تفاوت با C

- در C باید نوع را صریح بنویسید.
- در Dart با `var` کد کوتاه تر می شود اما نوع همچنان ثابت می ماند.

```dart
var x = 10;
x = 20;      // درست
// x = 'ten'; // خطا: نوع x از ابتدا int بوده
```

### کاربرد در Flutter

```dart
var items = ['Apple', 'Banana', 'Orange'];
var selectedIndex = 0;
```

- برای ساخت لیست آیتم ها و state ساده بسیار رایج است.

---

## 3) `dynamic` برای نوع پویا

```dart
dynamic value = 10;
value = 'ten';
value = true;
```

### تفاوت با C

- در C نوع متغیر در زمان کامپایل مشخص است.
- `dynamic` در Dart انعطاف بالا می دهد، ولی امنیت نوع را کم می کند.

### کاربرد در Flutter

در کار با JSON خام ممکن است ببینید:

```dart
dynamic rawResponse = {'name': 'Ali', 'age': 25};
```

> پیشنهاد عملی: تا حد ممکن از مدل های تایپ شده استفاده کنید و وابستگی به `dynamic` را کم نگه دارید.

---

## 4) `final` و `const`

### `final`

- یک بار مقداردهی می شود.
- مقدار می تواند در زمان اجرا تعیین شود.

```dart
final createdAt = DateTime.now();
```

### `const`

- مقدار باید در زمان کامپایل مشخص باشد.

```dart
const appName = 'dart-for-c-programmers';
const spacing = 16.0;
```

### تفاوت با C

- C مفهوم `const` دارد، اما Dart بین ثابت زمان اجرا (`final`) و ثابت زمان کامپایل (`const`) تفکیک دقیق تری دارد.

### کاربرد در Flutter

`const` در Flutter مهم است چون می تواند به بهینه شدن rebuild کمک کند:

```dart
const Text('Hello');
const SizedBox(height: 16);
```

و برای داده های runtime:

```dart
final userId = DateTime.now().millisecondsSinceEpoch;
```

---

## 5) Null Safety و `?`

در Dart مدرن، متغیر non-null باید مقدار معتبر داشته باشد:

```dart
int count = 1;    // non-null
int? maybeCount;  // nullable
```

### تفاوت با C

- در C ممکن است متغیر محلی بدون مقدار اولیه تعریف شود و رفتار نامطمئن ایجاد کند.
- در Dart، Null Safety جلوی بخش بزرگی از خطاهای رایج را می گیرد.

### کاربرد در Flutter

```dart
String? errorText;
```

- برای فرم ها و وضعیت های اختیاری (مثلا پیام خطا) بسیار رایج است.

---

## مثال ترکیبی Flutter

```dart
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final String? discountLabel;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    this.discountLabel,
  });

  @override
  Widget build(BuildContext context) {
    const currency = 'Toman';
    var displayPrice = '$price $currency';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        Text(displayPrice),
        if (discountLabel != null) Text(discountLabel!),
      ],
    );
  }
}
```

در این مثال:

- `final` برای props ویجت
- `const` برای مقدار ثابت
- `var` برای مقدار محاسبه شده
- `String?` برای داده اختیاری

---

## اشتباهات رایج

- استفاده زیاد از `dynamic` بدون نیاز
- قاطی کردن نقش `final` و `const`
- نادیده گرفتن Null Safety و استفاده بی دلیل از `!`

---

## خلاصه درس

- Dart مثل C نوع دار است، اما با `var` خواناتر می شود.
- `dynamic` باید محدود و آگاهانه استفاده شود.
- `final` و `const` در Dart و Flutter کاربرد کلیدی دارند.
- Null Safety باعث پایداری بیشتر کد می شود.
