# coding: utf-8
class PaymentMailer < ActionMailer::Base

  def upc_added payment, to_email
    @payment = payment
    mail(from: "ruby.ci.ukrpack.net@crimeainfo.com", to: to_email, subject: "Поступила оплата по UPC")
  end
end