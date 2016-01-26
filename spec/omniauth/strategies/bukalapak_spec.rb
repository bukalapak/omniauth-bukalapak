require 'spec_helper'

describe OmniAuth::Strategies::Bukalapak do
  let(:access_token)    { double('AccessToken', options: {}) }
  let(:parsed_response) { double('ParsedResponse') }
  let(:response)        { double('Response', parsed: parsed_response) }

  subject do
    OmniAuth::Strategies::Bukalapak.new({})
  end

  before(:each) do
    allow(subject).to receive(:access_token).and_return(access_token)
  end

  context "client options" do
    it { expect(subject.options.client_options.site).to eq('https://api.bukalapak.com') }
    it { expect(subject.options.client_options.authorize_url).to eq('https://www.bukalapak.com/oauth/authorize') }
    it { expect(subject.options.client_options.token_url).to eq('https://www.bukalapak.com/oauth/access_token') }
  end

  describe '#raw_info' do
    before { expect(access_token).to receive(:get).with('me').and_return(response) }

    it { expect(subject.raw_info).to eq(parsed_response) }
  end
end
