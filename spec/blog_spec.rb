require 'spec_helper'

describe 'Blog' do

  
  it 'should load the index' do
    get '/'
    last_response.should.be.ok
  end
end

