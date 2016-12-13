class Friendship < ApplicationRecord
	belongs_to :user
	belongs_to :friend, class_name: "User"

	after_create :create_inverse, unless: :has_inverse?
  after_update :update_inverse, unless: :has_inverse_accepted?
  after_destroy :destroy_inverses, if: :has_inverse?

  def create_inverse
    self.class.create({ friend_id: user_id, user_id: friend_id, status: 'pending'})
  end

  def update_inverse
    self.inverses.update(status: 'accepted')
  end

  def destroy_inverses
    inverses.destroy_all
  end

  def has_inverse?
    self.class.exists?(inverse_match_options)
  end

  def has_inverse_accepted?
    self.class.exists?({ friend_id: user_id, user_id: friend_id, status: 'accepted' })
  end

  def inverses
    self.class.where(inverse_match_options)
  end

  def inverse_match_options
    { friend_id: user_id, user_id: friend_id }
  end
end