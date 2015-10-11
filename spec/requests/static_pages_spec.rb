require 'rails_helper'

describe "Static pages" do
  subject { page }

  describe "Home page" do
  end

  describe "help page" do
  end

  describe "contact page" do
    before { visit contact_path }
    it { should have_contet('1234') }
    it { should have_title('Учебный центр ПИК | Contact') }
    it { should_not have_title('| Home') }
  end

end
