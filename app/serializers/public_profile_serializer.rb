class PublicProfileSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :username, :fullname, :avatar_url
end