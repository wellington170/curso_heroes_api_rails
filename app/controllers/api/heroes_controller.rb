class Api::HeroesController < ApplicationController
  #Não deveria ser um require com o caminho da pasta?
  include Authenticable
  before_action :authenticate_with_token #, except: [:index, :show]
  before_action :set_hero, only: %i[ show update destroy ]

  # GET /heroes
  def index
    @heroes = Hero.search_by_name(params[:term]).sort_by_name

    render json: @heroes
  end

  # GET /heroes/1
  def show
    render json: @hero
  end

  # POST /heroes
  def create
    @hero = Hero.new(hero_params)

    if @hero.save
      #Onde esse api_hero_url foi declarado? 
      render json: @hero, status: :created, location: api_hero_url(@hero)
    else
      render json: @hero.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /heroes/1
  def update
    if @hero.update(hero_params)
      render json: @hero
    else
      render json: @hero.errors, status: :unprocessable_content
    end
  end

  # DELETE /heroes/1
  def destroy
    @hero.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hero
      @hero = Hero.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def hero_params
      params.expect(hero: [ :name ])
    end
end
