class Entry < ApplicationRecord
    validates_presence_of :title 
    validates_presence_of :description
    validates_presence_of :author
end
