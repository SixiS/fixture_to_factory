require 'spec_helper'
describe FixtureToFactory do
  describe '.execute' do
    let(:execute){FixtureToFactory.execute(prefix: '../')}
    before(:each) do
      FileUtils.rm_rf('./spec/factories/')
    end

    it{execute; expect(Dir.exists?('./spec/factories/generated_burgers.rb'))}
    it{execute; expect(Dir.exists?('./spec/factories/generated_milkshakes.rb'))}

  end
end
