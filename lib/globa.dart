class global {
  static bool remember = false;

  static List<Map<String, dynamic>> currency = [
    {
      'id': 1,
      'icon':
          "https://img.freepik.com/free-photo/young-handsome-repairman-blue-overall-yellow-helmet-holding-toolbox-wrench-bearded-plumber-standing-isolated-color-wall-man-working-holds-toolbox-with-instrument_176532-13862.jpg?size=626&ext=jpg",
      'images':
          "https://img.freepik.com/free-vector/happy-family-cleaning-apartment_74855-6501.jpg?w=1060&t=st=1671279092~exp=1671279692~hmac=4b022027fc9fd75ebfbdc6143583f1844e87e3603580e1b8290554bea003b405",
      'category_name': "House Cleaning",
      'detail':
          "If you have a clean home, then you are probably leading a healthy life. Everyone likes to have beautiful-looking and bright rooms, but this can only be achieved if you take home cleaning services regularly. Moreover, cleaning an untidy room should be left up to professional home cleaning services as you may have a lot of productive stuff to do.",
    },
    {
      'id': 2,
      'icon': "https://img.icons8.com/plasticine/2x/housekeeping.png",
      'images':
          "https://safaiwale.in/wp-content/uploads/2020/02/deep-house-cleaning-service-500x500.png",
      'category_name': "HouseKeeping",
      'detail':
          "Housekeeping is not just cleanliness. At Safaiwale. we understand that your time is valuable and cleaning your home or office is the last thing you want to do in your free time. We specialize in taking this worry out of your mind and into our hands. We not only provide cleaning but also peace of mind, so you can spend your time enjoying the important things in life. Effective commercial housekeeping services in Delhi can eliminate some workplace hazards and help get a job done safely and properly. Advanced services provide you with guaranteed quality management.",
    },
    {
      'id': 3,
      'icon':
          "https://img.icons8.com/external-flaticons-lineal-color-flat-icons/2x/external-sofa-cleaning-flaticons-lineal-color-flat-icons.png",
      'images':
          "https://img.freepik.com/free-vector/professional-cleaning-service-isometric-composition-with-character-female-worker-cleaning-sofa-blank-background-vector-illustration_1284-66402.jpg?w=900&t=st=1671279793~exp=1671280393~hmac=5651888a2f6e8cf9c0a57311f6c16dcf4b031c136e81cdd8d0200a975bfac02b",
      'category_name': "Sofa Cleaning",
      'detail':
          "A sofa is considered to be one of the essential furniture that is present in the living room that you might be having and hence it is quite vital that you keep it clean and shiny. We at safaiwale, completely understand the following aspects and thus we provide the services at a very affordable price. If you are looking for a professional sofa cleaning services in Noida, at a very low price, Safaiwale is the best option to contact. 100% quality service.",
    },
    {
      'id': 4,
      'icon':
          "https://img.icons8.com/external-flaticons-lineal-color-flat-icons/2x/external-kitchen-cleaning-flaticons-lineal-color-flat-icons-2.png",
      'images':
          "https://img.freepik.com/premium-vector/girl-is-making-soup-pot-vector-illustration-housewife-cook-feeding-children_469123-749.jpg?w=1060",
      'category_name': "Kitchen Cleaning",
      'detail':
          "In today’s busy schedules nobody has enough time to spend cleaning environments like homes, houses, offices, hospitals, schools, etc. Cleaning service providers play an important role to save the clients time and energy. Although there are many cleaning service providers in Delhi NCR, We, Safaiwale are the best professional kitchen cleaning services in the Delhi NCR and its neighboring cities for over a decade now. Thus we can serve you in the best possible way. The reason is that we are equipped with expert professionals who have access to the latest tools that can help out in getting the job done. Hence, once you hire us everything would be cleaned thoroughly such as ventilators, windows, kitchen tiles, switchboards, exhaust fans, etc.",
    },
    {
      'id': 5,
      'icon':
          "https://img.icons8.com/external-flaticons-lineal-color-flat-icons/2x/external-bathroom-cleaning-flaticons-lineal-color-flat-icons-2.png",
      'images':
          "https://img.freepik.com/free-vector/cleaner-with-cleaning-products-housekeeping-service_18591-52057.jpg?w=740&t=st=1671279717~exp=1671280317~hmac=8eae8cb7e93b70723836e49825367d8ec85e098d12dea8e3847917e7dab366cf",
      'category_name': "Bathroom Cleaning",
      'detail':
          "Bathroom cleaning is considered to be one of the annoying household tasks that you might have come across. It is a daunting task that everyone wishes to finish as soon as possible. So, if you wish to save energy as well as time, then get in touch with a professional like us, Safaiwale, the top-notch bathroom cleaning services in Ghaziabad. We would allow you to relax and perform the entire bathroom cleaning services hygienically.",
    },
    {
      'id': 6,
      'icon':
          "https://img.icons8.com/external-ddara-lineal-color-ddara/2x/external-cleaning-cleaning-ddara-lineal-color-ddara.png",
      'images':
          "https://img.freepik.com/free-vector/cleaner-with-cleaning-products-housekeeping-service_18591-52057.jpg?w=740&t=st=1671279717~exp=1671280317~hmac=8eae8cb7e93b70723836e49825367d8ec85e098d12dea8e3847917e7dab366cf",
      'category_name': "Floor Cleaning",
      'detail':
          "Generally in most of the offices, houses, and restaurants, etc, we consume saltwater to mop up the floor surfaces. So the floor surfaces become dirty and seem to be yellowish, sometimes some kind of oil freezes on it which creates harmful to us. In such conditions, regular floor cleaning is very important to get rid of these issues by well-trained professionals. We, Safaiwale is the best floor cleaning services in Delhi NCR, our experience giving you the new experience after floor cleaning. 100% results guaranteed.",
    },
    {
      'id': 7,
      'icon':
          "https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/2x/external-living-room-interiors-kiranshastry-lineal-color-kiranshastry.png",
      'images':
          "https://img.freepik.com/free-vector/happy-family-cleaning-apartment_74855-6501.jpg?w=1060&t=st=1671279957~exp=1671280557~hmac=7c53797443daa37178d8438f750129d1f675d70d699244c1257a1573f051c486",
      'category_name': "Living Room Cleaning",
      'detail':
          "The Living Room is the most frequented room of the house so it gets dusty at times. Dust may contain molds, fibers, as well as tiny dust mites. These mites, which live in bedding, upholstered furniture, and carpets, thrive in the summer and die in the winter and lead many airy diseases that can spoil the mood and environment of your house. So cleaning is important for living healthy. We, safaiwale are the professional living room cleaning services provider in Delhi NCR with a 100% success rate of client satisfaction. We assure you for your cleanliness and protection of your loved ones.",
    },
    {
      'id': 8,
      'icon':
          "https://image.shutterstock.com/image-vector/sofa-repair-line-icon-upholstered-260nw-707487601.jpg",
      'images':
          "https://img.freepik.com/premium-vector/carpet-cleaning-vector_87720-7592.jpg?w=740",
      'category_name': "Sofa Dry Cleaning",
      'detail':
          "A sofa is considered to be one of the essential furniture that is present in the living room that you might be having and hence it is quite vital that you keep it clean and shiny. We at safaiwale, completely understand the following aspects and thus we provide the services at a very affordable price. If you are looking for a professional sofa cleaning services in Noida, at a very low price, Safaiwale is the best option to contact. 100% quality service.",
    },
    {
      'id': 9,
      'icon': "https://img.icons8.com/color/2x/carpet-cleaning.png",
      'images':
          "https://img.freepik.com/free-vector/housewife-cleaning-home-with-vacuum-cleaner-sofa-house-room-flat-vector-illustration-household-housekeeping_74855-13139.jpg?t=st=1671279408~exp=1671280008~hmac=d0e021efd60b9c0933432f9f07edc7fc18b2b7173960a7122ac8b7372b9e9294",
      'category_name': "Carpet Cleaning",
      'detail':
          "Everyone has a dream of having a clear and clean home, but there are certainly a lot of difficulties that are associated with it. Everyone wants to be satisfied with their home such that they do not look hazy or dull. People might be able to manage dusting or cleaning, but they find it quite difficult to clean the carpets. Safaiwale is the best carpet cleaning services provider in Delhi NCR can clean any carpet that you might be having in a rather hassle-free way. We use the best possible cleaning equipment and top-notch eco-friendly products which ensure that you would be getting the result that you have always desired.",
    },
    {
      'id': 10,
      'icon': "https://img.icons8.com/clouds/2x/roof-tiles.png",
      'images':
          "https://img.freepik.com/free-vector/cleaner-with-cleaning-products-housekeeping-service_18591-52067.jpg?w=740&t=st=1671279866~exp=1671280466~hmac=0cc457ef1ead8e4a914512129e3d6b1f3d403a8fcfd6aefa74780ce0791c6065",
      'category_name': "Tiles Cleaning",
      'detail':
          "Safaiwale a is a brand of Divtech Facilities, offers comprehensive floor restoration and facility Management Services, through the latest technology and expert cleaner.Professional tile floor cleaning services always have the advantage of experience and, they can have a crystal clear idea in how to remove stains in your flooring. We have a wide variety of machines and Chemicals to clean your floor tiles. There are specific cleaners to pull stains out of the surface without damaging the material although you have ceramic , limestone or marble floor tiles. Our services can be onsite quickly so your floor gets finished on your dual schedule.",
    },
    {
      'id': 11,
      'icon':
          "https://img.icons8.com/external-flaticons-lineal-color-flat-icons/2x/external-office-cleaning-flaticons-lineal-color-flat-icons-2.png",
      'images':
          "https://img.freepik.com/free-vector/cleaning-team-with-brooms-vacuum-cleaner-man-woman-uniform-with-professional-equipment-ready-work-together-flat-vector-illustration-cleaning-service-teamwork-occupation-concept_74855-24396.jpg?w=996&t=st=1671280034~exp=1671280634~hmac=6a0024e46a1a25d9ce951b916698d6cfae33d1eec0d02bf689fbbc3f86f2bd64",
      'category_name': "Office Cleaning",
      'detail':
          "A fresh and clean appearance of an organization makes sit quite suitable and attractive to prospective clients. Whether you have a small business or a large one, it is essential that you select the right office cleaning services in Delhi NCR. So, take your organization to the next level and maintain your office by getting in touch with us. We at Safaiwale are specialized in providing deep office cleaning and housekeeping services. And, we are offering our services to a wide range of office owners in Delhi NCR.",
    },
    {
      'id': 12,
      'icon': "https://img.icons8.com/bubbles/2x/air-conditioner.png",
      'images':
          "https://img.freepik.com/free-vector/electrician-service_335657-3186.jpg?w=996&t=st=1671280114~exp=1671280714~hmac=a07bb439559689de78f6ae0eb2d78a79f8a7127f0fda0fc3c638aed800c7e092",
      'category_name': "AC Cleaning",
      'detail':
          "Air conditioners work more effectively when the evaporator and condenser curls or cooling balances are perfect, and the balance is straight. Set aside cash and keep your home cooler by tidying up a room air conditioner yourself. For affordable and quality AC cleaning services, safaiwale is the best option, 100% customer satisfaction guaranteed.",
    },
    {
      'id': 13,
      'icon':
          "https://img.icons8.com/external-linector-lineal-color-linector/2x/external-cleaning-hotel-service-linector-lineal-color-linector.png",
      'images':
          "https://img.freepik.com/free-vector/team-professional-janitors-cleaning-office-vector-illustration-cleaners-job-cleaning-service-hygiene-work-concept_74855-13250.jpg?w=1380&t=st=1671279378~exp=1671279978~hmac=cc3fd859dfe0f2b1ad849359cc8be2c1bf639d7dc1eac0d8ce36fd8a187620dd",
      'category_name': "Restaurant Cleaning",
      'detail':
          "In restaurants, cleaning is very important as it brings lots of business due to the fact that nowadays customers are very much aware of the cleanliness and want hygiene in their food. Safaiwale is the best restaurant cleaning service provider in India, we help you to grow your business by our professional cleaning services.",
    },
    {
      'id': 14,
      'icon':
          "https://img.icons8.com/external-flaticons-flat-flat-icons/2x/external-hotel-cleaning-flaticons-flat-flat-icons.png",
      'images':
          "https://img.freepik.com/free-vector/hotel-room-service-servicing-client-set-woman-housemaid-carrying-linen-man-carry-food-luggage-cart-apartment_529539-46.jpg?w=1060&t=st=1671279828~exp=1671280428~hmac=833465657761a6e9229636c62ad42cc7a3f185a3198c51808df651bb54aab4ed",
      'category_name': "Hotel Cleaning",
      'detail':
          "Safaiwale is one of the best professional Hotel Cleaning services provider in India. We are providing the best solutions for hotel and restaurant cleaning in all aspects. We achieved a 100% success rate with the help of our customers, Delhi, Gurgaon, Ghaziabad, Noida, Greater Noida, and Faridabad",
    },
    {
      'id': 15,
      'icon':
          "https://image.shutterstock.com/image-vector/real-estate-services-residential-district-260nw-675181822.jpg",
      'images':
          "https://img.freepik.com/free-vector/cleaner-with-cleaning-products-housekeeping-service_18591-52057.jpg?w=740&t=st=1671279717~exp=1671280317~hmac=8eae8cb7e93b70723836e49825367d8ec85e098d12dea8e3847917e7dab366cf",
      'category_name': "Residential Services",
      'detail':
          "We, Safaiwale, professional cleaning service providers in India, provide the best multiple residential services including deep cleaning of the house. Our consumer centering approach gives total satisfaction to our clients.",
    },
    {
      'id': 16,
      'icon': "https://img.icons8.com/plasticine/512/business-buildings.png",
      'images':
          "https://img.freepik.com/free-vector/cleaning-team-with-brooms-vacuum-cleaner-man-woman-uniform-with-professional-equipment-ready-work-together-flat-vector-illustration-cleaning-service-teamwork-occupation-concept_74855-24396.jpg?w=996&t=st=1671279582~exp=1671280182~hmac=d9186b251e8f6306f5e67d29f881af1a993c9f7d90124d6d331453320b2085a5",
      'category_name': "Commercial Services",
      'detail':
          "Safaiwale provides commercial cleaning services in Delhi NCR at most affordable prices and, the services are available to offices, factories/manufacturing units, Malls, showrooms, Business Park, educational institutions, hospitality sectors, and multiplexes by our well-trained staff. We always maintain quality cleaning Chemicals and equipment.",
    },
    {
      'id': 17,
      'icon': "https://img.icons8.com/doodle/512/green-earth.png",
      'images':
          "https://img.freepik.com/free-vector/air-conditioning-repair-mounting-service-repairman-installing-examining-repairing-conditioner-with-special-tools-equipment-isolated-vector-illustration_613284-50.jpg?w=740&t=st=1671279517~exp=1671280117~hmac=41c2ab86ddadf202fd5c94d2ef996e994dc720198bf626ac4aeb8931b99962f5",
      'category_name': "Green Services",
      'detail':
          "Our green clean experts use non-toxic and artificial fragrance-free cleaning solutions that are safe to use in households with pets and small children.",
    },
    {
      'id': 18,
      'icon': "https://img.icons8.com/fluency/512/car-cleaning.png",
      'images':
          "https://img.freepik.com/free-vector/detailed-car-wash-service-concept-illustration_23-2149038677.jpg?w=996&t=st=1671279912~exp=1671280512~hmac=41bea2bfca7984ecbf52ff6d5cdcaa820734126be024221df556d840444f96c7",
      'category_name': "Car Cleaning",
      'detail':
          "Car cleaning is as important as other cleaning environments such as houses, offices, and hotels, etc. Cleaning a car means washing a car, it forestalls contaminants like residue, earth, dust, tree sap, bug guts, salt, air-borne contamination from holding fast to your car. Vehicle specialists suggest washing your car once every week to effectively keep contaminants from harming your paint and finish. For affordable and quality car cleaning services, safaiwale is the best option, Doorstep service and 100% customer satisfaction guaranteed.",
    },
  ];
}
