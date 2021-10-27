class NotifierMailer < ApplicationMailer
  def email_friend(article, sender_name, receiver_email)
    @article = article
    @sender_name = sender_name

    if @article.cover_image.present?
      attachments[@article.cover_image.filename.to_s] = @article.cover_image.download
    end

    mail to: receiver_email, subject: 'Interesting Article'
  end
end
