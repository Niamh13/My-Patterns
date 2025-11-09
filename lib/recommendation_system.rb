# lib/recommendation_system.rb
module RecommendationSystem
  def self.similar_patterns(pattern, all_patterns)
    # Simple example: find patterns with at least one tag in common and similar difficulty
    pattern_tags = pattern.tags.downcase.split(/,\s*/)

    all_patterns.select do |p|
      next if p.id == pattern.id
      other_tags = p.tags.downcase.split(/,\s*/)
      (pattern_tags & other_tags).any? && (p.difficulty - pattern.difficulty).abs <= 1
    end.first(5)  # return up to 5 recommendations
  end
end
