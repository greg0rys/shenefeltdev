class Avo::ToolsController < Avo::ApplicationController
  def home
    @page_title = "Home"
    add_breadcrumb title: "Home"
  end
end
