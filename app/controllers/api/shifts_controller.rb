module Api
  class ShiftsController < ApplicationController
    def index
      ::Api::Shifts::Index.new(self, params).call
    end
  end
end
