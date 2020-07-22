class Mission < ApplicationRecord
    belongs_to :scientist
    belongs_to :planet

    validates_uniqueness_of :name, scope: [:planet_id, :scientist_id]
end
