
class Hotel {
  String? image;
  String? title;
  String? description;
  String? type;
  String? location;
  double? id;
  int? price;
  double? rate;


 Hotel(this.image,this.title,this.description,this.type,this.location,this.id, this.price,this.rate);


static List<Hotel> recommendation = [
  Hotel("https://images.pexels.com/photos/271619/pexels-photo-271619.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Hotel Hypnos", "Welcome to hotel", "Single Room", "Delhi", 100, 1500, 5),
  Hotel("https://images.pexels.com/photos/1579253/pexels-photo-1579253.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Hotel Iris ", "Welcome to hotel", "Double Room", "Himachal Pradesh", 100, 1550, 5),
  Hotel("https://images.pexels.com/photos/237371/pexels-photo-237371.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Hotel Azul ", "Welcome to hotel", "Villa Room", "Uttarakhand", 100, 1600, 5),
  Hotel("https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Hotel Ebony", "Welcome to hotel", "Cottage Room", "Jammu Kashmir", 100, 1650, 5),
  Hotel("https://images.pexels.com/photos/262048/pexels-photo-262048.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Hotel Altheda", "Welcome to hotel", "Cottage Room", "Haryana", 100, 1700, 5),
  Hotel("https://images.pexels.com/photos/164595/pexels-photo-164595.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Superior Room", "Welcome to hotel", "Cottage Room", "West Bengal", 100, 1750, 5),
  Hotel("https://images.pexels.com/photos/237371/pexels-photo-237371.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Hotel Aurelia", "Welcome to hotel", "Villa Room", "Rajasthan", 100, 1800, 5),
  Hotel("https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Hotel Citrus", "Welcome to hotel", "Cottage Room", "Punjab", 100, 1900, 5),
  Hotel("https://images.pexels.com/photos/262048/pexels-photo-262048.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Hotel The Nectarine", "Welcome to hotel", "Cottage Room", "Uttar Pradesh", 100, 2000, 5),



  Hotel("https://images.pexels.com/photos/210265/pexels-photo-210265.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Hotel The Nectarine", "Welcome to hotel", "Single Room", "Delhi", 100, 1550, 5),
  Hotel("https://images.pexels.com/photos/1457842/pexels-photo-1457842.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Hotel Saros", "Welcome to hotel", "Double Room", "Himachal Pradesh", 100, 1800, 5),
  Hotel("https://images.pexels.com/photos/97083/pexels-photo-97083.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Hotel Odyssey Resort", "Welcome to hotel", "Villa Room", "Uttarakhand", 100, 1750, 5),
  Hotel("https://images.pexels.com/photos/2029722/pexels-photo-2029722.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Mirrors Hotel", "Welcome to hotel", "Cottage Room", "Jammu Kashmir", 100, 1999, 5),
  Hotel("https://images.pexels.com/photos/271643/pexels-photo-271643.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Aether Hotel", "Welcome to hotel", "Cottage Room", "Haryana", 100, 2150, 5),
  Hotel("https://images.pexels.com/photos/210604/pexels-photo-210604.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Primrose High Hotel", "Welcome to hotel", "Cottage Room", "West Bengal", 100, 1650, 5),
  Hotel("https://images.pexels.com/photos/237371/pexels-photo-237371.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Hotel Ceilo", "Welcome to hotel", "Villa Room", "Rajasthan", 100, 1890, 5),
  Hotel("https://images.pexels.com/photos/3659683/pexels-photo-3659683.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Hotel Dritan Stay", "Welcome to hotel", "Cottage Room", "Punjab", 100, 1250, 5),
  Hotel("https://images.pexels.com/photos/3659683/pexels-photo-3659683.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Hotel Eight Foot", "Welcome to hotel", "Cottage Room", "Uttar Pradesh", 100, 999, 5),



  Hotel("https://images.pexels.com/photos/1743231/pexels-photo-1743231.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Jade Hotel", "Welcome to hotel", "Single Room", "Delhi", 100, 2150, 5),
  Hotel("https://images.pexels.com/photos/172872/pexels-photo-172872.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Hotel Gaia", "Welcome to hotel", "Double Room", "Himachal Pradesh", 100, 1890, 5),
  Hotel("https://images.pexels.com/photos/3144580/pexels-photo-3144580.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Hotel Indigo ", "Welcome to hotel", "Villa Room", "Uttarakhand", 100, 1499, 5),
  Hotel("https://images.pexels.com/photos/276671/pexels-photo-276671.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Hotel 25 Hazel", "Welcome to hotel", "Cottage Room", "Jammu Kashmir", 100, 1599, 5),
  Hotel("https://images.pexels.com/photos/3201758/pexels-photo-3201758.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Hotel Melanie", "Welcome to hotel", "Cottage Room", "Haryana", 100, 1650, 5),
  Hotel("https://images.pexels.com/photos/2029698/pexels-photo-2029698.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Truth Hotel", "Welcome to hotel", "Cottage Room", "West Bengal", 100, 1250, 5),
  Hotel("https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Hotel Beatrix ", "Welcome to hotel", "Villa Room", "Rajasthan", 100, 1350, 5),
  Hotel("https://images.pexels.com/photos/271743/pexels-photo-271743.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "The Gregory Hotel", "Welcome to hotel", "Cottage Room", "Punjab", 100, 1980, 5),
  Hotel("https://plus.unsplash.com/premium_photo-1678297269904-6c46528b36a7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Hotel Tangerine", "Welcome to hotel", "Cottage Room", "Uttar Pradesh", 100, 1399, 5),




  Hotel("https://images.unsplash.com/photo-1611892440504-42a792e24d32?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Hotel Columba ", "Welcome to hotel", "Single Room", "Delhi", 100, 1700, 5),
  Hotel("https://images.unsplash.com/photo-1611892440504-42a792e24d32?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Blue Jay Hotel", "Welcome to hotel", "Double Room", "Himachal Pradesh", 100, 1150, 5),
  Hotel("https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Ignite Hotel", "Welcome to hotel", "Villa Room", "Uttarakhand", 100, 1650, 5),
  Hotel("https://images.unsplash.com/photo-1618773928121-c32242e63f39?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Hotel New Apollo", "Welcome to hotel", "Cottage Room", "Jammu Kashmir", 100, 1600, 5),
  Hotel("https://images.unsplash.com/photo-1591088398332-8a7791972843?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
      "Hotel Pearl Lodge", "Welcome to hotel", "Cottage Room", "Haryana", 100, 1800, 5),
  Hotel("https://images.unsplash.com/flagged/photo-1556438758-8d49568ce18e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80",
      "Cider Hotel", "Welcome to hotel", "Cottage Room", "West Bengal", 100, 1999, 5),
  Hotel("https://images.unsplash.com/photo-1568495248636-6432b97bd949?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
      "Sequoia Hotel", "Welcome to hotel", "Villa Room", "Rajasthan", 100, 2050, 5),
  Hotel("https://images.unsplash.com/photo-1568495248636-6432b97bd949?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
      "Hotel Olive Garden", "Welcome to hotel", "Cottage Room", "Punjab", 100, 1350, 5),
  Hotel("https://plus.unsplash.com/premium_photo-1678297270523-8775c817d0b3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "Hotel Cedar Point", "Welcome to hotel", "Cottage Room", "Uttar Pradesh", 100, 1299, 5),




  Hotel("https://images.unsplash.com/photo-1566195992011-5f6b21e539aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
      "Hotel Gazella", "Welcome to hotel", "Single Room", "Delhi", 100, 1550, 5),
  Hotel("https://images.unsplash.com/photo-1605346434674-a440ca4dc4c0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "Superior Room", "Welcome to hotel", "Double Room", "Himachal Pradesh", 100, 1950, 5),
  Hotel("https://images.unsplash.com/photo-1631049552057-403cdb8f0658?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Hotel 101 Clover", "Welcome to hotel", "Villa Room", "Uttarakhand", 100, 1750, 5),
  Hotel("https://images.unsplash.com/photo-1629140727571-9b5c6f6267b4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80",
      "Hazelwood Hotel", "Welcome to hotel", "Cottage Room", "Jammu Kashmir", 100, 1800, 5),
  Hotel("https://images.unsplash.com/photo-1566665797739-1674de7a421a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
      "Alyvia Hotel", "Welcome to hotel", "Cottage Room", "Haryana", 100, 2100, 5),
  Hotel("https://images.unsplash.com/photo-1595576508898-0ad5c879a061?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
      "Stargaze Hote", "Welcome to hotel", "Cottage Room", "West Bengal", 100, 1650, 5),
  Hotel("https://images.unsplash.com/photo-1578683010236-d716f9a3f461?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Hotel Seek Safari", "Welcome to hotel", "Villa Room", "Rajasthan", 100, 1450, 5),
  Hotel("https://images.unsplash.com/photo-1578683010236-d716f9a3f461?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Hotel Blizzard", "Welcome to hotel", "Cottage Room", "Punjab", 100, 1999, 5),
  Hotel("https://plus.unsplash.com/premium_photo-1661964402307-02267d1423f5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1073&q=80",
      "Superior Room", "Welcome to hotel", "Cottage Room", "Uttar Pradesh", 100, 1250, 5),





  Hotel("https://images.unsplash.com/photo-1609766857041-ed402ea8069a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Hotel Stardust Cabin", "Welcome to hotel", "Single Room", "Delhi", 100, 1850, 5),
  Hotel("https://images.unsplash.com/photo-1609766857041-ed402ea8069a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Atlas Hotel", "Welcome to hotel", "Double Room", "Himachal Pradesh", 100, 1850, 5),
  Hotel("https://images.unsplash.com/photo-1631049552057-403cdb8f0658?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Hotel Panthera", "Welcome to hotel", "Villa Room", "Uttarakhand", 100, 1850, 5),
  Hotel("https://images.unsplash.com/photo-1578898886225-c7c894047899?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "Hotel Atlas Villa", "Welcome to hotel", "Cottage Room", "Jammu Kashmir", 100, 1399, 5),
  Hotel("https://images.unsplash.com/photo-1587985064135-0366536eab42?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Hesperus", "Welcome to hotel", "Cottage Room", "Haryana", 100, 1650, 5),
  Hotel("https://images.unsplash.com/photo-1595576508898-0ad5c879a061?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
      "The Jasmine Hotel", "Welcome to hotel", "Cottage Room", "West Bengal", 100, 1900, 5),
  Hotel("https://images.unsplash.com/photo-1631049552240-59c37f38802b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Voltage Hotel", "Welcome to hotel", "Villa Room", "Rajasthan", 100, 1800, 5),
  Hotel("https://images.unsplash.com/photo-1618221118493-9cfa1a1c00da?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332&q=80",
      "El Arturo", "Welcome to hotel", "Cottage Room", "Punjab", 100, 1450, 5),
  Hotel("https://images.unsplash.com/photo-1578898886615-0c4719f932dc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "Giselle Hotel", "Welcome to hotel", "Cottage Room", "Uttar Pradesh", 100, 2150, 5),




  Hotel("https://images.unsplash.com/photo-1611892440504-42a792e24d32?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Blaise Hotel", "Welcome to hotel", "Single Room", "Delhi", 100, 1900, 5),
  Hotel("https://images.unsplash.com/photo-1631049307264-da0ec9d70304?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Stamp Hotel", "Welcome to hotel", "Double Room", "Himachal Pradesh", 100, 1950, 5),
  Hotel("https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Hotel Antheia ", "Welcome to hotel", "Villa Room", "Uttarakhand", 100, 1900, 5),
  Hotel("https://images.unsplash.com/photo-1591088398332-8a7791972843?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
      "Hotel Saffron", "Welcome to hotel", "Cottage Room", "Jammu Kashmir", 100, 1500, 5),
  Hotel("https://images.unsplash.com/flagged/photo-1556438758-8d49568ce18e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80",
      "New Age Hotel", "Welcome to hotel", "Cottage Room", "Haryana", 100, 1450, 5),
  Hotel("https://images.unsplash.com/photo-1562438668-bcf0ca6578f0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1460&q=80",
      "Calantha Hotel", "Welcome to hotel", "Cottage Room", "West Bengal", 100, 1750, 5),
  Hotel("https://images.unsplash.com/photo-1631049035182-249067d7618e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Superior Room", "Welcome to hotel", "Villa Room", "Rajasthan", 100, 1550, 5),
  Hotel("https://images.unsplash.com/photo-1598928636135-d146006ff4be?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Hotel Emerald", "Welcome to hotel", "Cottage Room", "Punjab", 100, 1380, 5),
  Hotel("https://images.unsplash.com/photo-1609766857041-ed402ea8069a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "The Antoni Hotel", "Welcome to hotel", "Cottage Room", "Uttar Pradesh", 100, 1299, 5),




  Hotel("https://images.unsplash.com/photo-1631049552057-403cdb8f0658?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Emerge Hotel", "Welcome to hotel", "Single Room", "Delhi", 100, 1950, 5),
  Hotel("https://images.unsplash.com/photo-1612320582827-a95ab2596dbc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80",
      "Hotel Badru", "Welcome to hotel", "Double Room", "Himachal Pradesh", 100, 2000, 5),
  Hotel("https://images.unsplash.com/photo-1612320582827-a95ab2596dbc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80",
      "Big Bang Hotel", "Welcome to hotel", "Villa Room", "Uttarakhand", 100, 1950, 5),
  Hotel("https://images.unsplash.com/photo-1612152605347-f93296cb657d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Cupcake Hotel", "Welcome to hotel", "Cottage Room", "Jammu Kashmir", 100, 2050, 5),
  Hotel("https://images.unsplash.com/photo-1578898886615-0c4719f932dc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "Less Hotel", "Welcome to hotel", "Cottage Room", "Haryana", 100, 1295, 5),
  Hotel("https://images.unsplash.com/photo-1578898886615-0c4719f932dc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "The May Day", "Welcome to hotel", "Cottage Room", "West Bengal", 100, 1980, 5),
  Hotel("https://images.unsplash.com/photo-1605346434674-a440ca4dc4c0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "Red Box Hotel", "Welcome to hotel", "Villa Room", "Rajasthan", 100, 1600, 5),
  Hotel("https://images.unsplash.com/photo-1631049421450-348ccd7f8949?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Hotel Snooze Lodge", "Welcome to hotel", "Cottage Room", "Punjab", 100, 1349, 5),
  Hotel("https://images.unsplash.com/photo-1631049421450-348ccd7f8949?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Vagabond Cabin", "Welcome to hotel", "Cottage Room", "Uttar Pradesh", 100, 1199, 5),




  Hotel("https://images.unsplash.com/photo-1609766975297-92f28e2db184?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Voltage Hotel", "Welcome to hotel", "Single Room", "Delhi", 100, 2000, 5),
  Hotel("https://images.unsplash.com/photo-1609766975297-92f28e2db184?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Raspberry Hotel", "Welcome to hotel", "Double Room", "Himachal Pradesh", 100, 1400, 5),
  Hotel("https://images.unsplash.com/photo-1578683010236-d716f9a3f461?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Hotel Roam Cabin", "Welcome to hotel", "Villa Room", "Uttarakhand", 100, 1999, 5),
  Hotel("https://images.unsplash.com/photo-1578683010236-d716f9a3f461?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Coconut Suite Hotel", "Welcome to hotel", "Cottage Room", "Jammu Kashmir", 100, 1850, 5),
  Hotel("https://images.unsplash.com/photo-1578683010236-d716f9a3f461?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Butterscotch Hotel", "Welcome to hotel", "Cottage Room", "Haryana", 100, 1800, 5),
  Hotel("https://images.unsplash.com/photo-1587985064135-0366536eab42?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Hotel Honey Cabin", "Welcome to hotel", "Cottage Room", "West Bengal", 100, 1250, 5),
  Hotel("https://images.unsplash.com/photo-1611892441796-ae6af0ec2cc8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Superior Room", "Welcome to hotel", "Villa Room", "Rajasthan", 100, 1200, 5),
  Hotel("https://images.unsplash.com/photo-1603072387865-e48a022fc541?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Apricot Inn", "Welcome to hotel", "Cottage Room", "Punjab", 100, 1350, 5),
  Hotel("https://images.unsplash.com/photo-1603072387865-e48a022fc541?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Finch Inn", "Welcome to hotel", "Cottage Room", "Uttar Pradesh", 100, 1499, 5),



  Hotel("https://images.unsplash.com/photo-1619292585355-ab0e3fd509fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80",
      "Orson Hotel", "Welcome to hotel", "Single Room", "Delhi", 100, 1990, 5),
  Hotel("https://images.unsplash.com/photo-1619292585355-ab0e3fd509fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80",
      "The Bobcat Hotel", "Welcome to hotel", "Double Room", "Himachal Pradesh", 100, 1250, 5),
  Hotel("https://images.unsplash.com/photo-1619292585355-ab0e3fd509fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80",
      "Easy Tucan Hotel", "Welcome to hotel", "Villa Room", "Uttarakhand", 100, 2050, 5),
  Hotel("https://images.unsplash.com/photo-1608198399988-341f712c3711?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Hotel Find Wonderland", "Welcome to hotel", "Cottage Room", "Jammu Kashmir", 100, 2100, 5),
  Hotel("https://images.unsplash.com/photo-1571508601891-ca5e7a713859?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Graze Inn", "Welcome to hotel", "Cottage Room", "Haryana", 100, 1450, 5),
  Hotel("https://images.unsplash.com/photo-1541123356219-284ebe98ae3b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "A sleepy hollow Hotel", "Welcome to hotel", "Cottage Room", "West Bengal", 100, 1780, 5),
  Hotel("https://images.unsplash.com/photo-1588861424526-28303cffbdd4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
      "Hotel Slumber Cottage", "Welcome to hotel", "Villa Room", "Rajasthan", 100, 1950, 5),
  Hotel("https://images.unsplash.com/photo-1629140727571-9b5c6f6267b4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80",
      "Delve Inn", "Welcome to hotel", "Cottage Room", "Punjab", 100, 1350, 5),
  Hotel("https://images.unsplash.com/photo-1618221823713-ca8c0e6c9992?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332&q=80",
      "The Sandcastle Hotel", "Welcome to hotel", "Cottage Room", "Uttar Pradesh", 100, 1150, 5),

] ;

  }