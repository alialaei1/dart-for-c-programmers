<div dir="rtl" align="right">

# درس 01: متغیرها در Dart (با نگاه C + Flutter)

در این درس، متغیرها را از دید یک برنامه‌نویس C بررسی می‌کنیم: چه چیزهایی شبیه است، چه چیزهایی متفاوت است، و در Flutter چطور استفاده می‌شود.

---

## 1) تعریف متغیر با نوع صریح

مثل C می‌توانید نوع را واضح بنویسید:

</div>

```dart
int age = 25;
double price = 49.99;
String username = 'ali_dev';
bool isActive = true;
```

<div dir="rtl" align="right">

### تفاوت با C

- `String` و `bool` در Dart نوع‌های اصلی زبان هستند.
- در Dart همه‌چیز آبجکت است (حتی `int` و `double`).

### کاربرد در Flutter

</div>

```dart
String title = 'Profile';
bool isLoading = true;
```

<div dir="rtl" align="right">

- `title` می‌تواند در `AppBar` نمایش داده شود.
- `isLoading` برای نمایش یا مخفی کردن `CircularProgressIndicator` استفاده می‌شود.

---

## 2) `var` و استنتاج نوع

در Dart می‌توانید به جای نوشتن نوع، از `var` استفاده کنید:

</div>

```dart
var count = 0;        // int
var message = 'Hi';   // String
```

<div dir="rtl" align="right">

کامپایلر نوع را از مقدار اولیه تشخیص می‌دهد.

### تفاوت با C

- در C باید نوع را صریح بنویسید.
- در Dart با `var` کد کوتاه‌تر می‌شود اما نوع همچنان ثابت می‌ماند.

</div>

```dart
var x = 10;
x = 20;      // درست
// x = 'ten'; // خطا: نوع x از ابتدا int بوده
```

<div dir="rtl" align="right">

### کاربرد در Flutter

</div>

```dart
var items = ['Apple', 'Banana', 'Orange'];
var selectedIndex = 0;
```

<div dir="rtl" align="right">

- برای ساخت لیست آیتم‌ها و state ساده بسیار رایج است.

---

## 3) `dynamic` برای نوع پویا

</div>

```dart
dynamic value = 10;
value = 'ten';
value = true;
```

<div dir="rtl" align="right">

### تفاوت با C

- در C نوع متغیر در زمان کامپایل مشخص است.
- `dynamic` در Dart انعطاف بالا می‌دهد، ولی امنیت نوع را کم می‌کند.

### کاربرد در Flutter

در کار با JSON خام ممکن است ببینید:

</div>

```dart
dynamic rawResponse = {'name': 'Ali', 'age': 25};
```

<div dir="rtl" align="right">

> پیشنهاد عملی: تا حد ممکن از مدل‌های تایپ‌شده استفاده کنید و وابستگی به `dynamic` را کم نگه دارید.

---

## 4) `final` و `const`

### `final`

- یک‌بار مقداردهی می‌شود.
- مقدار می‌تواند در زمان اجرا تعیین شود.

</div>

```dart
final createdAt = DateTime.now();
```

<div dir="rtl" align="right">

### `const`

- مقدار باید در زمان کامپایل مشخص باشد.

</div>

```dart
const appName = 'dart-for-c-programmers';
const spacing = 16.0;
```

<div dir="rtl" align="right">

### تفاوت با C

- C مفهوم `const` دارد، اما Dart بین ثابت زمان اجرا (`final`) و ثابت زمان کامپایل (`const`) تفکیک دقیق‌تری دارد.

### کاربرد در Flutter

`const` در Flutter مهم است چون می‌تواند به بهینه شدن rebuild کمک کند:

</div>

```dart
const Text('Hello');
const SizedBox(height: 16);
```

<div dir="rtl" align="right">

و برای داده‌های runtime:

</div>

```dart
final userId = DateTime.now().millisecondsSinceEpoch;
```

<div dir="rtl" align="right">

---

## 5) Null Safety و `?`

در Dart مدرن، متغیر non-null باید مقدار معتبر داشته باشد:

</div>

```dart
int count = 1;    // non-null
int? maybeCount;  // nullable
```

<div dir="rtl" align="right">

### تفاوت با C

- در C ممکن است متغیر محلی بدون مقدار اولیه تعریف شود و رفتار نامطمئن ایجاد کند.
- در Dart، Null Safety جلوی بخش بزرگی از خطاهای رایج را می‌گیرد.

### کاربرد در Flutter

</div>

```dart
String? errorText;
```

<div dir="rtl" align="right">

- برای فرم‌ها و وضعیت‌های اختیاری (مثلا پیام خطا) بسیار رایج است.

---

## مثال ترکیبی Flutter

</div>

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

<div dir="rtl" align="right">

در این مثال:

- `final` برای props ویجت
- `const` برای مقدار ثابت
- `var` برای مقدار محاسبه‌شده
- `String?` برای داده اختیاری

---

## اشتباهات رایج

- استفاده زیاد از `dynamic` بدون نیاز
- قاطی کردن نقش `final` و `const`
- نادیده گرفتن Null Safety و استفاده بی‌دلیل از `!`

---

## تمرین

1. یک کلاس `UserBadge` بسازید که `name` و `age` را با `final` بگیرد.
2. یک برچسب اختیاری `String? status` به آن اضافه کنید.
3. داخل `build` یک مقدار `const` برای فاصله و یک مقدار `var` برای متن نمایشی بسازید.
4. اگر `status` مقدار داشت نمایش دهید، در غیر این صورت چیزی نمایش ندهید.

---

## خلاصه درس

- Dart مثل C نوع‌دار است، اما با `var` خواناتر می‌شود.
- `dynamic` باید محدود و آگاهانه استفاده شود.
- `final` و `const` در Dart و Flutter کاربرد کلیدی دارند.
- Null Safety باعث پایداری بیشتر کد می‌شود.

</div>
