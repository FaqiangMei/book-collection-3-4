UserBook.destroy_all
User.destroy_all
Book.destroy_all

u1 = User.create!(username: "A")
u2 = User.create!(username: "B")
u3 = User.create!(username: "C")
u4 = User.create!(username: "D")
u5 = User.create!(username: "E")
b1 = Book.create!(title: "Gas", author: "Author1", price: 2, published_date: Date.today)
b2 = Book.create!(title: "Yes", author: "Author2", price: 5, published_date: Date.today)
b3 = Book.create!(title: "Windon", author: "Author3", price: 3.99, published_date: Date.today)
b4 = Book.create!(title: "Sunright", author: "Author4", price: 6, published_date: Date.today)
b5 = Book.create!(title: "Fishing", author: "Author5", price: 2, published_date: Date.today)
b6 = Book.create!(title: "Booking", author: "Author6", price: 9, published_date: Date.today)

UserBook.create!(user: u1, book: b1)
UserBook.create!(user: u2, book: b1)
UserBook.create!(user: u2, book: b2)
UserBook.create!(user: u4, book: b1)
UserBook.create!(user: u5, book: b5)
UserBook.create!(user: u4, book: b6)
