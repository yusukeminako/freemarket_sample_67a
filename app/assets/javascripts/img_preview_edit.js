// $(function(){
//   //DataTransferオブジェクトで、データを格納する箱を作る
//   var dataBox = new DataTransfer();
//   //querySelectorでfile_fieldを取得
//   var file_field = document.querySelector('input[type=file]')
//   //fileが選択された時に発火するイベント
//   $('#img-file').change(function(){
//     //選択したfileのオブジェクトをpropで取得
//     var files = $('input[type="file"]').prop('files')[0];
//     $.each(this.files, function(i, file){
//       //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
//       var fileReader = new FileReader();

//       //DataTransferオブジェクトに対して、fileを追加
//       dataBox.items.add(file)
//       //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に代入
//       file_field.files = dataBox.files

//       var num = $('.item-image').length + 1 + i
//       fileReader.readAsDataURL(file);
//       //画像が5枚になったら超えたらドロップボックスを削除する
//       if (num == 5){
//         $('#image-box__container').css('display', 'none')   
//       }
//       //読み込みが完了すると、srcにfileのURLを格納
//       fileReader.onloadend = function() {
//         var src = fileReader.result
//         var html= `<div class='item-image' data-image="${file.name}">
//                     <div class=' item-image__content'>
//                       <div class='item-image__content--icon'>
//                         <img src=${src} width="116" height="114" >
//                       </div>
//                     </div>
//                     <div class='item-image__operetion'>
//                       <div class='item-image__operetion--delete'>削除</div>
//                     </div>
//                   </div>`
//         //image_box__container要素の前にhtmlを差し込む
//         $('#image-box__container').before(html);
//       };
//       //image-box__containerのクラスを変更し、CSSでドロップボックスの大きさを変えてやる。
//       $('#image-box__container').attr('class', `item-num-${num}`)
//     });
//   });
//   //削除ボタンをクリックすると発火するイベント
//   $(document).on("click", '.item-image__operetion--delete', function(){
//     //削除を押されたプレビュー要素を取得
//     var target_image = $(this).parent().parent()
//     //削除を押されたプレビューimageのfile名を取得
//     var target_name = $(target_image).data('image')
//     //プレビューがひとつだけの場合、file_fieldをクリア
//     if(file_field.files.length==1){
//       //inputタグに入ったファイルを削除
//       $('input[type=file]').val(null)
//       dataBox.clearData();
//       console.log(dataBox)
//     }else{
//       //プレビューが複数の場合
//       $.each(file_field.files, function(i,input){
//         //削除を押された要素と一致した時、index番号に基づいてdataBoxに格納された要素を削除する
//         if(input.name==target_name){
//           dataBox.items.remove(i) 
//         }
//       })
//       //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に再度代入
//       file_field.files = dataBox.files
//     }
//     //プレビューを削除
//     target_image.remove()
//     //image-box__containerクラスをもつdivタグのクラスを削除のたびに変更
//     var num = $('.item-image').length
//     $('#image-box__container').show()
//     $('#image-box__container').attr('class', `item-num-${num}`)
//   })
// });

$(document).ready(function(){
  // 画像用のinputを生成する関数
  const buildFileField2 = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group4">
                    <input class="js-file2" type="file"
                    name="product[images_attributes][${num}][src]"
                    id="product_images_attributes_${num}_src"><br>
                  </div>`;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg2 = (index, url)=> {
    const html = `<li class="adsaf">
                    <img data-index="${index}" src="${url}" class="edit_img_${index}">
                    <div data-index="${index}" class="js-remove" name="[edit_remove][${index}]">削除</div>
                  </li>
                  <input data-index="${index}" value="0" class="delete_img_${index}" type="hidden" name="product[images_attributes][${index}][_destroy]" id="product_images_attributes_${index}__destroy">`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex2 = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex2 = $('.js-file_group3:last').data('index');
  fileIndex2.splice(0, lastIndex2);

  $('.hidden-destroy').hide();

  $('#image-box2').on('change', '.js-file2', function(e) {
    const targetIndex2 = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img2 = $(`img[data-index="${targetIndex2}"]`)[0]) {
      img2.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews2').append(buildImg2(targetIndex2, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box2').append(buildFileField2(fileIndex2[0]));
      fileIndex2.shift();
      // 末尾の数に1足した数を追加する
      fileIndex2.push(fileIndex2[fileIndex2.length - 1] + 1);
    }
    var count = $('.adsaf').length;
    var abcde = $('#dropArea2')
    if (count == 5) {
      abcde.fadeOut();
    }
  });

  $('.js-file_group3:first').on('click', function() {
    $('.js-file2:last').trigger('click');
    return false;
  });

  

  //画像削除した時の処理//
  $('#image-box2').on('click', '.js-remove', function() {
    var number = Number($(this).data('index'));
    //削除ボタンを押すと該当の画像が消える
    const edit_img_btn = $(`.edit_img_${number}`);
    if(edit_img_btn) edit_img_btn.remove();
    //削除ボタンを押すと削除ボタンの表記が消える
    $(this).parent().remove();
    //削除ボタンを押すと該当のinputfileが消える
    const file_field_btn = $(`#product_images_attributes_${number}_src`);
    if(file_field_btn) file_field_btn.remove(); // アップロードボタンが存在すれば削除
    //_destoryのvalue0を1に変える
    $(`.delete_img_${number}`).val('1');
    
    var count = $('.adsaf').length;
    var abcde = $('#dropArea2')
    if (count == 4) {
      abcde.show();
    }
    
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file2').length == 0) $('#image-box2').append(buildFileField2(fileIndex[0]));
  });
});

$(document).ready(function() {
  var count = $('.adsaf').length;
  var abcde = $('#dropArea2')
  if (count == 5) {
    abcde.hide();
  }
  if (count < 5) {
    abcde.show();
  }
});