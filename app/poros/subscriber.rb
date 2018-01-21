# frozen_string_literal: true

class Subscriber
  attr_reader :email

  def initialize(email:)
    @email = email
  end

  def call
    client.post(
      "lists/#{mailing_list}/members",
      address: email,
      subscribed: "yes",
      upsert: "yes",
    )

    client.send_message(
      domain,
      from: "no-reply@lifemeetscristina.com",
      to: email,
      subject: "Confirmation Received!",
      html: "<html><body>Hello,<br><br>You've successfully subscribed to LifeMeetsCristina!
      <br><br>Thank you!</body></html>",
    )
  end

  private

  def client
    Mailgun::Client.new
  end

  def mailing_list
    "list@mg.lifemeetscristina.com"
  end

  def domain
    "mg.lifemeetscristina.com"
  end

  def secret
    SecureRandom.uuid
  end
end
