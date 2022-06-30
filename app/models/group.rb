class Group < ApplicationRecord
    has_many :contacts

    validates_presence_of :name
    validates_uniqueness_of :name
end
