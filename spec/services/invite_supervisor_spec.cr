require "../../src/services/invite_supervisor"
require "spec"

describe InviteSupervisor do
  it "stores correct invite and returns it" do
    from = "08a6fb"
    to = "888888"
    InviteSupervisor.push(from: from, to: to)
    InviteSupervisor.have_correct_invite_from(from: from, to: to).should be_a(InviteSupervisor::Invite)
  end
end
