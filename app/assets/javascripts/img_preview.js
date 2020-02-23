// $(document).ready(function(){
//   $(function(){

//     //プレビューのhtmlを定義
//     function buildHTML(count) {
//       var html = `<div class="preview-box" id="preview-box__${count}">
//                     <div class="upper-box">
//                       <img src="" alt="preview">
//                     </div>
//                     <div class="lower-box">
//                       <div class="update-box">
//                         <label class="edit_btn">編集</label>
//                       </div>
//                       <div class="delete-box" id="delete_btn_${count}">
//                         <span>削除</span>
//                       </div>
//                     </div>
//                   </div>`
//       return html;
//     }

//     // ラベルのwidth操作
//     function setLabel() {
//       //プレビューボックスのwidthを取得し、maxから引くことでラベルのwidthを決定
//       var prevContent = $('.label-content').prev();
//       labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
//       $('.label-content').css('width', labelWidth);
//     }

//     // プレビューの追加
//     $(document).on('change', '.hidden-field', function() {
//       setLabel();
//       //hidden-fieldのidの数値のみ取得
//       var id = $(this).attr('id').replace(/[^0-9]/g, '');
//       //labelボックスのidとforを更新
//       $('.label-box').attr({id: `label-box--${id}`,for: `product_images_attributes_${id}_image`});
//       //選択したfileのオブジェクトを取得
//       var file = this.files[0];
//       var reader = new FileReader();
//       //readAsDataURLで指定したFileオブジェクトを読み込む
//       reader.readAsDataURL(file);
//       //読み込み時に発火するイベント
//       reader.onload = function() {
//         var image = this.result;
//         //プレビューが元々なかった場合はhtmlを追加
//         if ($(`#preview-box__${id}`).length == 0) {
//           var count = $('.preview-box').length;
//           var html = buildHTML(id);
//           //ラベルの直前のプレビュー群にプレビューを追加
//           var prevContent = $('.label-content').prev();
//           $(prevContent).append(html);
//         }
//         //イメージを追加
//         $(`#preview-box__${id} img`).attr('src', `${image}`);
//         var count = $('.preview-box').length;
//         //プレビューが5個あったらラベルを隠す 
//         if (count == 5) { 
//           $('.label-content').hide();
//         }

//         //ラベルのwidth操作
//         setLabel();
//         //ラベルのidとforの値を変更
//         if(count < 5){
//           //プレビューの数でラベルのオプションを更新する
//           $('.label-box').attr({id: `label-box--${count}`,for: `product_images_attributes_${count}_src`});
//         }
//       }
//     });

//     // 画像の削除
//     $(document).on('click', '.delete-box', function() {
//       var count = $('.preview-box').length;
//       setLabel(count);
//       //item_images_attributes_${id}_image から${id}に入った数字のみを抽出
//       var id = $(this).attr('id').replace(/[^0-9]/g, '');
//       //取得したidに該当するプレビューを削除
//       $(`#preview-box__${id}`).remove();
//       //フォームの中身を削除 
//       $(`#product_images_attributes_${id}_src`).val("");

//       //削除時のラベル操作
//       var count = $('.preview-box').length;
//       //5個めが消されたらラベルを表示
//       if (count == 4) {
//         $('.label-content').show();
//       }
//       setLabel(count);

//       if(id < 5){
//         //削除された際に、空っぽになったfile_fieldをもう一度入力可能にする
//         $('.label-box').attr({id: `label-box--${id}`,for: `product_images_attributes_${id}_src`});
//       }
//     });
//   });
// })

$(document).ready(function(){
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group2">
                    <input class="js-file" type="file"
                    name="product[images_attributes][${num}][src]"
                    id="product_images_attributes_${num}_src"><br>
                  </div>`;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<div class='preview-files'>
                    <div class='preview-file'>
                      <img data-index="${index}" src="${url}" class="preview-file-img">
                    </div>
                    <div data-index="${index}" class="js-remove">削除</div>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
    var count = $('.preview-file-img').length;
    var abcde = $('#dropArea')
    if (count == 5) {
      abcde.fadeOut();
    }
  });

  $('.js-file_group:first').on('click', function() {
    $('.js-file:last').trigger('click');
    return false;
  });

  

  //画像削除した時の処理//
  $('#image-box').on('click', '.js-remove', function() {

    $(this).parent().remove();

    var number = Number($(this).data('index'));
    
    const file_field_btn = $(`#product_images_attributes_${number}_src`);
    if(file_field_btn) file_field_btn.remove(); // アップロードボタンが存在すれば削除

    var count = $('.preview-file-img').length;
    var abcde = $('#dropArea')
    if (count == 4) {
      abcde.show();
    }
    
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});

