class Item < ActiveRecord::Base
  belongs_to :user

  default_scope { order('created_at DESC')}

  def completed?
    !completed_at.blank?    
  end
end
