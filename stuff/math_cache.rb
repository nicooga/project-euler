module MathCache
  @cache = Hash.new({})
  def cache(function_name, &block)
    @@cache[function_name][self] ||= bock[a]
  end
end
