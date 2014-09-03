require 'badge_definitions/base'

module QA
  module BadgeDefinition
    class GreatQuestion < Base
      @check_on = :question_vote
      @name = :great_question

      def check(question)
        question.vote_count >= 100
      end
    end
  end
end
