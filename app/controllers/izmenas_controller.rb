class IzmenasController < ApplicationController

  def index
    @izmenas = Izmena.find_by_dokument_id(params[:id])
  end

  def new
    @izmena = Izmena.new
  end

  def rollback
    @izmena = Izmena.find(params[:nesto])
    @dokument = Dokument.find(params[:dokument_id])
    @dokument.update(title:@izmena.title, content:@izmena.content)
    redirect_to @dokument
  end

  def show
    puts "DOSAO JE OVDEEEEEEEEEEEEEEEEEEEEEE"

    @izmenas = Izmena.where(dokument_id: params[:dokument_id]).all
  end

  def destroy
    @izmena = Izmena.find(params[:id])
    @izmena.destroy

    redirect_to root_path
  end

end
