# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# users
peter = User.create!(username: 'Peter Griffen')
brian = User.create!(username: 'Brian Griffen')
meg  = User.create!(username: 'Meg Griffen')
joe = User.create!(username: 'Joe Swanson')

# authors
jk_rowling = Author.create!(name: 'J. K. Rowling', image_url: 'https://pics.librarything.com/picsizes/3e/9b/3e9bc00722b81c46367767669774330414f6744.jpg')
dumbledore_1 = Author.create!(name: 'Albus Dumbledore 1', image_url: 'https://pics.librarything.com/picsizes/29/8a/298a29de773bddc6368334f6e514330414f6744.jpg')
dumbledore_2 = Author.create!(name: 'Albus Dumbledore 2', image_url: 'https://pics.librarything.com/picsizes/29/8a/298a29de773bddc6368334f6e514330414f6744.jpg')
dumbledore_3 = Author.create!(name: 'Albus Dumbledore 3', image_url: 'https://pics.librarything.com/picsizes/29/8a/298a29de773bddc6368334f6e514330414f6744.jpg')


# books
hp_prisoner = Book.create!(title: "Harry Potter and the Prisoner of Azkaban", page_count: 1234 , year_published: "2010-01-01" , image_url: "https://pics.cdn.librarything.com/picsizes/dd/b9/ddb96bc09edd9c6593241315251434f414f4141.jpg" )
hp_sorcerer = Book.create!(title: "Harry Potter and the Sorcerer's Stone", page_count: 903 , year_published: "2019-05-08" , image_url: "https://pics.cdn.librarything.com/picsizes/bd/73/bd73e9ebf18b34a593551665267434f414f4141.jpg" )
hp_chamber = Book.create!(title: "Harry Potter and the Chamber of Secrets", page_count: 234 , year_published: "2009-01-01" , image_url: "https://pics.cdn.librarything.com/picsizes/d9/d1/d9d13615817b9be593272635351434f414f4141.jpg" )
hp_half = Book.create!(title: "Harry Potter and the Half-Blood Prince", page_count: 432 , year_published: "2011-01-01" , image_url: "https://pics.cdn.librarything.com/picsizes/c3/7f/c37f9cd35eeb1065930546a5251434f414f4141.jpg" )
hp_order = Book.create!(title: "Harry Potter and the Order of the Phoenix", page_count: 543 , year_published: "2012-01-01" , image_url: "https://pics.cdn.librarything.com/picsizes/ef/59/ef59930168456ea593072765351434f414f4141.jpg" )
hp_goblet = Book.create!(title: "Harry Potter and the Goblet of Fire ", page_count: 643 , year_published: "2012-01-01" , image_url: "https://pics.cdn.librarything.com/picsizes/68/21/6821a57deab2edd592b4a4f5341434f414f4141.jpg" )
hp_dealthy = Book.create!(title: "Harry Potter and the Deathly Hallows", page_count: 264 , year_published: "2014-01-01" , image_url: "https://pics.cdn.librarything.com/picsizes/52/27/52271dc59fdadb35938554e5267434f414f4141.jpg" )
hp_beedle = Book.create!(title: "The Tales of Beedle the Bard", page_count: 2345 , year_published: "2014-01-01" , image_url: "https://pics.cdn.librarything.com/picsizes/76/7c/767c4d7aa909090593132575477434f414f4141.jpg" )
hp_fantastic = Book.create!(title: "Fantastic Beasts and Where to Find Them", page_count: 543 , year_published: "2006-01-01" , image_url: "https://images-na.ssl-images-amazon.com/images/P/0439295017.01._SX142_SY224_SCLZZZZZZZ_.jpg" )
hp_quidditch = Book.create!(title: "Quidditch Through the Ages", page_count: 654 , year_published: "1992-01-01" , image_url: "https://images-na.ssl-images-amazon.com/images/P/0439321611.01._SX142_SY224_SCLZZZZZZZ_.jpg" )
casual_vacancy = Book.create!(title: "The Casual Vacancy", page_count: 562 , year_published: "2006-01-01" , image_url: "https://pics.librarything.com/picsizes/98/13/98135cc9133f533596b2f426667434f414f4141.jpg" )
hp_cursed = Book.create!(title: "Harry Potter and the Cursed Child", page_count: 235 , year_published: "2007-01-01" , image_url: "https://images-na.ssl-images-amazon.com/images/P/1338099132.01._SX142_SY224_SCLZZZZZZZ_.jpg" )
cuckoo = Book.create!(title: "The Cuckoo's Calling", page_count: 634 , year_published: "2008-01-01" , image_url: "https://pics.librarything.com/picsizes/43/29/4329b449eef2d94596b38716841434f414f4141.jpg" )
silkworm = Book.create!(title: "The Silkworm", page_count: 236 , year_published: "2005-01-01" , image_url: "https://images-na.ssl-images-amazon.com/images/P/0316206873.01._SX142_SY224_SCLZZZZZZZ_.jpg" )

jk_rowling.books << [hp_prisoner, hp_sorcerer, hp_chamber, hp_half, hp_order, hp_goblet, hp_dealthy, hp_beedle, hp_fantastic, hp_quidditch, casual_vacancy, hp_cursed, cuckoo, silkworm]
dumbledore_1.books << [hp_fantastic, hp_sorcerer, hp_half, hp_order]
dumbledore_2.books << [hp_fantastic, hp_sorcerer, hp_half, hp_order]
dumbledore_3.books << [hp_fantastic, hp_sorcerer, hp_half, hp_order]

#reviews
meg.reviews.create!(title: 'It was only OK', review: '1asdfasdfadsfadsfadfasdfa', rating: 4, book_id: hp_prisoner.id)
meg.reviews.create!(title: 'It was only sucked', review: '2asdfasdfadsfadsfadfasdfa', rating: 4, book_id: hp_sorcerer.id)
joe.reviews.create!(title: 'It was only bad', review: '3asdfasdfadsfadsfadfasdfa', rating: 3, book_id: hp_prisoner.id)
peter.reviews.create!(title: 'It was only great', review: '4asdfasdfadsfadsfadfasdfa', rating: 4, book_id: hp_prisoner.id)
peter.reviews.create!(title: 'It was only decent', review: '5asdfasdfadsfadsfadfasdfa', rating: 4, book_id: hp_chamber.id)
peter.reviews.create!(title: 'It was only bad', review: '6asdfasdfadsfadsfadfasdfa', rating: 3, book_id: silkworm.id)
peter.reviews.create!(title: 'It was only great', review: '7asdfasdfadsfadsfadfasdfa', rating: 4, book_id: hp_dealthy.id)
brian.reviews.create!(title: 'It was only OK', review: '8asdfasdfadsfadsfadfasdfa', rating: 4, book_id: hp_dealthy.id)
brian.reviews.create!(title: 'It was only decent', review: '9asdfasdfadsfadsfadfasdfa', rating: 3, book_id: silkworm.id)


