module Emailable

  extend ActiveSupport::Concern

  included do

    def email_recipient_for(identifier)
      self.send(self.class.possible_recipients[identifier.to_sym])
    end

  end

  module ClassMethods

  end

end
