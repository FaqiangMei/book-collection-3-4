UserBook.destroy_all
User.destroy_all
Book.destroy_all

u1 = User.create!(username: "A")
u2 = User.create!(username: "B")

b1 = Book.create!(title: "Gas", author: "Author1", price: 2, published_date: Date.today)
b2 = Book.create!(title: "Yes and Not", author: "Author2", price: 5, published_date: Date.today)

UserBook.create!(user: u1, book: b1)
UserBook.create!(user: u2, book: b1)
UserBook.create!(user: u2, book: b2)
