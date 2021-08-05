class PicturesController < ApplicationController
  before_action :set_picture, only: %i[ show edit update destroy ]
#  skip_before_action :my_page_access, only: [:index, :new, :create, :show, :confirm]
  skip_before_action :my_user_page_access
  skip_before_action :my_picture_page_access, only: [:index, :new, :create, :show, :confirm]

  def index
    @pictures = Picture.all
  end
  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end
  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end
  def confirm
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
  end
  def edit
  end
  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    respond_to do |format|
      if @picture.save
        PostMailer.post_mailer(@picture).deliver
        format.html { redirect_to @picture, notice: "Picture was successfully created." }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: "Picture was successfully updated." }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: "Picture was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  private
  def set_picture
  @picture = Picture.find(params[:id])
  end
  def picture_params
  params.require(:picture).permit(:image, :comment, :image_cache)
  end
end
