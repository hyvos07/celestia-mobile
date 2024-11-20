# ![Banner](assignments/images/banner.png)

Celestia is a Hoyoverse Official Merchandise E-Commerce that offers some products officially made by Hoyoverse. This Project was made for one of the task in <a href="https://pbp-fasilkom-ui.github.io/ganjil-2025/"> Pemrograman Berbasis Platform (PBP) Gasal 2024/2025</a>.

<br>

> **Note:** <br> This is not an actual online shop for Hoyoverse Merchandise.

<br>

# 📝 Assignment
**Nama**    : Daniel Liman<br>
**NPM**     : 2306220753<br>
**Kelas**   : PBP F

| Tugas Sebelumnya: | [Tugas 7](https://github.com/hyvos07/celestia-mobile/wiki/Tugas-7) | [Tugas 8](https://github.com/hyvos07/celestia-mobile/wiki/Tugas-8) |
|-|-|-|

<br>

## Tugas 9
### Manfaat Model dalam Pengambilan dan Pengiriman data JSON

Dalam mengirim dan menerima data pada JSON, kita bisa memanfaatkan konsep Object-Oriented Programming pada data yang kita terima, sehingga data tersebut bisa kita buat sebagai suatu objek yang akan kita gunakan di aplikasi kita. Pendekatan ini diimplementasikan dalam membentuk sebuah class Model dengan isi atribut-atribut yang berkorelasi dengan data kita.

Pembuatan class Model dapat memudahkan kita untuk memastikan integritas data yang diterima, sehingga dapat sesuai dengan bentuk data yang kita perlukan di aplikasi kita. Adanya class Model ini juga bisa membantu program kita untuk mendeteksi kesalahan format data dari awal penerimaan atau pengiriman data, sehingga tidak error pada saat digunakan.

Pembuatan class Model juga bisa memberikan kemudahan untuk menjaga kode kita lebih terstruktur dan mudah dibaca. Selain itu, perubahan jenis dan atribut data juga lebih mudah dilakukan karena sudah terpusat pada class Model tersebut.

Penggunaan model di Flutter sendiri tidak wajib, karena kita bisa saja memakai struktur JSON langsung (yang menjadi Map di Dart), namun tentu saja penggunaan class Model ini bisa lebih memudahkan kita dalam mengatur dan mengolah data yang kita punya.


### Fungsi dari Library `http`

Library `http` di Flutter memungkinkan kita untuk **mengirim HTTP requests** seperti GET, POST, PUT dan DELETE pada endpoint server yang diberikan. Library ini juga akan menerima response dari server tersebut dalam bentuk yang diinginkan (biasanya JSON) yang dikelola dalam headers dan body dari request yang akan kita kirim. Library ini juga dapat dikatakan cukup simpel dibandingkan dengan library lainnya dalam mengurus hal menerima dan mengirimkan data ke server yang kita tuju.


### Fungsi dari `CookieRequest`

`CookieRequest` berguna untuk mengelola state (yang juga dibantu dengan library state management `Provider`) autentikasi seperti login dan logout yang ada di aplikasi kita. `CookieRequest` menyimpan dan mengelola cookies yang aplikasi kita dapat pada saat kita melakukan login maupun logout ke server Django yang kita tuju.

`CookieRequest` juga membantuk kita untuk menyimpan cookies yang kita dapat tadi untuk disertakan dalam request yang kita akan kirim pada server Django yang kita tuju. Dengan demikian, lapisan autentikasi yang diperlukan dalam mengirim request tersebut juga bisa diatasi dengan cookie yang disimpan oleh `CookieRequest` tersebut.


### Mekanisme Pengiriman Data pada Flutter

Pada aplikasi ini, mekanisme pengiriman data akan dimulai dari memasukkan semua atribut dan nilai yang diperlukan di halaman [penambahan produk](/lib/features/product/presentation/pages/add_product.dart). Setiap field/attribute yang diperlukan untuk membuat data/produk baru akan diberikan kolom input yang juga sesuai dengan tipe data yang diharapkan oleh server Django kita.

Setelah semua attribute selesai diisi oleh pengguna dan siap untuk dikirim ke server, maka pengguna akan memakai tombol "Create Product" yang tersedia di bawah. Dengan memencet tombol tersebut, program akan mengirim sebuah request ke endpoint server yang terkait (disimpan pada [endpoints.dart](/lib/core/constants/endpoints.dart)). Jika berhasil, aplikasi ini akan kembali ke home page dan memberikan pesan berhasil. Jika gagal, maka akan ada snackbar yang memberikan informasi yang diterima dari server, berisi kesalahan yang dilakukan selama pengiriman data.

Setelah berhasil ditambahkan, produk baru tersebut bisa dilihat pada [halaman semua produk](/lib/features/product/presentation/pages/all_product.dart) yang dimiliki oleh pengguna. Produk-produk tersebut diambil lewat request yang dikirimkan oleh program sebelum halaman yang dituju di-build oleh Flutter, lalu dirender dalam bentuk card.


###  Mekanisme Autentikasi dari Login, Register, hingga Logout

- **Register**

    Pada proses register, pengguna akan diarahkan untuk membuat akun baru dengan username dan password yang baru. Jika ada error yang dikirim oleh Django (seperti username ganda, password konfirmasi tidak sama, dan lainnya) maka registrasi tidak akan berhasil dan pengguna akan menerima snackbar berisi error terkait. Jika aman, akun baru akan dibuat di server Django dan pengguna langsung diarahkan pada login page.

- **Login**

    Sama seperti pada proses login, pengguna akan diarahkan untuk memasukkan kredensial akunnya dan dikirim ke server Django. Jika ada error yang dikirim oleh Django (seperti username tidak ada, password salah, dan lainnya) maka proses login tidak akan dilanjutkan dan pengguna akan menerima snackbar berisi error terkait. Jika aman, pengguna akan masuk ke dalam home page dengan state cookies yang disimpan pada `CookieRequest`.

- **Logout**

    Pada proses logout, aplikasi akan mengirimkan request untuk menghapus session dari pengguna yang sedang login sekarang. Jika berhasil, `CookieRequest` akan direset dan pengguna akan kembali ke halaman login.


### Step-by-step dari Checklist

- Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.

    Deployment proyek tugas Django sudah dipush ulang dengan update terbaru sehingga dapat menerima request yang dikirimkan dari aplikasi mobile.

- Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.

    Fitur registrasi diimplementasikan dengan menambahkan views baru pada Django App yang baru (`authentication`), seperti berikut.
    ```python
    # Register a new user
    @csrf_exempt
    def register(request):
        if request.method == 'POST':
            data = json.loads(request.body)
            username = data['username']
            password1 = data['password1']
            password2 = data['password2']

            # Check if the passwords match
            if password1 != password2:
                return JsonResponse({
                    "status": False,
                    "message": "Passwords do not match."
                }, status=400)

            # Check if the username is already taken
            if User.objects.filter(username=username).exists():
                return JsonResponse({
                    "status": False,
                    "message": "Username already exists."
                }, status=400)

            # Create the new user
            user = User.objects.create_user(username=username, password=password1)
            user.save()

            return JsonResponse({
                "username": user.username,
                "status": 'success',
                "message": "User created successfully!"
            }, status=200)

        else:
            return JsonResponse({
                "status": False,
                "message": "Invalid request method."
            }, status=400)
    ```

    Lalu, registrasi akan diurus pada aplikasi Flutter lewat halaman [registrasi](lib/features/auth/presentation/pages/register_page.dart) yang dapat diakses jika pengguna ingin melakukan proses login.

- Membuat halaman login pada proyek tugas Flutter.

    Halaman login pada aplikasi ini diimplementasikan dengan bentuk halaman [login](lib/features/auth/presentation/pages/login_page.dart) yang akan menjadi halaman pertama yang pengguna temui saat membuka aplikasi. Pada server Django, juga dibuat views baru untuk menerima request login dari pengguna.
    ```python
    # Login
    @csrf_exempt
    def login(request):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                auth_login(request, user)
                return JsonResponse({
                    "username": user.username,
                    "status": True,
                    "message": "Successfully logged in"
                }, status=200)
            else:
                return JsonResponse({
                    "status": False,
                    "message": "Login failed"
                }, status=401)
        else:
            return JsonResponse({
                "status": False,
                "message": "Try again"
            }, status=401)
    ```

- Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.

    Dengan bantuan package `pbp_django_auth` yang disediakan tim asdos, Flutter akan menyimpan isi dari cookies yang diterima aplikasi sehingga dapat digunakan untuk request-request lainnya yang membutuhkan autentikasi pengguna.
    ```dart
    class App extends StatelessWidget {
        const App({super.key});

        @override
        Widget build(BuildContext context) {
            SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
            ]);

            return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            child: MaterialApp(
                title: 'Celestia',
                theme: AppTheme.lightTheme(),
                debugShowCheckedModeBanner: false,
                navigatorKey: nav.navigatorKey,
                home: const Scaffold(
                body: LoginPage(),
                ),
            ),
            );
        }
    }
    ```

- Membuat model kustom sesuai dengan proyek aplikasi Django.

    Model kustom untuk mengirim dan menerima data produk-produk yang ada di server Django dibuat pada class [Product Model](lib/features/product/data/models/product_model.dart). Model tersebut dibantu oleh Quicktype.

- Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.

    Halaman [AllProduct](lib/features/product/presentation/pages/all_product.dart) akan menampilkan semua produk yang diterima dari server Django dan dirender dalam bentuk sebuah card yang didefinisikan dalam widget [ProductCard](lib/features/product/presentation/widgets/product_card.dart).