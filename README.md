<p align="center">
    <img src="public\assets\images\logo-top-3.png" width="700" height="100%">
    <br>
</p>

<h1 align="center">
    
  [![made-by][made-by]][made-url]
  [![coverage][coverage]][forks-url]
  [![awesome][awesome]][stars-url]
    
</h1>

[made-by]: https://img.shields.io/badge/made%20by%3A-JSON--Derulo-important
[made-url]: https://github.com/perezromeojohn/junkitecommerce
[coverage]: https://img.shields.io/badge/progress-40%25-yellowgreen
[forks-url]: https://github.com/perezromeojohn/junkitecommerce
[awesome]: https://awesome.re/badge.svg
[stars-url]: https://github.com/perezromeojohn/junkitecommerce

## About Greenworks (Formerly known as Junk-It)

Greenwork is an E-commerce type of web application with the sole purpose of buying and selling unwanted things at your home such as tables,
chairs, shoes, or even shirts for you to earn some quick cash instead of throwing it away. The transactions can be via Cash on Delivery or
Online Transactions.

## Features

- Users can buy and sell products
- Online transactions or via Cash on delivery

## Group Members

- Romeo John Perez
- Justin Kirk Nacor
- Shermayne Ooi Francisco
- Angelica Estrada

## Changelogs

### v1.0 Admin and User Auth 
- Added Admin and Login page templated by jetstream
- Added user and admin authentication
- Used Livewire for auth components
- Added function to logging in and register
- Adjusted routes for redirecting to their respective dashboard page

### v1.1 Login and Register Layout
- Change the layout of login and register page to the template
- Fixed minor authentication errors

### v1.2 README Update
- Minor change for the readme files
- Added new logo with white backdrop

### v1.3 Shop Page Dynamic Fetching - April 16, 2022
- Added migration files for Products and Category table
- Shop page now fetch data via web pagination and livewire
- Shop page dynamically shows live data from the database
- Added models for Product and Category
- Minor update in README file (added members and changelogs)

### v1.4 Item Detail Page Update - April 18, 2022
- Added detail page for each product respectively
- Added dynamic Related Products
- Added dynamic Popular Products
- Added ProductDetails components
- Added ```hardevine/shoppingcart``` package to make the cart page functional
- Made the add to cart button functional
- Added items in the cart shows total number
- Update cart quantity
- Delete cart items (can also delete all items in the cart)

### v1.5 BULK UPDATE - May 1, 2022
- Logo changes from Junk-It to Greenworks (Justin Kirk Nacor's Change)
- New system name:  Greenworks
- Added item per page
- Added sorting (low price, high price)
- Category section functional
- Search Bar with drop down category is functional
- Keyword searching is functional
- Added Admin category page
- Migration Refresh to fix missing columns
- Added a Category Page for admin
- CRUD of Category Page now working (Create, Read, Update, Delete)

