class Question < ApplicationRecord
  belongs_to :user
  belongs_to :sub_category
  has_many :answers
  has_many :tags
  has_many :question_tags
  accepts_nested_attributes_for :answers, :allow_destroy => true
  accepts_nested_attributes_for :question_tags, :allow_destroy => true
end
