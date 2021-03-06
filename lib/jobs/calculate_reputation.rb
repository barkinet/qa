module Jobs
  class CalculateReputation
    include Sidekiq::Worker

    def perform(user_id)
      User.find(user_id).calculate_reputation!
    end
  end
end
