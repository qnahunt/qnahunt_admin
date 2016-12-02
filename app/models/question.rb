class Question < ApplicationRecord
  belongs_to :user
  belongs_to :sub_category
  has_many :answers
  has_many :tags
  has_many :question_tags
  attr_accessor :tag
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
end
