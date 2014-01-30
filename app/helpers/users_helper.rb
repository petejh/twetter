module UsersHelper
  def link_mentions(content)
    content.gsub(/@\S*/) do |mention|
      username = mention.gsub(/@/,'')
      link_to mention, user_path(username)
    end
  end
end
