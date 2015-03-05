#Deployment Notes

Connect to Norada 360 Gem.

Prototype: Not gemified yet.
		
So Rails users; you can add it your vendor folder and then add this line to your gem file:

		gem 'nordara_solve_360', path: 'vendor/nordara_solve_360'

		CONNECT TO NORADA

    norada_api = NordaraSOLVE360::API.new(norada_service.api_key, norada_service.username)
   

    FIND
    members = norada_api.find_contacts(:all, {:layout => 1, :limit => limit_contact["count"], :filtermode => 'category', :filtervalue => category["id"]})
    norada_api.find_contacts_categories(:all)
    norada_api.find_contacts(norada_contact_id)

    CREATE & UPDATE
    tag_vars = {categories: {add: add_tag_arr}}
    norada_api.update_contacts(member.last["id"], tag_vars)
 		
 		norada_api.create_contacts_categories({:name => nvt})