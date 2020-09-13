json.array! @posts do |post|
  json.id post.id
  json.title post.title
  json.text post.text
  json.genre_id post.genre_id
  json.user_id post.user_id
  json.nickname post.user.nickname
  json.user_sign_in current_user
end