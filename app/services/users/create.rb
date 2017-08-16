module Users
  class Create
    def initialize(user_params, token)
      self.user_params = user_params
      self.token = token
    end

    def call
      if user.save
        #UserMailer.user_registered(user).deliver_now
      end
    end

    def donate
      Donate.find_by(token: token)
    end

    def user
      @user ||= User.new(user_params.merge(donate_id: donate.try(:id)))
    end

    private

    attr_accessor :user_params, :token
  end
end