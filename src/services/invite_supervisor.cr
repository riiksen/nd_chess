module InviteSupervisor
  struct Invite
    property from, to, time

    def initialize(@from : , @to : String, time : Time)

    end
  end

  @@pending_invites = [] of NamedTuple(from: String, to: String, time: Time)
  @@pending_invites = [] of Invite

  def self.push(from, to, time)
    @@pending_invites << {from: from, to: to, time: time}
  end

  def self.have_correct_invite_from(from, to)
    @@pending_invites.find do |elm|
      elm.from == from && 
        elm.to == to && 
        elm.time - Time.now > 5.minutes
    end
  end
end
