class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # Remove or comment out the following line if it exists
  # primary_abstract_class
end
