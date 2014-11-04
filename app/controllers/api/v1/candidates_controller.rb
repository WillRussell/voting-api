class Api::V1::CandidatesController < ApplicationController
  # GET /candidates
  # GET /candidates.json
  def index
    @candidates = Candidate.all

    render json: @candidates
  end

  # GET /candidates/1
  # GET /candidates/1.json
  def show
    @candidate = Candidate.find(params[:id])
    render json: @candidate
  end


  private
    
    def candidate_params
      params.require(:candidate).permit(:name, :party)
    end
end
