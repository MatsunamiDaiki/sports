$(function() {
  $(".search-input").on("keyup", function() {
    let input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/posts/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(posts) {
      $(".contents.row").empty();
      if (posts.length !== 0) {
        posts.forEach(function(post){
          appendTweet(post);
        });
      }
      else {
        appendErrMsgToHTML("一致するツイートがありません");
      }
    })  
  });
});