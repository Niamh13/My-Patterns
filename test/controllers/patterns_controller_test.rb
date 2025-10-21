require "test_helper"

class PatternsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pattern = patterns(:one)
  end

  test "should get index" do
    get patterns_url, as: :json
    assert_response :success
  end

  test "should create pattern" do
    assert_difference("Pattern.count") do
      post patterns_url, params: { pattern: { difficulty: @pattern.difficulty, link: @pattern.link, made: @pattern.made, notes: @pattern.notes, rating: @pattern.rating, size: @pattern.size, source: @pattern.source, stitch_type: @pattern.stitch_type, tags: @pattern.tags, title: @pattern.title, user_id: @pattern.user_id, yarn_estimate: @pattern.yarn_estimate, yarn_weight: @pattern.yarn_weight } }, as: :json
    end

    assert_response :created
  end

  test "should show pattern" do
    get pattern_url(@pattern), as: :json
    assert_response :success
  end

  test "should update pattern" do
    patch pattern_url(@pattern), params: { pattern: { difficulty: @pattern.difficulty, link: @pattern.link, made: @pattern.made, notes: @pattern.notes, rating: @pattern.rating, size: @pattern.size, source: @pattern.source, stitch_type: @pattern.stitch_type, tags: @pattern.tags, title: @pattern.title, user_id: @pattern.user_id, yarn_estimate: @pattern.yarn_estimate, yarn_weight: @pattern.yarn_weight } }, as: :json
    assert_response :success
  end

  test "should destroy pattern" do
    assert_difference("Pattern.count", -1) do
      delete pattern_url(@pattern), as: :json
    end

    assert_response :no_content
  end
end
