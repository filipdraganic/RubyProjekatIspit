class DokumentsController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @dokuments = Dokument.joins(:users).where('users.id = :user_id', user_id: current_user.id)
  end

  def new
    @dokument = Dokument.new
  end

  def create
    # @users = User.find(current_user.id)
    # @dokument = @users.dokuments.create(dokument_params.permit(:title, :content))

    @dokument = Dokument.new(dokument_params)
    current_user.dokuments << @dokument
    if @dokument.save
      redirect_to @dokument
    else
      render 'new'
    end
  end


  def show
    @user = User.find(current_user.id)
    dokuments = Dokument.joins(:users).where('users.id = :user_id', user_id: current_user.id)

    puts dokuments

    dokuments.class
    dokuments.first
    dokuments.class
    brojDokumenata = 0

    for x in dokuments do
      puts x.id
      puts params[:id]
      if x.id.to_s == params[:id].to_s
        puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
        brojDokumenata+=1
      end
    end

    puts brojDokumenata

    if brojDokumenata != 0
      @dokument = Dokument.find(params[:id])
      @users = User.joins(:dokuments).where('dokuments.id = :dokument_id', dokument_id: params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    @dokument = Dokument.find(params[:id])
    izmenaParametri = izmena_params
    izmenaParametri[:user_id] = current_user.id
    if (@izmena = @dokument.izmenas.create(izmenaParametri))
      if @dokument.update(dokument_params)
        redirect_to @dokument

      else
        render 'edit'
      end

    else
      render 'edit'

    end
  end

  def edit
    @dokument = Dokument.find(params[:id])

  end

  def destroy
    @dokument = Dokument.find(params[:id])
    @dokument.destroy

    redirect_to dokuments_path

  end

  def addKorisnik
    puts params[:q]
    @user = User.find_by_email(params[:q])
    @dokument = Dokument.find(params[:id])
    if @user != nil
      begin
        query = "INSERT INTO dokuments_users(user_id,dokument_id) VALUES(#{@user.id},#{params[:id]})"
        ActiveRecord::Base.connection.execute(query)
        rescue ActiveRecord::RecordNotUnique
          redirect_to root_path

      end

      redirect_to @dokument
    end
  end



  private



  def dokument_params
    params.require(:dokument).permit(:title, :content)
  end

  def izmena_params

    params.require(:dokument).permit(:title, :content, :id)
  end

end
