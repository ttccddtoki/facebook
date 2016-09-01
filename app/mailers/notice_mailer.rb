class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_topix.subject
  #
  def sendmail_topix(topix)
    @topix = topix

    mail to: "ttccdd24@gmail.com",
         subject: 'facebookに投稿されました'
  end
end
