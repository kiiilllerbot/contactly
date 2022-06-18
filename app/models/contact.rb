class Contact < ApplicationRecord
    belongs_to :group

    validates_presence_of :name
    validates_presence_of :email
    validates_presence_of :company
    validates_presence_of :phone
    validates_presence_of :address
end
