# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :confirmable,
         :trackable,
         :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :articles, dependent: :destroy

  # That helps to ensure the uid not be blank
  # before_validation :set_uid

  # private

  # def set_uid
  #   self[:uid] = self[:email] if self[:uid].blank? && self[:email].present?
  # end
end
