class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_blog.subject
  #
  def sendmail_blog(blog)
    @blog = blog

    mail to: "javajava552000@yahoo.co.jp",
         subject: '【Achieve】ブログが投稿されました'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_contact.subject
  #
  def sendmail_contact(contact)
    @contact = contact

    mail to: @contact.email,
         subject: '【Achieve】お問い合わせがありがとうございます。'
  end
end
