require "spec_helper"

describe PasswordMailer do
  describe "reset_email" do
    let(:mail) { PasswordMailer.reset_email }

    it "renders the headers" do
      mail.subject.should eq("Reset email")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
