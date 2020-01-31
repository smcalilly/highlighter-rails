class Source < ApplicationRecord
    validates :location, presence: true
    validates_uniqueness_of :location, scope: :user_id
    belongs_to :user
    has_many :highlights, dependent: :destroy
    accepts_nested_attributes_for :highlights
end
