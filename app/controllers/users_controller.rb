class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index; end
end
