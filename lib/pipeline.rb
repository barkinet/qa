require 'qa/pipeline/redcarpet_filter'

module Pipeline
  GENERIC_PIPELINE = HTML::Pipeline.new([
    QA::Pipeline::RedcarpetFilter,
    HTML::Pipeline::SanitizationFilter
  ], {})

  def self.generic_render(text)
    GENERIC_PIPELINE.call(text)[:output].to_s.html_safe
  end
end
