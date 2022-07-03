class Group < ApplicationRecord
    has_many :contacts
    belongs_to :user

    validates_presence_of :name
    validates_uniqueness_of :name
end
