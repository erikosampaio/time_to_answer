class AdminsBackoffice::SubjectsController < AdminsBackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]
  
  def index
    @subjects = Subject.all.page params[:page]
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(params_subject)
    if @subject.save
      redirect_to admins_backoffice_subject_path, notice: "Assunto/Área criado com sucesso!"
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @subject.update(params_subject)
      redirect_to admins_backoffice_subjects_path, notice: "Assunto/Área atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @subject.destroy
      redirect_to admins_backoffice_subjects_path, notice: "Assunto/Área deletado com sucesso!"
    else
      render :index
    end
  end

  private

  def params_admin
    params.require(:subject).permit(:description)
  end

  def set_admin
    @subject = Subject.find(params[:id])
  end
end
