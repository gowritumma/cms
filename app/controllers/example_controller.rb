class ExampleController < ApplicationController
  def index
  	@array = [1,2,3,4]
  end


  def show
  	render ('demo/index')
  end
end
