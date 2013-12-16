# coding: utf-8
class PaymentMailer < ActionMailer::Base

  def upc_added contract, payment
    @contract = contract
    mail(from: "ruby.ci.ukrpack.net@crimeainfo.com", to: "bgbilling@crimeainfo.com", subject: "Поступила оплата по UPC на договор #{contract.title}")
  end
end