class Array

  def injecty memo=self.first, &block
    return nil_if_empty_or_raise_error if !block_given?
    return yield if self.empty?

    self.evaluate_all_elements_with(memo, &block)
  end

  def nil_if_empty_or_raise_error
    return nil if self.empty?
    raise LocalJumpError, 'no block given'
  end

  def evaluate_all_elements_with memo, &block
    first_element_evaluated = yield memo, self.first
    return first_element_evaluated if self.length == 1

    self.drop(1).evaluate_all_elements_with(first_element_evaluated, &block)
  end

end
