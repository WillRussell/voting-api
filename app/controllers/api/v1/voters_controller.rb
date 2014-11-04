class Api::V1::VotersController < ApplicationController
  # GET /voters
  # GET /voters.json
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
      render json: @voter, status: :created, location: api_v1_voter_path(@voter)
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
end
