class Api::V1::VotersController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_filter :load_voter, only: [:show, :update]
  before_filter :restrict_access_to_voter, only: [:update, :show]

  def index
    @voters = Voter.all

    render json: @voters
  end

  # GET /voters/1
  # GET /voters/1.json
  def show
    @voter = Voter.find(params[:id])
    render json: @voter
  end

  # POST /voters
  # POST /voters.json
  def create
    @voter = Voter.new(voter_params)

    if @voter.save
      render json: @voter.as_json(include_token: true), status: :created, location: api_v1_voter_path(@voter)
    else
      render json: @voter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /voters/1
  # PATCH/PUT /voters/1.json
  def update
    @voter = Voter.find(params[:id])

    if @voter.update(voter_params)
      head :no_content
    else
      render json: @voter.errors, status: :unprocessable_entity
    end
  end


  private
    
  def voter_params
      params.require(:voter).permit(:name, :party)
  end

  def load_voter
    @voter = Voter.find(params[:id])
  end

  def restrict_access_to_voter
    unless @voter.token == params[:token]
      render nothing: true, status: :unauthorized
    end
  end

end
