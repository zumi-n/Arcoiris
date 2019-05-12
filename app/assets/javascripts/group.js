$(function(){

  var search_list = $("#user-search-result");

  function appendUser(user){
    var html = `<div class="group-member clearfix">
                  <p class="group-member__name">${user.name}</p>
                  <a class="user-search-add group-member__btn group-member__btn--add" data-user-id=${user.id} data-user-name=${user.name}>追加</a>
                </div>`
    search_list.append(html)
  }
  


  function appendErrMsgToHTML(msg){
    var html = `<div class="group-member clearfix">
                  <p class="group-member__name">
                  ${msg}
                  </p>
                </div>`
    search_list.append(html)
  }



  var memberlist = $('#chat-group-users')

  function appendUserToMemberList(id, name){
    var html = `<div class='group-member clearfix js-member'>
    <input name='group[user_ids][]' type='hidden' value=${id}>
    <p class='group-member __name'>${name}</p>
    <a class='user-search-remove group-member__btn group-member__btn--remove js-remove-btn'>削除</a>
    </div>`
    memberlist.append(html);
  }


  $(".groups-new__form__input").on('keyup', function(){
    var input = $(".groups-new__form__input").val()

    $.ajax({
      type: 'GET',
      url: '/groups/new',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(users){
      $(".group-member.clearfix").empty();
      if (users.length !== 0) {
        users.forEach(function(user){
          appendUser(user);
        });
      }
      else {
        appendErrMsgToHTML("一致するメンバーがいません");
      }
    })
    .fail(function(){
      alert("検索に失敗しました");
    })
  });
  $(document).on('click', '.user-search-add', function(){
    $(this).parent()[0].remove();
    var user_id = $(this).data("user-id");
    var user_name = $(this).data("user-name");
    appendUserToMemberList(user_id, user_name);
  });
  $(document).on('click', '.user-search-remove', function(){
    $(this).parent().remove();
  });
});