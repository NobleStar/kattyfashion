class Admin::ImagesController < ApplicationController
  def index
    @images = Portfolio.find(params[:portfolio_id]).images;
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @images.map{|image| image.to_jq_upload} }
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/new
  # GET /images/new.json
  def new
    @image = Image.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/1/edit
  def edit
    @image = Image.find(params[:id])
  end

  def fetch
    @image = Image.find(params[:id])
    respond_to do |format|
      format.json { render json: @image }
    end
  end

  def update_info
    @image = Image.find( params[:id] )
    respond_to do |format|
      if @image.update_attributes( params.require(:image).permit(:title, :description))
        format.json { render json: @image }
      else
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /images
  # POST /images.json
  def create
    failed = false
    index = params[:image][:index].to_i
    params[:image][:title] = params[:image][:title][index] 
    params[:image][:description] = params[:image][:description][index] 
    params[:image][:image] = params[:image][:image][0]
    # @image = Image.new(params[:image])
    @image = Image.new(params.require(:image).permit(:title, :description, :image, :portfolio_id))

    unless @image.save
      failed = true
    end
    

    respond_to do |format|
      if failed == false
        format.html {
          render :json => [@image.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [@image.to_jq_upload]}, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params.require(:image).permit(:title, :description, :portfolio_id, :image))
        format.html { redirect_to @image, notice: 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to images_url }
      format.json { head :no_content }
    end
  end 
end
