class Array
  def injecty memo=self.first, &block
    return nil_or_raise_error if !block_given?
    return yield if self.empty?

    self.evaluate_all_elements_with(memo, &block)
  end

  def nil_or_raise_error
    return nil if self.empty?
    raise LocalJumpError, 'no block given'
  end

  def evaluate_all_elements_with memo, &block
    first_evaluated = yield memo, self.first
    return first_evaluated if self.length == 1

    self.drop(1).evaluate_all_elements_with(first_evaluated, &block)
  end
end