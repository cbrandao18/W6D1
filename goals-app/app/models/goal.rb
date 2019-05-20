# == Schema Information
#
# Table name: goals
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  body       :text             not null
#  completed  :boolean          default(FALSE), not null
#  public     :boolean          default(FALSE), not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Goal < ApplicationRecord
    validates :title, :body, :user_id, presence: true
    
    belongs_to :user
    
end
