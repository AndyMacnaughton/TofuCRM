class DashboardController < ApplicationController
  before_filter :authorize
  layout "application"
end
