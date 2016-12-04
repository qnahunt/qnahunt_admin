class Question < ApplicationRecord
  belongs_to :user
  belongs_to :sub_category
  has_many :answers
  has_many :tags
  has_many :question_tags
  attr_accessor :tag
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
  validates :title, :description, :tag, :user, :sub_category, :is_open, presence: true
  validates :title, uniqueness: true
end
