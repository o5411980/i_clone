class PostMailer < ApplicationMailer
  def post_mailer(post)
    @post = post
    mail to: "test01@example.com", subject: "Picture投稿の受け付け確認メール"
  end
end
