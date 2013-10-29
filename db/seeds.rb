User.destroy_all
Picture.destroy_all
Category.destroy_all
Favourite.destroy_all

u1 = User.create(:username => "Corinne", :email => "cemail@email.com", :image => "http://www.lullabot.com/sites/default/files/styles/medium/public/bio_image/default_user_picture.png?itok=yhSgn5xP", :password => "password", :password_confirmation => "password", :is_admin => true)
u2 = User.create(:username => "Anna", :email => "aemail@email.com", :image => "http://www.lullabot.com/sites/default/files/styles/medium/public/bio_image/default_user_picture.png?itok=yhSgn5xP", :password => "password", :password_confirmation => "password")
u3 = User.create(:username => "Bob", :email => "bemail@email.com", :image => "http://www.lullabot.com/sites/default/files/styles/medium/public/bio_image/default_user_picture.png?itok=yhSgn5xP", :password => "password", :password_confirmation => "password")
u4 = User.create(:username => "Dave", :email => "demail@email.com", :image => "http://www.lullabot.com/sites/default/files/styles/medium/public/bio_image/default_user_picture.png?itok=yhSgn5xP", :password => "password", :password_confirmation => "password")

p1 = Picture.create(:name => "Name", :picture => "http://www.cityofsound.com/photos/uncategorized/2007/05/30/greenberg2.jpg", :description => "descrition here")
p2 = Picture.create(:name => "Name", :picture => "http://webneel.com/daily/sites/default/files/images/daily/06-2013/2-inspiring-photograph-old-age.jpg", :description => "descrition here")
p3 = Picture.create(:name => "Name", :picture => "http://www.faheykleingallery.com/assets/images/photographs/kern/exhibition/photographs/kern_ex_photographs_01.jpg", :description => "descrition here")
p4 = Picture.create(:name => "Name", :picture => "http://petapixel.com/assets/uploads/2012/12/reflections-10.jpg", :description => "descrition here")
p5 = Picture.create(:name => "Name", :picture => "http://creativephotographymagazine.com/wp-content/uploads/2011/04/lady_with_umbrella_by_dannyst-d3c7sfh.jpg", :description => "descrition here")
p6 = Picture.create(:name => "Name", :picture => "http://1.bp.blogspot.com/-nQrDlWbZSWA/UGVhOQErd0I/AAAAAAABw8o/Nj2ShSNb0bE/s640/Vintage+Dog+Photographs+by+Elliott+Erwitt+(10).jpg", :description => "descrition here")
p7 = Picture.create(:name => "Name", :picture => "http://thesmokedetector.files.wordpress.com/2013/01/dovima-with-elephants-evening-dress-by-dior-cirque-dhiver-paris-august-1955.jpg", :description => "descrition here")
p8 = Picture.create(:name => "Name", :picture => "http://images.nationalgeographic.com/wpf/media-live/photos/000/014/cache/first-wildlife-photographs_1408_990x742.jpg", :description => "descrition here")

c1 = Category.create(:name => "People I like")
c2 = Category.create(:name => "My peeps")
c3 = Category.create(:name => "Another category")

f1 = Favourite.create(:name => "I Heart These")
f2 = Favourite.create(:name => "Awesome")
f3 = Favourite.create(:name => "Lolz")
f4 = Favourite.create(:name => "Nice")


# Associate users and pictures
u1.pictures << p1 << p7
u2.pictures << p2 << p8 << p3
u3.pictures << p6 << p4
u4.pictures << p5

# Associate users and favourites
u1.favourites << f1 << f3
u2.favourites << f2
u3.favourites << f4

# Associate users and categories
u2.categories << c3
u4.categories << c1 << c2

# Associate pictures and favourites
p1.favourites << f1
p2.favourites << f1
p3.favourites << f2 << f3
p4.favourites << f3 << f4 << f2 << f1
p5.favourites << f4 << f2 << f4
p6.favourites << f1 << f3 << f4
p7.favourites << f2 << f4 << f1
p8.favourites << f1 << f3







