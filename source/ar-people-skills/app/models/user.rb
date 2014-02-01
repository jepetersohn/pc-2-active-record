class User < ActiveRecord::Base
  has_many :ratings
  has_many :skills, through: :ratings

  def proficiency_for(skill)
    Rating.where(user_id: self.id, skill_id: skill.id).first.rating
  end

  def set_proficiency_for(skill, rating)
    rating_obj = Rating.where(user_id: self.id, skill_id: skill.id).first.update_attributes(rating: rating)
  end
end
