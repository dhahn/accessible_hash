module AccessibleHash
  refine ::Hash do
    def method_missing(method_name, *args)
      if method_name =~ /[a-zA-Z0-9]+=$/
        self[method_name.to_s.delete('=').to_sym] = args.first
      elsif keys.include? method_name
        self[method_name]
      else
        super(method_name, *args)
      end
    end
  end
end
