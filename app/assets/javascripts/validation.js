// 商品の出品・編集
$(function(){
	$('input:submit[id="edit_submit"]').click(function(){
		if(!items_input_check()){
			return false;
		}
 });
});
// 入力内容チェックのための関数(商品)
function items_input_check(){
	var result = true;
 // 入力エラー文をリセット
 $("#img_error").empty();
 $("#item_name_error").empty();
 $("#item_detail_error").empty();
 $("#category_error").empty();
 $("#status_error").empty();
 $("#burden_select_error").empty();
 $("#mail_way_error").empty();
 $("#item_prefecture_error").empty();
 $("#arrival_date_error").empty();
 $("#price_error").empty();
	// 入力内容セット
 var item_name = $("#item_name").val();
 var item_detail = $("#item_detail").val();
 var parent_category = $("#parent_category").val();
 var item_price = $("#item_price").val();
 var img = $("#img-file").val();
 console.log(img)
 //編集画面に既に画像があればimgの中身をセット
 var pre_img = document.getElementById('pre_img');
 if(!pre_img == ""){
  img = "1"
 }
 // 入力内容チェック
 //画像
	if(img == ""){
  $("#img_error").html("　*出品画像は必須です。");
		result = false;
 }
	// 商品名
	if(item_name == ""){
		$("#item_name_error").html("　*商品名は必須です。");
		result = false;
 }
 //商品の説明
 if(item_detail == ""){
		$("#item_detail_error").html("　*商品の説明は必須です。");
		result = false;
	}
 //カテゴリー
 if(parent_category == "---"){
		$("#category_error").html("　*カテゴリーを選択してください。");
		result = false;
 }else{  //子カテゴリーのチェック
  var child_category = $("#child_category").val();
  if(child_category == "---"){
   $("#category_error").html("　*二番目のカテゴリーを選択してください。");
   result = false;
  }else{  //孫カテゴリーのチェック
   var grandchild_category = $("#grandchild_category").val()
   if(grandchild_category == "---" || grandchild_category == ""){
    $("#category_error").html("　*三番目のカテゴリーを選択してください。");
    result = false;
   }
  }
 }
 if(item_price == "" ){
		$("#price_error").html("　*価格を入力してください。");
		result = false;
 }else if(!item_price.match(/[0-9]/)){
		$("#price_error").html("　*半角数字で入力してください。");
		result = false;
	}else if(item_price <300){
		$("#price_error").html("　*300円以上で入力してください。");
		result = false;
	}else if(item_price > 9999999){
		$("#price_error").html("　*1000万円以下で入力してください。");
		result = false;
	}
	return result;
}