class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :must_include_bait_in_title


    CLICKBAIT_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
      ]
      
      bait = ["Won't Believe", "Secret", "Top", "Guess"]
      # def must_include_bait_in_title
    #     byebug
    #     if bait.none? { |thing| thing.match title}
    #         errors.add(:title, "sorry your title sucked")
    #     end
    # end


    # below this is from the solution - but I dont' know why this works but a regular array doesn't
      def must_include_bait_in_title
        if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
            byebug
            errors.add(:title, "must be clickbait")
          end
        end
end
