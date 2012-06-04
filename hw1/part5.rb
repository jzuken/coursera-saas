class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s
    # make sure it's a string
    attr_reader attr_name
    # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter

    class_eval %{
      def #{attr_name}=(value)
        if @#{attr_name + "_history"} == nil
          @#{attr_name + "_history"} = [nil, value]
        else
          @#{attr_name + "_history"}.push(value)
        end
        @#{attr_name} = value
      end  
    }
  end
end

# class Foo
  # attr_accessor_with_history :bar
# end
# 
# f = Foo.new
# f.bar = 1
# f.bar = 2
# print f.bar_history, "\n" # => should be [nil,1,2]
# 
# f = Foo.new
# f. bar = 4
# print f.bar_history, "\n" # => should be [nil,4]

class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.0}
  def method_missing(method_id)
    print method_id,"\n"
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
  
  def in (curr)
    print self,"\n"    
         
  end
end

print 5.dollars.in(:euros)

