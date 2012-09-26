class NinjasController < ApplicationController
  # GET /ninjas
  # GET /ninjas.json
  def index
    @clan = params[:clan_id]
    @ninjas = Ninja.find_all_by_clan_id(@clan)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ninjas }
    end
  end

  # GET /ninjas/1
  # GET /ninjas/1.json
  def show
    @clan = params[:clan_id]
    @ninja = Ninja.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ninja }
    end
  end

  # GET /ninjas/new
  # GET /ninjas/new.json
  def new
    @clan = params[:clan_id]
    @ninja = Ninja.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ninja }
    end
  end

  # GET /ninjas/1/edit
  def edit
    @clan = params[:clan_id]
    @ninja = Ninja.find(params[:id])
  end

  # POST /ninjas
  # POST /ninjas.json
  def create
    @clan = params[:clan_id]
    @ninja = Ninja.new(params[:ninja])

    respond_to do |format|
      if @ninja.save
        format.html { redirect_to clan_ninja_path(@clan, @ninja), notice: 'Ninja was successfully created.' }
        format.json { render json: @ninja, status: :created, location: @ninja }
      else
        format.html { render action: "new" }
        format.json { render json: @ninja.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ninjas/1
  # PUT /ninjas/1.json
  def update
    @clan = params[:clan_id]
    @ninja = Ninja.find(params[:id])

    respond_to do |format|
      if @ninja.update_attributes(params[:ninja])
        format.html { redirect_to clan_ninja_path(@clan, @ninja), notice: 'Ninja was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ninja.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ninjas/1
  # DELETE /ninjas/1.json
  def destroy
    @ninja = Ninja.find(params[:id])
    @ninja.destroy

    respond_to do |format|
      format.html { redirect_to ninjas_url }
      format.json { head :no_content }
    end
  end
end
