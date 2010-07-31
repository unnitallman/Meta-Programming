class User
   def handle_can_methods(feature_name,args)
      p feature_name
      p args
   end

   def method_missing(method_name,*args)
     r  = /^can_(.*)/
     r1 = /^can_/
     method_name = method_name.to_s
     if method_name =~ r
        method_name.chop! if method_name[-1].chr == "?"
        handle_can_methods(method_name.gsub(r1,""),args)
     else
       super(method_name.to_sym,*args)
     end
   end

end

current_user = User.new

current_user.can_edit_this_topic?("unni","chutki","deepali")
current_user.can_i_fuckyou?
current_user.can_i_kick?

current_user.man_can
