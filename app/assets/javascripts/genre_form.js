//セレクトボックスのオプションを設定
$(function() {
  function appendOption(genre) {
    let html = `<option value='${genre.id}' data-genre='${genre.id}'>${genre.name}</option>`;
    return html;
  }
  // 子ジャンルのセレクトボックス
  function appendChidrenBox(insertHTML) {
    let childrenSelectHtml = '';
    childrenSelectHtml = `
      <div id='children-wrapper'>
        <select id='children-genre' class='form-control' name='[children_id]'>
          <option value='---' data-genre='---'>---</option>
          ${insertHTML}
        </select>
        <i class='fas fa-chevron-down'></i>
      </div>
    `;
    //子カテゴリーのセレクトボックスを表示
    $('.genre-form').append(childrenSelectHtml);
  }
  //孫ジャンルのセレクトボックスを作成
  function appendGrandchidrenBox(insertHTML) {
    let grandchildrenSelectHtml = '';
    grandchildrenSelectHtml = `
      <div id='grandchildren-wrapper'>
        <select id='grandchildren-genre' class='form-control' name='[grandchildren_id]'>
          <option value='---' data-genre='---'>---</option>
          ${insertHTML}
        </select>
        <i class='fas fa-chevron-down'></i>
      </div>
    `;
    $('.genre-form').append(grandchildrenSelectHtml);
  }
  //親カテゴリーが選択された時
  $('#parent-genre').on('change', function() {
    let parentId = document.getElementById('parent-genre').value;
    //親カテゴリーが初期値でない場合
    if (parentId != '---') {
      $.ajax({
        url: '/get_genre/children',
        type: 'GET',
        data: {
          parent_id: parentId,
        },
        dataType: 'json',
      })
        .done(function(children) {
          $('#children-wrapper').remove();
          $('#grandchildren-wrapper').remove();
          let insertHTML = '';
          children.forEach(function(children) {
            insertHTML += appendOption(children);
          });
          appendChidrenBox(insertHTML);
        })
        .fail(function() {
          alert('ジャンル取得に失敗しました');
        });
    //親カテゴリーが初期値の場合は、子カテゴリー以下を削除
    } else {
      $('#children-wrapper').remove();
      $('#grandchildren-wrapper').remove();
    }
  });
  //子カテゴリーが選択された時
  $('.genre-form').on('change', '#children-genre', function() {
    let childrenId = $('#children-genre option:selected').data('genre');
    if (childrenId != '---') {
      $.ajax({
        url: '/get_genre/grandchildren',
        type: 'GET',
        data: {
          children_id: childrenId,
        },
        dataType: 'json',
      })
        .done(function(grandchildren) {
          if (grandchildren.length != 0) {
            $('#grandchildren-wrapper').remove();
            let insertHTML = '';
            grandchildren.forEach(function(grandchildren) {
              insertHTML += appendOption(grandchildren);
            });
            appendGrandchidrenBox(insertHTML);
          }
        })
        .fail(function() {
          alert('ジャンル取得に失敗しました');
        });
    } else {
      $('#grandchildren-wrapper').remove();
    }
  });
});