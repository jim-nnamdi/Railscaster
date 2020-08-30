class Entry < ApplicationRecord
    validates_presence_of :title 
    validates_presence_of :description
    validates_presence_of :author

    # addition of image
    has_one_attached :entryimage
end
