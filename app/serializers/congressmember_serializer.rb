class CongressmemberSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :party, :phone
end
