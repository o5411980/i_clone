class PostMailer < ApplicationMailer
  def post_mailer(post)
    @post = post
    mail to: "#{User.find_by(id: post.user_id).email}", subject: "Picture投稿の受け付け確認メール"
  end
end
