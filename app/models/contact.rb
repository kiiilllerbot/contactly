class Contact < ApplicationRecord
    has_one_attached :avatar
    belongs_to :group

    paginates_per 10

    validates_presence_of :name
    validates_presence_of :email
    validates_presence_of :company
    validates_presence_of :phone
    validates_presence_of :address

    def gravatar
        hash = Digest::MD5.hexdigest(email.downcase)
        "https://www.gravatar.com/avatar/#{hash}"
    end
end
