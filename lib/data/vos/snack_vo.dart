import 'package:json_annotation/json_annotation.dart';

part 'snack_vo.g.dart';

@JsonSerializable()
class SnackVO{

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name")
  String? name;


  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "price")
  int? price;

  @JsonKey(name: "category_id")
  int? category_id;

  @JsonKey(name: "image")
  String? image;


  @JsonKey(name: "total_price")
  int? total_price;

  @JsonKey(name: "quantity")
  int? quantity=0;

  SnackVO(this.id, this.name, this.description, this.price, this.category_id,
      this.image, this.total_price, this.quantity); // int? qty = 0;



  factory SnackVO.fromJson(Map<String,dynamic> json) =>_$SnackVOFromJson(json);
  Map<String,dynamic> toJson()=> _$SnackVOToJson(this);


  int calculateSnackItemAmt(){
    var snackQty = quantity??0;
    var snackPrice = price??0;
    var snackTotalPrice =0;
    if(snackQty.toInt() >=1 )
      {
        snackTotalPrice = (snackQty.toInt() * snackPrice.toInt()).toInt();
      }

    return snackTotalPrice;
  }

}










