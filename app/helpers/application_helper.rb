module ApplicationHelper
    def has_error?(resource, field)
        resource.errors.messages[field].present?
    end

    def get_error(resource, field)
        "#{field} ".capitalize + resource.errors.messages[field].join(', ')
    end
end
