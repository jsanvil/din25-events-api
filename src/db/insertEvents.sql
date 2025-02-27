DELETE FROM events;

INSERT INTO events (title, description, date, location, image, price)
VALUES ('New Year Eve Party', 'Celebrate the end of the year with a bang', '2025-12-31', 'Times Square', 'https://picsum.photos/seed/newyearseveparty/300/200', 150.00), 
  ('Charity Gala', 'A night of giving and glamour', '2025-01-15', 'Grand Ballroom', 'https://picsum.photos/seed/charitygala/300/200', 75.00), 
  ('Tech Conference', 'The latest in tech innovations', '2025-03-10', 'Convention Center', 'https://picsum.photos/seed/techconference/300/200', 200.00), 
  ('Community Picnic', 'A fun day for the whole family', '2025-04-20', 'Central Park', 'https://picsum.photos/seed/communitypicnic/300/200', 0.00),
  ('Luxury Auction', 'Bid on exclusive items', '2025-05-05', 'Luxury Hall', 'https://picsum.photos/seed/luxuryauction/300/200', 1000.00),
  ('Local Market', 'Fresh produce and handmade goods', '2025-06-15', 'Market Square', 'https://picsum.photos/seed/localmarket/300/200', 10.00),
  ('Affordable Art Show', 'Art for everyone', '2025-07-25', 'Art Gallery', 'https://picsum.photos/seed/affordableartshow/300/200', 30.00),
  ('Fashion Show', 'The latest trends in fashion', '2025-08-30', 'Fashion Hall', 'https://picsum.photos/seed/fashionshow/300/200', 500.00),
  ('VIP Concert', 'An exclusive music experience', '2025-09-10', 'Concert Hall', 'https://picsum.photos/seed/vipconcert/300/200', 2500.00),
  ('Inclusive Festival', 'A celebration for all', '2025-10-05', 'Festival Grounds', 'https://picsum.photos/seed/inclusivefestival/300/200', 50.00),
  ('Music Festival', 'A weekend of music and fun', '2025-11-20', 'Festival Park', 'https://picsum.photos/seed/musicfestival/300/200', 120.00),
  ('Food Truck Rally', 'Gourmet food on wheels', '2025-12-10', 'City Center', 'https://picsum.photos/seed/foodtruckrally/300/200', 20.00),
  ('Book Fair', 'Discover new books and authors', '2025-01-25', 'Library Plaza', 'https://picsum.photos/seed/bookfair/300/200', 5.00),
  ('Film Screening', 'Watch the latest indie films', '2025-02-15', 'Cinema Hall', 'https://picsum.photos/seed/filmscreening/300/200', 15.00),
  ('Wine Tasting', 'Sample fine wines', '2025-03-05', 'Vineyard', 'https://picsum.photos/seed/winetasting/300/200', 50.00),
  ('Art Workshop', 'Learn to paint and draw', '2025-04-10', 'Art Studio', 'https://picsum.photos/seed/artworkshop/300/200', 25.00),
  ('Yoga Retreat', 'Relax and rejuvenate', '2025-05-20', 'Wellness Center', 'https://picsum.photos/seed/yogaretreat/300/200', 200.00),
  ('Cooking Class', 'Master the art of cooking', '2025-06-30', 'Culinary School', 'https://picsum.photos/seed/cookingclass/300/200', 100.00),
  ('Dance Performance', 'Enjoy a night of dance', '2025-07-15', 'Dance Theater', 'https://picsum.photos/seed/danceperformance/300/200', 75.00),
  ('Science Expo', 'Explore the wonders of science', '2025-08-25', 'Expo Center', 'https://picsum.photos/seed/scienceexpo/300/200', 30.00),
  ('Marathon', 'Run for a cause', '2025-09-05', 'City Streets', 'https://picsum.photos/seed/marathon/300/200', 50.00),
  ('Pet Adoption Fair', 'Find your new best friend', '2025-10-15', 'Animal Shelter', 'https://picsum.photos/seed/petadoptionfair/300/200', 0.00),
  ('Craft Fair', 'Handmade crafts and goods', '2025-11-25', 'Craft Market', 'https://picsum.photos/seed/craftfair/300/200', 10.00),
  ('Comedy Show', 'Laugh the night away', '2025-12-05', 'Comedy Club', 'https://picsum.photos/seed/comedyshow/300/200', 40.00),
  ('Historical Tour', 'Discover the city history', '2025-01-10', 'Old Town', 'https://picsum.photos/seed/historicaltour/300/200', 20.00),
  ('Photography Exhibition', 'See stunning photographs', '2025-02-20', 'Photo Gallery', 'https://picsum.photos/seed/photographyexhibition/300/200', 15.00),
  ('Theater Play', 'Enjoy a live theater performance', '2025-03-30', 'Main Theater', 'https://picsum.photos/seed/theaterplay/300/200', 60.00),
  ('Gardening Workshop', 'Learn to grow your own garden', '2025-04-15', 'Community Garden', 'https://picsum.photos/seed/gardeningworkshop/300/200', 20.00),
  ('Karaoke Night', 'Sing your heart out', '2025-05-25', 'Karaoke Bar', 'https://picsum.photos/seed/karaokenight/300/200', 10.00),
  ('Magic Show', 'Be amazed by magic tricks', '2025-06-05', 'Magic Theater', 'https://picsum.photos/seed/magicshow/300/200', 35.00),
  ('Beer Festival', 'Sample craft beers', '2025-07-10', 'Brewery', 'https://picsum.photos/seed/beerfestival/300/200', 45.00),
  ('Fitness Bootcamp', 'Get in shape with a bootcamp', '2025-08-20', 'Fitness Center', 'https://picsum.photos/seed/fitnessbootcamp/300/200', 25.00),
  ('Charity Run', 'Run to support a cause', '2025-09-30', 'Park', 'https://picsum.photos/seed/charityrun/300/200', 30.00),
  ('Jazz Concert', 'Enjoy live jazz music', '2025-10-10', 'Jazz Club', 'https://picsum.photos/seed/jazzconcert/300/200', 50.00),
  ('Poetry Reading', 'Listen to live poetry', '2025-11-20', 'Bookstore', 'https://picsum.photos/seed/poetryreading/300/200', 10.00),
  ('Cultural Festival', 'Celebrate diverse cultures', '2025-12-15', 'Cultural Center', 'https://picsum.photos/seed/culturalfestival/300/200', 25.00),
  ('Stand-Up Comedy', 'Laugh with stand-up comedians', '2025-01-05', 'Comedy Theater', 'https://picsum.photos/seed/standupcomedy/300/200', 40.00),
  ('Meditation Session', 'Find your inner peace', '2025-02-10', 'Meditation Center', 'https://picsum.photos/seed/meditationsession/300/200', 15.00),
  ('Rock Concert', 'Rock out with live music', '2025-03-20', 'Rock Arena', 'https://picsum.photos/seed/rockconcert/300/200', 80.00),
  ('Ballet Performance', 'Enjoy a beautiful ballet', '2025-04-30', 'Ballet Theater', 'https://picsum.photos/seed/balletperformance/300/200', 70.00),
  ('Cooking Competition', 'Watch chefs compete', '2025-05-10', 'Culinary Arena', 'https://picsum.photos/seed/cookingcompetition/300/200', 25.00),
  ('Science Workshop', 'Hands-on science activities', '2025-06-20', 'Science Lab', 'https://picsum.photos/seed/scienceworkshop/300/200', 20.00),
  ('Outdoor Movie Night', 'Watch a movie under the stars', '2025-07-05', 'Outdoor Theater', 'https://picsum.photos/seed/outdoormovienight/300/200', 10.00),
  ('Art Auction', 'Bid on beautiful art pieces', '2025-08-15', 'Auction House', 'https://picsum.photos/seed/artauction/300/200', 100.00),
  ('Food Festival', 'Taste dishes from around the world', '2025-09-25', 'Food Court', 'https://picsum.photos/seed/foodfestival/300/200', 30.00),
  ('Wine and Cheese Night', 'Pair fine wines with cheeses', '2025-10-30', 'Wine Bar', 'https://picsum.photos/seed/wineandcheesenight/300/200', 50.00),
  ('Fitness Expo', 'Explore the latest in fitness', '2025-11-10', 'Expo Hall', 'https://picsum.photos/seed/fitnessexpo/300/200', 20.00),
  ('Charity Auction', 'Bid on items for a good cause', '2025-12-05', 'Charity Hall', 'https://picsum.photos/seed/charityauction/300/200', 100.00),
  ('Music Jam Session', 'Join a live music jam', '2025-01-20', 'Music Studio', 'https://picsum.photos/seed/musicjamsession/300/200', 15.00),
  ('Fashion Pop-Up', 'Shop the latest fashion trends', '2025-02-25', 'Pop-Up Shop', 'https://picsum.photos/seed/fashionpopup/300/200', 25.00),
  ('Outdoor Yoga', 'Yoga in the park', '2025-03-15', 'City Park', 'https://picsum.photos/seed/outdooryoga/300/200', 10.00),
  ('Live Podcast', 'Watch a live podcast recording', '2025-04-25', 'Podcast Studio', 'https://picsum.photos/seed/livepodcast/300/200', 20.00),
  ('Gaming Tournament', 'Compete in a gaming tournament', '2025-05-30', 'Gaming Arena', 'https://picsum.photos/seed/gamingtournament/300/200', 50.00),
  ('Trivia Night', 'Test your knowledge', '2025-06-10', 'Trivia Bar', 'https://picsum.photos/seed/trivianight/300/200', 10.00),
  ('Kite Festival', 'Fly kites with the family', '2025-07-20', 'Beach', 'https://picsum.photos/seed/kitefestival/300/200', 5.00),
  ('Pet Show', 'Show off your pets', '2025-08-30', 'Pet Park', 'https://picsum.photos/seed/petshow/300/200', 10.00),
  ('Ice Skating Show', 'Watch a spectacular ice show', '2025-09-10', 'Ice Rink', 'https://picsum.photos/seed/iceskatingshow/300/200', 30.00),
  ('Flower Show', 'See beautiful flower arrangements', '2025-10-20', 'Botanical Garden', 'https://picsum.photos/seed/flowershow/300/200', 15.00),
  ('Holiday Market', 'Shop for holiday gifts', '2025-11-30', 'Holiday Market', 'https://picsum.photos/seed/holidaymarket/300/200', 20.00),
  ('New Year Day Parade', 'Celebrate the new year', '2025-01-01', 'Main Street', 'https://picsum.photos/seed/newyearsdayparade/300/200', 0.00);
