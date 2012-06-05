describe Hash do

  before (:each) do
    let(:hash) { Hash.{:hello => 'World'} }
  end
  it 'should return a blank instance' do
    Hash.new.should == {}
  end

  it 'should have the correct value' do
    hash[:hello].should == 'World'
  end


end