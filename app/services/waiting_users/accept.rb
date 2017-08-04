module WaitingUsers
  class Accept
    def initialize(waiting_user)
      self.waiting_user = waiting_user
    end

    def call
      WaitingUser.transaction do
        user = create_user
        waiting_user.destroy
        UserMailer.user_accepted(user).deliver_now
      end
    end

    private

    attr_accessor :waiting_user

    def create_user
      User.create!(
        first_name: waiting_user.first_name,
        last_name: waiting_user.last_name,
        email: waiting_user.email,
        phone: waiting_user.phone,
        fellowship: waiting_user.fellowship,
        city: waiting_user.city
      )
    end
  end
end