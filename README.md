# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. As students we were given this functioning app and asked to add features and debug certian features. 
* features added were:
  - Sold out badge on product index.
  - Added admin namespace and authentication(user HTTP Basic Authentication) and added ability for admin to add categories.
  - Added user authentication via bcrypt (registration and login)
  - Post order submission page refactored for better UX showing appropriate content to user to review what they ordered.
  - Implemented the mailout feature of rails to send a customer their order details once they have completed their order.
  - Empty cart logic added for better UX and option to redirect to continue shopping if the cart is empty.
  - Product ratings feature added. Logged in users can rate products and delete their own ratings.

!["Screenshot of the product page"]()
!["Screenshot of the sold out button page"]()

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
