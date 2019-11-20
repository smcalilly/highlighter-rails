class Highlight < ApplicationRecord
  validates :text, :url, presence: true

  belongs_to :user

  # TODO -- add regex on url
  ## strip it of https www
  # def test_domain_format
  #   # see if the domain matches the shopify admin api format
  #   # and strip potential https://www & /extraneous/admin/path-stuff

  #   sanitized_handle = self.handle.match /[^\s\:\/.]+\.myshopify\.com/
  #   self.handle = sanitized_handle[0]
  # rescue
  #   errors.add(:handle, "isn't a valid Shopify domain.")
  #   throw :abort
  # end
end
