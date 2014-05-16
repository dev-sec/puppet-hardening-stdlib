Puppet::Parser::Functions::newfunction(:merge_hardening, :type => :rvalue) do |args|
  user_params = args[0]
  hardening_params = args[1]

  # return the merged value
  HardeningStdlib.deep_merge_hardening user_params, hardening_params
end

module HardeningStdlib
  extend self

  def deep_merge_hardening user_param, hardening_param
    # merge hashes
    if user_param.instance_of? Hash and
      hardening_param.instance_of? Hash

      # do a manual merge since we need to see what is set
      # or gets overwritten
      hardening_param.each do |k,v|
        # only set the hardening parameter, if the user
        # didn't define it himself
        if not user_param.key? k
          user_param[k] = v
          next
        end

        user_param[k] = deep_merge_hardening user_param[k], hardening_param[k]
      end

    else

      # merge simple values
      if user_param.nil?
        user_param = hardening_param
      end

      if user_param != hardening_param
        Puppet.warning "Hardening parameters: you already defined '#{user_param}' instead of '#{hardening_param}'."
      end

    end

    # finally return the merged result
    user_param
  end

end