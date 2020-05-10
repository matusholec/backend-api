module Api
  class ContractsController < ApplicationController
    def index
      ::Api::Contracts::Index.new(self, params).call
    end
  end
end
