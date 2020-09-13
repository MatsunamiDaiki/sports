$(function() {
  let search_post = $ (".list");

  function appendPost(post){
    if(post.user_sign_in && post.user_sign_in.id == post.user_id){
      let html = `<div class="listbox">
      <div class="listboxarea">
      <div class="listinfo">
      <div class="select">
      <div class="listshow">
      <a href="/posts/${post.id}">参加する！</a>
      </div>
      <div class="listedit">
      <a href="/posts/${post.id}/edit">編集</a>
      </div>
      <div class="listdelete">
      <a rel="nofollow" data-method="delete" href="/posts/9">${post.id}</a>
      </div>
      </div>
      <div class="room">
      <div class="roomtitle">
      ${post.title}
      </div>
      <div class="roomgnere">
      ${post.genre_id}
      </div>
      <div class="roomexplain">
      ${post.text}
      </div>
      <div class="roomname">
      ${post.nickname}
      </div>
      </div>
      </div>
      </div>
      </div>`
      search_post.append(html);

    } else{
      let html = `<div class="listbox">
      <div class="listboxarea">
      <div class="listinfo">
      <div class="select">
      <div class="listshow">
      <a href="/posts/${post.id}">参加する！</a>
      </div>
      </div>
      <div class="room">
      <div class="roomtitle">
      ${post.title}
      </div>
      <div class="roomgnere">
      ${post.genre_id}
      </div>
      <div class="roomexplain">
      ${post.text}
      </div>
      <div class="roomname">
      ${post.nickname}
      </div>
      </div>
      </div>
      </div>
      </div>`
      search_post.append(html);
    }
  }

  function appendErrMsgToHTML(msg) {
    let html = `<div class='name'>${ msg }</div>`
    search_post.append(html);
  }

  $(".search-input").on("keyup", function() {
    let input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/posts/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(posts) {
      search_post.empty();
      if (posts.length !== 0) {
        posts.forEach(function(post){
          appendPost(post);
        });
      }
      else {
        appendErrMsgToHTML("一致する投稿がありません");
      }
    })  
  });
});