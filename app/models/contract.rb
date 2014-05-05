class Contract < ActiveRecord::Base

  include Workflowable

  belongs_to :user
end
