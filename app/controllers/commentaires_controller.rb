class CommentairesController < ApplicationController
  def show
  end

  def create
  	 @commentaire = Commentaire.new
  end
end
