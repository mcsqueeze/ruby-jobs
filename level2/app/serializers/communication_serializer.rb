class CommunicationSerializer < ActiveModel::Serializer
  attributes :sent_at

  belongs_to :practitioner
end
