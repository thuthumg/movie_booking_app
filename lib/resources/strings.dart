import 'package:movie_booking_app/constants/filter_obj.dart';
import 'package:movie_booking_app/constants/food_and_beverage_item_obj.dart';
import 'package:movie_booking_app/constants/movie_seat_grid_list_view_obj.dart';
import 'package:movie_booking_app/constants/movie_seat_list_view_obj.dart';
import 'package:movie_booking_app/pages/cinema_info_detail_page.dart';
import 'package:movie_booking_app/pages/profile_page.dart';
import 'package:movie_booking_app/pages/ticket_page.dart';

const MAIN_SCREEN_APP_BAR_TITLE = "Discover";
const MAIN_SCREEN_BEST_POPULAR_MOVIES_AND_SERIALS =  "BEST POPULAR MOVIES AND SERIALS";
const MAIN_SCREEN_CHECK_MOVIE_SHOWTIMES = "Check Movie\nShowtimes";
const MAIN_SCREEN_SEE_MORE = "SEE MORE";

const SHOW_CASES_TITLE = "SHOWCASES";
const SHOW_CASES_SEE_MORE = "MORE SHOWCASES";
const BEST_ACTORS_TITLE = "BEST ACTORS";
const BEST_ACTORS_SEE_MORE = "MORE ACTORS";

const MOVIE_DETAILS_SCREEN_ACTORS_TITLE = "ACTORS";
const MOVIE_DETAILS_SCREEN_CREATORS_TITLE = "CREATORS";
const MOVIE_DETAILS_SCREEN_CREATORS_SEE_MORE = "MORE CREATORS";
const MOVIE_DETAILS_STORYLINE_TITLE = "STORYLINE";




const String SEAT_TYPE_AVAILABLE = "available";
const String SEAT_TYPE_TAKEN = "taken";
const String SEAT_TYPE_TEXT = "text";
const String SEAT_TYPE_EMPTY = "space";
const String SEAT_TYPE_SELECTION = "selection";
const String SEAT_TYPE_GOLD_TAKEN = "goldTaken";
const String SEAT_TYPE_GOLD_AVAILABLE = "goldAvailable";
const String SEAT_TYPE_GOLD_SELECTION = "goldSelection";


var showMovieSeatList = <MovieSeatListViewObj>[

  MovieSeatListViewObj("Normal(4500ks)",showNormalSeatObject),
  MovieSeatListViewObj("Executive(6500ks)",showExecutiveSeatObject),
  MovieSeatListViewObj("Premium(8500ks)",showPremiumSeatObject),
  MovieSeatListViewObj("Gold(10000ks)", showGoldSeatObject)
];
var showNormalSeatObject = <MovieSeatGridListViewObject>[
  MovieSeatGridListViewObject(title: "A", type: SEAT_TYPE_TEXT),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_EMPTY),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "A", type: SEAT_TYPE_TEXT),

  MovieSeatGridListViewObject(title : "B", type : SEAT_TYPE_TEXT),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_EMPTY),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title : "B", type : SEAT_TYPE_TEXT),
];
var showExecutiveSeatObject = <MovieSeatGridListViewObject>[
  MovieSeatGridListViewObject(title: "C", type: SEAT_TYPE_TEXT),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_EMPTY),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "C", type: SEAT_TYPE_TEXT),

  MovieSeatGridListViewObject(title : "D", type : SEAT_TYPE_TEXT),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_EMPTY),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title : "D", type : SEAT_TYPE_TEXT),
];
var showPremiumSeatObject = <MovieSeatGridListViewObject>[
  MovieSeatGridListViewObject(title: "E", type: SEAT_TYPE_TEXT),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_SELECTION),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_SELECTION),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_EMPTY),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "E", type: SEAT_TYPE_TEXT),

  MovieSeatGridListViewObject(title : "F", type : SEAT_TYPE_TEXT),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_EMPTY),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title : "F", type : SEAT_TYPE_TEXT),
];
var showGoldSeatObject = <MovieSeatGridListViewObject>[
  MovieSeatGridListViewObject(title: "G", type: SEAT_TYPE_TEXT),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_GOLD_TAKEN),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_EMPTY),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_EMPTY),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_GOLD_AVAILABLE),


  MovieSeatGridListViewObject(title: "G", type: SEAT_TYPE_TEXT),

  MovieSeatGridListViewObject(title: "H", type: SEAT_TYPE_TEXT),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_GOLD_TAKEN),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_EMPTY),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_EMPTY),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_GOLD_TAKEN),


  MovieSeatGridListViewObject(title: "H", type: SEAT_TYPE_TEXT),
];


//Ticket Section
const String TICKET_APP_BART_TITLE = "Payment";

var paymentTypeList = <PaymentTypeObject>[

  PaymentTypeObject("UPI","assets/icons/ic_upi.png"),
  PaymentTypeObject("Gift Voucher","assets/icons/ic_gift_voucher.png"),
  PaymentTypeObject("Quck Pay","assets/icons/ic_quick_pay.png"),
  PaymentTypeObject("Credit Card/Debit Card","assets/icons/ic_credit_card.png" ),
  PaymentTypeObject("Redeem Ponit","assets/icons/ic_redeem_point.png"),
  PaymentTypeObject("Mobile Wallet","assets/icons/ic_mobile_wallet.png"),
  PaymentTypeObject("Net Banking","assets/icons/ic_net_banking.png"),
];

const String CHOOSE_YOUR_PAYMENT_TYPE_TITLE_LABEL= "Choose your payment type";

const String UNLOCK_ORDER_OR_APPLY_PROMO_CODE_LABEL = "Unlock Offer or Apply Promocode";

const String YOUR_NAME_LABEL = "Your Name";
const String ENTER_YOUR_NAME_HINT_LABEL = "Enter your name";



var profileInfoList = <ProfileInfoListItemObject>[

  ProfileInfoListItemObject("Purchae History","assets/icons/ic_purchae_history.png"),
  ProfileInfoListItemObject("Offer","assets/icons/ic_offer_white.png"),
  ProfileInfoListItemObject("Gift Card","assets/icons/ic_gift_card.png"),
  ProfileInfoListItemObject("Location","assets/icons/ic_location_white.png" ),
  ProfileInfoListItemObject("Payment","assets/icons/ic_payment.png"),
  ProfileInfoListItemObject("Help and Support","assets/icons/ic_help_and_support.png"),
  ProfileInfoListItemObject("Logout","assets/icons/ic_logout.png"),
];

List<String> safetyList = ["Thermal Scanning", "Contactless Security Check",
  "Sanitization Before Every Show", "Disposable 3D glass","Contactless Food Service",
  "Package Food","Deep Cleaning of rest room"];

// List<String> facilitiesList = ["Parking","Online Food","Wheel Chair","Ticket Cancellation"];

var facilitiesItemList = <FacilitiesItemObject>[
  FacilitiesItemObject("Parking","assets/icons/ic_parking_green.png"),
  FacilitiesItemObject("Online Food","assets/icons/ic_online_food_green.png"),
  FacilitiesItemObject("Wheel Chair","assets/icons/ic_wheel_chair_green.png"),
  FacilitiesItemObject("Ticket Cancellation","assets/icons/ic_ticket_cancelation_green.png")
];


var filterObjList = <FilterObj>[
  FilterObj(['Facilities','Parking','Online Food','Wheel Chair','Ticket Cancellation']),
  FilterObj(['Format','2D','3D','3D IMAX'])
];

var filterObjListForNowShowing = <FilterObj>[
  FilterObj(['Genres','Action','Adventure','Comedy','Drama','Horror','Science Fiction','Romance','Thriller','Fantasy']),
  FilterObj(['Format','2D','3D','3D IMAX'])
];

var filterObjListForComingSoon = <FilterObj>[
  FilterObj(['Genres','Action','Adventure','Comedy','Drama','Horror','Science Fiction','Romance','Thriller','Fantasy']),
  FilterObj(['Format','2D','3D','3D IMAX']),
  FilterObj(['Month','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'])
];


List<FoodAndBeverageItemObj> foodAndBeverageItemList = [
  FoodAndBeverageItemObj("Potatoes", 1, 1000),
  FoodAndBeverageItemObj("Cocala Large", 1, 1000),

];


//cinema search
const PRICE_RANGE_TEXT = "Price Range";
const PRICE_START_RANGE = "3500Ks";
const PRICE_END_RANGE = "29500Ks";

const SHOW_TIMES_TEXT ="Show Times";
const SHOW_TIMES_START_RANGE ="8am";
const SHOW_TIMES_END_RANGE ="12pm";
