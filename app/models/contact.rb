class Contact < ApplicationRecord
    has_one_attached :avatar
    belongs_to :group

    paginates_per 10

    validates_presence_of :name
    validates_presence_of :email
    validates_presence_of :company
    validates_presence_of :phone
    validates_presence_of :address

    scope :search, -> (term) do
        where('name ILIKE :term or email ILIKE :term OR company ILIKE :term',term: "%#{term}%")if term.present?
    end

    # def self.search(term)
    #     if term && !term.empty?
    #         where('name ILIKE ?', "%#{term}%")
    #     else
    #         all
    #     end
    # end

    scope :by_group, -> (group_id) { where(group_id: group_id) if group_id.present? }

    # def self.by_group(group_id)
    #     if group_id && !group_id.empty?
    #         where(group_id: group_id)
    #     else
    #         all
    #     end
    # end

    def gravatar
        hash = Digest::MD5.hexdigest(email.downcase)
        "https://www.gravatar.com/avatar/#{hash}"
    end
end
