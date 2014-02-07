module UsersHelper
  def link_mentions(content)
    content.gsub(/@\S*/) do |mention|
      username = mention.delete "@"
      if User.exists?(username: username)
        link_to mention, user_path(username)
      else
        html_escape_once(mention)
      end
    end
  end
end
