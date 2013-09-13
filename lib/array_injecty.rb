class Array
  def injecty memo=first, &block
    if !block_given?
      return nil if empty?
      raise LocalJumpError, 'no block given'
    elsif block_given?
      return yield if empty?
      first_evaluated = yield memo, first
      return first_evaluated if length == 1
      drop(1).injecty(first_evaluated, &block)
    end
  end
end