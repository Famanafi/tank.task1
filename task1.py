class UserRole:
    ADMIN = "admin"
    CUSTOMER = "customer"
    AUTHOR = "author"

class SubscriptionModel:
    FREE = "free"
    PLUS = "plus"
    PREMIUM = "premium"

class Book:
    def __init__(self, title, isbn, price, genre_id, units, description, id=None):
        self.id = id
        self.title = title
        self.isbn = isbn
        self.price = price
        self.genre_id = genre_id  # Foreign key reference
        self.units = units
        self.description = description


class Author:
    def __init__(self, user_id, goodreads_link=None, bank_account_number=None, id=None):
        self.id = id
        self.user_id = user_id  # Foreign key reference
        self.goodreads_link = goodreads_link
        self.bank_account_number = bank_account_number

class Customer:
    def __init__(self, user_id, subscription_model=SubscriptionModel.FREE, subscription_end_time=None, wallet_money_amount=0.0, id=None):
        self.id = id
        self.user_id = user_id  # Foreign key reference
        self.subscription_model = subscription_model
        self.subscription_end_time = subscription_end_time
        self.wallet_money_amount = wallet_money_amount

class User:
    def __init__(self, username, first_name, last_name, city_id, phone, email, password, role, id=None):
        self.id = id
        self.username = username
        self.first_name = first_name
        self.last_name = last_name
        self.city_id = city_id 
        self.phone = phone
        self.email = email
        self.password = password 
        self.role = role

class Reservation:
    def __init__(self, customer_id, book_id, start_of_reservation=None, end_of_reservation=None, price=0.0, id=None):
        self.id = id
        self.customer_id = customer_id  # Foreign key reference
        self.book_id = book_id  # Foreign key reference
        self.start_of_reservation = start_of_reservation
        self.end_of_reservation = end_of_reservation
        self.price = price


class City:
    def __init__(self, name, id=None):
        self.id = id
        self.name = name

class Genre:
    def __init__(self, name, id=None):
        self.id = id
        self.name = name

