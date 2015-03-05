require 'rest_client'
require 'json'
require 'cgi'


# TODO: Should put some documentation in here somewhere

module NordaraSOLVE360
  
  class API

    attr_accessor :user_api_token, :user_email,  :norada_solve_url

  
    def initialize(user_api_token, user_email)
      @norada_solve_url = 'https://secure.solve360.com/'
      @user_api_token    = user_api_token
      @user_email = user_email
    end

    def method_missing(method_name, *args)
	    if method_name.to_s =~ /^find_(.+)$/
	      find_method($1, *args)
	    elsif method_name.to_s =~ /^update_(.+)$/
        update_method($1, *args)
      elsif method_name.to_s =~ /^create_(.+)$/
        create_method($1, *args)
      elsif method_name.to_s =~ /^delete_(.+)$/
        delete_method($1, *args)
      else
	      super 
	    end
    end

    def call(method, method_url, params = {})
      begin
	      m_url = norada_solve_url
        m_url += method_url unless method.eql?(:put)

				resource = RestClient::Resource.new m_url, :user => user_email, :password => user_api_token

				if method == :get
					response_obj = resource.get :accept => 'application/json', :params => params
				elsif method == :put
          response_obj = resource[method_url].put params, :accept => 'application/json'
        elsif method == :post
          response_obj = resource.post params, :accept => 'application/json'
        elsif method == :delete
          response_obj = resource.delete :accept => 'application/json'
				end
      rescue Exception => e
      	raise "#{e}"
      end

      return JSON.parse response_obj
    end

    def method_url(method_name)
      method_components = method_name.to_s.split(/_/)
      murl = method_components.shift
      if method_components.size > 0
        murl += '/' + method_components.join('_')
      end

      murl
    end

    def update_method(method_name, *args)
      murl = method_url(method_name)

      arg = args[0]

      raise "Argument must be a number" if (!arg.is_a? Integer)

      murl += "/#{arg}"
      arg = args[1]
      
      call(:put, murl, arg)    
    end

    def create_method(method_name, *args)
      murl = method_url(method_name)

      arg = args[0]

      raise "Argument must be a hash" if (!arg.is_a? Hash)
      
      call(:post, murl, arg)    
    end


    def delete_method(method_name, *args)
      murl = method_url(method_name)

      arg = args[0]

      raise "Argument must be a number" if (!arg.is_a? Integer)

      murl += "/#{arg}"
      arg = args[1]
      
      call(:delete, murl, arg)    
    end

    def find_method(method_name, *args)
      murl = method_url(method_name)

			arg = args[0]

			if (!arg.is_a? Symbol) and (!arg.is_a? Integer)
        raise "Argument must be a :all or number"
      end

      if arg == :all
      	murl
      else
      	murl += "/#{arg}"
      end
			
			arg = args[1]
      
      call(:get, murl, arg)
    end



  end

  
  
end