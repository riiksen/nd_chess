module InviteSupervisor
  struct Invite
    property from, to, time

    def initialize(@from : String, @to : String, @time : Time); end
  end

  @@pending_invites = [] of Invite

  def self.push(from, to)
    @@pending_invites << Invite.new(from, to, Time.now)
  end

  def self.have_correct_invite_from(from, to)
    @@pending_invites.find do |elm|
      elm.from == from && elm.to == to && Time.now - elm.time <= 5.minutes
    end
  end
end
