class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :total_membership

  def total_membership
    "#{self.object.memberships.count}"
  end

end
