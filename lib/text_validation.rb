module TextValidation
  def self.included(base)
    base.validates_format_of :body, :without => /kitten/, :notice => "Failed Validation!"
  end
end