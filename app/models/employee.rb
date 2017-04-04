class Employee < ActiveRecord::Base
  has_many :pictures, as: :imageable

  def to_json
    serializable_hash.merge(pictures: pictures.map(&:serializable_hash))
  end
end
