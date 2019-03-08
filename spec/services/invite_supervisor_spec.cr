require "../../src/services/invite_supervisor"
require "spec"

describe InviteSupervisor do
  describe "#push" do
    it "stores correct invite" do
      from = "08a6fb"
      to = "888888"
      InviteSupervisor.push(from: from, to: to)
      InviteSupervisor.have_correct_invite_from(from: from, to: to).should be_truthy
    end
  end
end
