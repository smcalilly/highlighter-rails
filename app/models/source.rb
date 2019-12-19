class Source < ApplicationRecord
    validates :location, presence: true
    validates_uniqueness_of :location, scope: :user_id
    has_many :highlights
    accepts_nested_attributes_for :highlights
end
