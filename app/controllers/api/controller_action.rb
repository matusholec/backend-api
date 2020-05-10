module Api
  class ControllerAction
    attr_reader :controller, :params

    delegate :request,
             :response,
             :render,
             :redirect_to,
             :head,
             to: :controller

    def initialize(controller, params)
      @controller = controller
      @params     = params
    end

    def expose(val, name)
      controller.instance_variable_set(name, val)
    end
  end
end
