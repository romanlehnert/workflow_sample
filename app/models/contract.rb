class Contract < ActiveRecord::Base

  include Workflowable
  include Emailable

  belongs_to :user

  def possible_email_recipients
    {
      customer: :customer_email_recipient,
      dealer: :dealer_email
    }
  end

  def customer_email_recipient
    customer.email
  end

  def dealer_email
    dealer.email
  end

end
