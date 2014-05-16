Puppet::Parser::Functions::newfunction(:merge_hardening, :type => :rvalue) do |args|
  user_params = args[0]
  hardening_params = args[1]

  # merge hashes
  if user_params.instance_of? Hash and
     hardening_params.instance_of? Hash

     # do a manual merge since we need to see what is set
     # or gets overwritten
     hardening_params.each do |k,v|
       # only set the hardening parameter, if the user
       # didn't define it himself
       if not user_params.key? k
         user_params[k] = v
       end

       if user_params[k] != hardening_params[k]
         # print some Warning!
       end
     end


  else

    # merge simple values
    if user_params == undef
      user_params = hardening_params
    else

    if user_params != hardening_params
      # print some Warning!
    end

  end
  
  # return the merged value
  user_params
end