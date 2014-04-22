class User < ActiveRecord::Base
  has_many :contracts
end
