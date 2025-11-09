class PatternsController < ApplicationController
  before_action :set_pattern, only: %i[show update destroy]

  # GET /patterns
  def index
    if params[:q].present?
      @patterns = Pattern.search(params[:q]).order(created_at: :desc)
    else
      @patterns = Pattern.all.order(created_at: :desc)
    end
    render json: @patterns
  end



  # GET /patterns/:id
  def show
    yarn_estimate = YarnCalculator.estimate(
      @pattern.yarn_weight,
      @pattern.stitch_type,
      @pattern.size
    )

    render json: {
      pattern: @pattern,
      yarn_estimate: yarn_estimate
    }
  end

  # POST /patterns
  def create
    @pattern = Pattern.new(pattern_params)

    if @pattern.save
      render json: @pattern, status: :created
    else
      render json: { errors: @pattern.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /patterns/:id
  def update
    @pattern = Pattern.find(params[:id])
    if @pattern.update(pattern_params)
      render json: { pattern: @pattern }, status: :ok
    else
      render json: { errors: @pattern.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /patterns/:id
  def destroy
    @pattern.destroy!
    render json: { message: "Pattern successfully deleted." }
  end

  def recommendations
    recs = RecommendationSystem.similar_patterns(@pattern, Pattern.all)
    render json: recs.as_json(only: [:id, :title, :difficulty, :tags])
  end


  private

  def set_pattern
    @pattern = Pattern.find(params[:id])
  end

  def pattern_params
    params.require(:pattern).permit(
      :title, :source, :link, :user_id, :rating, :difficulty,
      :made, :tags, :yarn_weight, :stitch_type, :size, :notes
    )
  end
end
