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
    it { expect(subject.options.client_options.authorize_url).to eq('https://accounts.bukalapak.com/oauth/authorize') }
    it { expect(subject.options.client_options.token_url).to eq('https://accounts.bukalapak.com/oauth/token') }
  end

  context "#id" do
    before { expect(subject).to receive(:raw_info).and_return({ 'id' => 1234567 }) }

    it { expect(subject.uid).to eq('1234567') }
  end

  context "#info" do
    let(:basic_info) do
      {
        'username' => 'garuda',
        'name'     => 'Garuda Pancasila',
        'avatar'   => { 'url' => 'https://s1.bukalapak.com/image/garuda.png' }
      }
    end

    let(:want_info) do
      {
        'username' => 'garuda',
        'name'     => 'Garuda Pancasila',
        'image'    => 'https://s1.bukalapak.com/image/garuda.png'
      }
    end

    let(:want_info_with_email) do
      want_info.merge('email' => 'user@example.com')
    end

    context "without email" do
      let(:info) { basic_info }

      before { expect(subject).to receive(:raw_info).and_return(info).exactly(4).times }

      it { expect(subject.info).to eq(want_info) }
    end

    context "with email" do
      let(:info) { basic_info.merge('email' => 'user@example.com') }

      before { expect(subject).to receive(:raw_info).and_return(info).exactly(5).times }

      it { expect(subject.info).to eq(want_info_with_email) }
    end
  end

  context '#extra' do
    before { expect(access_token).to receive(:get).with('me').and_return(response) }

    it { expect(subject.extra).to eq(raw_info: parsed_response) }
  end

  describe '#raw_info' do
    before { expect(access_token).to receive(:get).with('me').and_return(response) }

    it { expect(subject.raw_info).to eq(parsed_response) }
  end

  describe '#email' do
    context "email present" do
      before { expect(subject).to receive(:raw_info).and_return({ 'email' => 'user@example.com' }) }

      it { expect(subject.email).to eq('user@example.com') }
    end

    context "email is not present" do
      before { expect(subject).to receive(:raw_info).and_return({}) }

      it { expect(subject.email).to be_nil }
    end
  end
end
