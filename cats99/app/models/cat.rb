require 'action_view'
require 'action_view/helpers'
include ActionView::Helpers::DateHelper

class Cat < ApplicationRecord

    @@CAT_COLORS = ['white', 'black', 'brown', 'orange', 'grey', 'tuxedo', 'calico']

    validates :birth_date, :color, :name, :sex, :description, presence:true
    validates :color, inclusion: { in: @@CAT_COLORS,
        message: "%{value} is not a valid color" }
    validates :sex, inclusion: { in: ['M', 'F'],
        message: "%{value} is not a valid sex" }

    def age 
        from_time = :birth_date
        distance_of_time_in_words(from_time, Time.now)
    end
end