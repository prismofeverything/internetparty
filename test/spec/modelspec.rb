ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")

describe Citizen do 
  before(:all) do 
    @yellow = Citizen.create(:login => 'yellow', :name => 'Yellow Vortex', :email => 'yellow@yellow.com', :password => 'yellow', :password_confirmation => 'yellow')
    @green = Citizen.create(:login => 'green', :name => 'Green Vortex', :email => 'green@green.com', :password => 'green', :password_confirmation => 'green')
    @purple = Citizen.create(:login => 'purple', :name => 'Purple Vortex', :email => 'purple@purple.com', :password => 'purple', :password_confirmation => 'purple')

    @citizens = [@yellow, @green, @purple]

    @rome = Constituency.create(:name => 'Rome')
    @partha = Constituency.create(:name => 'Partha')

    @constituencies = [@rome, @partha]

    @work = Issue.create(:name => 'Work', :body => 'work is hard')
    @love = Issue.create(:name => 'Love', :body => 'love is painful')

    @issues = [@work, @love]

    @memberships = [[@yellow, @rome], [@green, @rome], [@green, @partha], [@purple, @partha]].map do |pair|
      citizen, constituency = pair
      Membership.create(:citizen_id => citizen.id, :constituency_id => constituency.id)
    end
  end

  it 'should work' do 
    @yellow.login.should == 'yellow'
    @green.constituencies.size.should == 2
  end

  after(:all) do 
    @citizens.map(&:destroy)
    @constituencies.map(&:destroy)
    @issues.map(&:destroy)
    @memberships.map(&:destroy)
  end
end
