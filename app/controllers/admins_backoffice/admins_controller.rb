class AdminsBackoffice::AdminsController < AdminsBackofficeController
  
  def index
    @admins = Admin.all
  end

  def edit
    # aojodfjsfo
  end
end
