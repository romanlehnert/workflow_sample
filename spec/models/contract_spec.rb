require 'spec_helper'

describe Contract do


  describe "associations" do
    it { should belong_to(:user) }
  end

  it_behaves_like "workflowable" 

end
