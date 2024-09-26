# **CLOT SHOP**

I made this app with Flutter using clean architecture, Bloc as state management, and Firebase for authentication and database.

## Brief explanation

CLOT SHOP is an e-commerce app where you can add items to the cart or favorites and make orders.

## Screenshots

| Splash Page | Sign In Page | Sign Up Page | About Yourself |
| :-----------: | :---------: | :------------: | :--------------: |
![Splash Page](https://github.com/AhmedKhaled8907/clot_shop/blob/main/screen_shots/splash.png?raw=true)|![Sign In Page](https://github.com/AhmedKhaled8907/clot_shop/blob/main/screen_shots/sign_in.png?raw=true)|![Sign Up Page](https://github.com/AhmedKhaled8907/clot_shop/blob/main/screen_shots/sign_up.png?raw=true)|![About Yourself](https://github.com/AhmedKhaled8907/clot_shop/blob/main/screen_shots/about_yourself.png?raw=true)

| Age Range | Forgot Password | Password Reset | Home Page |
| :-----------: | :---------: | :------------: | :--------------: |
![Age Range](https://github.com/AhmedKhaled8907/clot_shop/blob/main/screen_shots/age_range.png?raw=true)|![Forgot Password](https://github.com/AhmedKhaled8907/clot_shop/blob/main/screen_shots/forgot_password.png?raw=true)|![Password Reset](https://github.com/AhmedKhaled8907/clot_shop/blob/main/screen_shots/password_reset.png?raw=true)|![Home Page](https://github.com/AhmedKhaled8907/clot_shop/blob/main/screen_shots/home.png?raw=true)


| Categories Page | Top Selling Page | New In Page | Product Details Page |
| :-----------: | :---------: | :------------: | :--------------: |
![Categories Page](https://github.com/AhmedKhaled8907/clot_shop/blob/main/screen_shots/categories.png?raw=true)|![Top Selling Page](https://github.com/AhmedKhaled8907/clot_shop/blob/main/screen_shots/top_selling.png?raw=true)|![New In Page](https://github.com/AhmedKhaled8907/clot_shop/blob/main/screen_shots/new_in.png?raw=true)|![Product Details Page](https://github.com/AhmedKhaled8907/clot_shop/blob/main/screen_shots/product_details.png?raw=true)

| Sizes | Colors | Cart Page | Checkout |
| :-----------: | :---------: | :------------: | :--------------: |
![Sizes](https://github.com/AhmedKhaled8907/clot_shop/blob/main/screen_shots/sizes.png?raw=true)|![Colors](https://github.com/AhmedKhaled8907/clot_shop/blob/main/screen_shots/colors.png?raw=true)|![Cart Page](https://github.com/AhmedKhaled8907/clot_shop/blob/main/screen_shots/cart.png?raw=true)|![Checkout](https://github.com/AhmedKhaled8907/clot_shop/blob/main/screen_shots/checkout.png?raw=true)



| Checkout | Order Placed | Order Details |
| :-----------: | :---------: | :------------: |
![](https://github.com/AhmedKhaled8907/clot_shop/blob/main/screen_shots/checkout.png?raw=true)|![](https://github.com/AhmedKhaled8907/clot_shop/blob/main/screen_shots/order_placed.png?raw=true)|![](https://github.com/AhmedKhaled8907/clot_shop/blob/main/screen_shots/order_details.png?raw=true)|![]

| Order Items | Settings Page |
| :---------: | :------------: |
![](https://github.com/AhmedKhaled8907/clot_shop/blob/main/screen_shots/order_items.png?raw=true)|![](https://github.com/AhmedKhaled8907/clot_shop/blob/main/screen_shots/settings.png?raw=true)|



## Dependencies
```yaml
  flutter_svg: ^2.0.10+1
  flutter_bloc: ^8.1.6
  firebase_core: ^2.24.2
  firebase_auth:
  cloud_firestore:
  dartz: ^0.10.1
  get_it: ^7.7.0
  image_picker: ^1.1.2
```
## Directory Structure for project

```                                              
├───common
│   ├───helper
│   │   ├───bloc
│   │   │   ├───button
│   │   │   ├───category
│   │   │   │   └───cubit
│   │   │   └───product
│   │   │       ├───cubit
│   │   │       └───favorite_product_cubit
│   │   ├───bottom_sheet
│   │   ├───cart
│   │   ├───functions
│   │   ├───images
│   │   ├───navigator
│   │   └───product
│   └───widgets
│       ├───app_bar
│       ├───button
│       ├───empty_pages
│       ├───images
│       ├───product
│       └───texts
├───core
│   ├───configs
│   │   ├───assets
│   │   └───theme
│   ├───constants
│   ├───services
│   └───usecases
├───data
│   ├───auth
│   │   ├───models
│   │   ├───repo
│   │   └───source
│   ├───categories
│   │   ├───models
│   │   ├───repo
│   │   └───source
│   ├───order
│   │   ├───models
│   │   ├───repo
│   │   └───sources
│   └───product
│       ├───models
│       ├───repo
│       └───source
├───domain
│   ├───auth
│   │   ├───entities
│   │   ├───repos
│   │   └───usecases
│   ├───category
│   │   ├───entities
│   │   ├───repos
│   │   └───usecases
│   ├───order
│   │   ├───entity
│   │   ├───repo
│   │   └───usecases
│   └───product
│       ├───entities
│       ├───repos
│       └───usecases
└───presentation
    ├───all_categories
    │   └───pages
    ├───auth
    │   ├───bloc
    │   │   ├───ages_display_cubit
    │   │   ├───age_selection_cubit
    │   │   ├───display_user_info_cubit
    │   │   ├───gender_selection_cubit
    │   │   └───sign_out_cubit
    │   ├───pages
    │   └───widgets
    ├───cart
    │   ├───bloc
    │   │   └───cart_product_display_cubit
    │   ├───pages
    │   └───widgets
    ├───category_products
    │   └───pages
    ├───home
    │   ├───bloc
    │   │   └───user_info_display_cubit
    │   ├───pages
    │   └───widgets
    ├───orders
    │   ├───bloc
    │   │   └───cubit
    │   ├───pages
    │   └───widgets
    ├───product_details
    │   ├───bloc
    │   ├───pages
    │   └───widgets
    ├───root
    │   ├───bloc
    │   │   └───bottom_nav_bar_cubit
    │   └───pages
    ├───search
    │   ├───pages
    │   └───widgets
    ├───settings
    │   ├───pages
    │   └───widgets
    └───splash
        ├───pages
        └───splash_cubit
    
```
